import 'dart:developer' as dev;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_ai/firebase_ai.dart';
import 'package:firebase_core/firebase_core.dart';

import '../../../core/constants/app_constants.dart';

class RecipeSuggestion {
  const RecipeSuggestion({
    required this.title,
    required this.description,
    required this.ingredients,
    required this.steps,
    this.cookTime,
  });

  final String title;
  final String description;
  final List<String> ingredients;
  final List<String> steps;
  final String? cookTime;
}

class RecipeService {
  RecipeService({
    FirebaseFirestore? firestore,
  }) : _db = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _db;

  static const int dailyLimit = 50;
  static const String _counterCollection = 'app_config';
  static const String _counterDoc = 'recipe_counter';

  GenerativeModel? _model;

  GenerativeModel get _gemini {
    _model ??= FirebaseAI.googleAI().generativeModel(
      model: 'gemini-2.0-flash',
    );
    return _model!;
  }

  /// Returns true if we still have budget for today.
  Future<bool> hasQuota() async {
    try {
      final today = _todayKey();
      final doc = await _db.collection(_counterCollection).doc(_counterDoc).get();
      if (!doc.exists) return true;
      final data = doc.data()!;
      final date = data['date'] as String?;
      final count = (data['count'] as num?)?.toInt() ?? 0;
      if (date != today) return true;
      return count < dailyLimit;
    } catch (_) {
      return true;
    }
  }

  /// Increments the daily counter. Returns false if limit reached.
  Future<bool> _incrementCounter() async {
    try {
      final today = _todayKey();
      final ref = _db.collection(_counterCollection).doc(_counterDoc);
      final doc = await ref.get();

      if (!doc.exists || (doc.data()?['date'] as String?) != today) {
        await ref.set({'date': today, 'count': 1});
        return true;
      }

      final count = (doc.data()!['count'] as num?)?.toInt() ?? 0;
      if (count >= dailyLimit) return false;

      await ref.update({'count': FieldValue.increment(1)});
      return true;
    } catch (_) {
      return false;
    }
  }

  /// Generates recipe suggestions for expiring products.
  /// Returns null if quota exhausted.
  Future<List<RecipeSuggestion>?> suggest(List<String> productNames) async {
    if (productNames.isEmpty) return null;

    final allowed = await _incrementCounter();
    if (!allowed) {
      dev.log('RecipeService: Daily quota exhausted');
      return null;
    }

    try {
      final prompt = _buildPrompt(productNames);
      dev.log('RecipeService: Sending request for ${productNames.length} items');
      final response = await _gemini.generateContent([Content.text(prompt)]);
      final text = response.text;
      dev.log('RecipeService: Got response, length=${text?.length ?? 0}');
      if (text == null || text.isEmpty) return null;

      return _parseResponse(text);
    } catch (e) {
      dev.log('RecipeService: Error - $e');
      return null;
    }
  }

  String _buildPrompt(List<String> productNames) {
    final items = productNames.join(', ');
    return '''
You are a helpful cooking assistant. I have these items expiring soon: $items

Suggest 2-3 simple recipes that use one or more of these items. For each recipe provide:
- Title
- One-line description
- Cook time
- Ingredients list (include items beyond what I have)
- Steps (numbered, concise)

Prefer Indian/everyday recipes. Keep it practical and simple.

Format your response EXACTLY like this (no markdown, no extra text):
---
TITLE: Recipe Name
DESC: One line description
TIME: 15 mins
INGREDIENTS:
- ingredient 1
- ingredient 2
STEPS:
1. Step one
2. Step two
---
TITLE: Next Recipe
...
''';
  }

  List<RecipeSuggestion> _parseResponse(String text) {
    final recipes = <RecipeSuggestion>[];
    final blocks = text.split('---').where((b) => b.trim().isNotEmpty);

    for (final block in blocks) {
      final lines = block.trim().split('\n');
      String? title;
      String? desc;
      String? time;
      final ingredients = <String>[];
      final steps = <String>[];
      var section = '';

      for (final line in lines) {
        final trimmed = line.trim();
        if (trimmed.startsWith('TITLE:')) {
          title = trimmed.substring(6).trim();
          section = '';
        } else if (trimmed.startsWith('DESC:')) {
          desc = trimmed.substring(5).trim();
          section = '';
        } else if (trimmed.startsWith('TIME:')) {
          time = trimmed.substring(5).trim();
          section = '';
        } else if (trimmed == 'INGREDIENTS:') {
          section = 'ingredients';
        } else if (trimmed == 'STEPS:') {
          section = 'steps';
        } else if (section == 'ingredients' && trimmed.startsWith('-')) {
          ingredients.add(trimmed.substring(1).trim());
        } else if (section == 'steps' && RegExp(r'^\d+\.').hasMatch(trimmed)) {
          steps.add(trimmed.replaceFirst(RegExp(r'^\d+\.\s*'), ''));
        }
      }

      if (title != null && title.isNotEmpty) {
        recipes.add(RecipeSuggestion(
          title: title,
          description: desc ?? '',
          ingredients: ingredients,
          steps: steps,
          cookTime: time,
        ));
      }
    }

    return recipes;
  }

  String _todayKey() {
    final now = DateTime.now();
    return '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}';
  }
}
