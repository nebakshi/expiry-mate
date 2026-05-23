import '../domain/expiry_date_candidate.dart';

/// Parses raw OCR text from a product label into ranked expiry-date
/// candidates. India-first: DD/MM/YYYY is preferred over MM/DD/YYYY, and
/// "MFG + best before N months" duration math is supported (PLAN §10, §26.4).
///
/// Pure Dart, no plugins — fully unit-testable.
class ExpiryParserService {
  const ExpiryParserService();

  static const _months = <String, int>{
    'JAN': 1, 'FEB': 2, 'MAR': 3, 'APR': 4, 'MAY': 5, 'JUN': 6,
    'JUL': 7, 'AUG': 8, 'SEP': 9, 'SEPT': 9, 'OCT': 10, 'NOV': 11, 'DEC': 12,
  };

  /// Entry point. Returns candidates sorted by confidence (highest first).
  List<ExpiryDateCandidate> parse(String rawText) {
    final clean = _clean(rawText);
    if (clean.isEmpty) return const [];

    final candidates = <ExpiryDateCandidate>[];

    candidates.addAll(_explicitExpiry(clean));
    candidates.addAll(_useBy(clean));
    candidates.addAll(_bestBeforeDate(clean));
    candidates.addAll(_durationFromManufacture(clean));
    candidates.addAll(_looseDates(clean));

    // De-duplicate by date, keeping the highest-confidence source.
    final byDate = <String, ExpiryDateCandidate>{};
    for (final c in candidates) {
      final key = c.date.toIso8601String().substring(0, 10);
      final existing = byDate[key];
      if (existing == null || c.confidence > existing.confidence) {
        byDate[key] = c;
      }
    }

    final result = byDate.values.toList()
      ..sort((a, b) => b.confidence.compareTo(a.confidence));
    return result;
  }

  /// Convenience: best single guess, or null if nothing parsed.
  ExpiryDateCandidate? bestCandidate(String rawText) {
    final list = parse(rawText);
    return list.isEmpty ? null : list.first;
  }

  // ---- Step 1–3: clean + uppercase + strip noise (PLAN §10) ----
  String _clean(String raw) {
    var s = raw.toUpperCase();
    s = s.replaceAll(RegExp(r'[^A-Z0-9/\-.: ]'), ' ');
    s = s.replaceAll(RegExp(r'\s+'), ' ').trim();
    return s;
  }

  // ---- Step 4: explicit expiry (highest confidence) ----
  Iterable<ExpiryDateCandidate> _explicitExpiry(String s) sync* {
    final keyword = RegExp(
      r'(?:EXP(?:IRY)?|EXPIRES?|EXP\s*DATE)[:.\s]*([0-9A-Z/\-. ]{4,20})',
    );
    for (final m in keyword.allMatches(s)) {
      final d = _tryAnyDate(m.group(1)!);
      if (d != null) {
        yield ExpiryDateCandidate(
          date: d,
          sourceText: m.group(0)!.trim(),
          confidence: 0.95,
          parsingMethod: 'explicit_expiry',
        );
      }
    }
  }

  // ---- Step 5: use-by ----
  Iterable<ExpiryDateCandidate> _useBy(String s) sync* {
    final keyword = RegExp(
      r'(?:USE\s*BY|USE\s*BEFORE|CONSUME\s*BY)[:.\s]*([0-9A-Z/\-. ]{4,20})',
    );
    for (final m in keyword.allMatches(s)) {
      final d = _tryAnyDate(m.group(1)!);
      if (d != null) {
        yield ExpiryDateCandidate(
          date: d,
          sourceText: m.group(0)!.trim(),
          confidence: 0.9,
          parsingMethod: 'use_by',
        );
      }
    }
  }

  // ---- Step 6: best-before as an explicit date (e.g. "BB: DEC 2026") ----
  Iterable<ExpiryDateCandidate> _bestBeforeDate(String s) sync* {
    final keyword = RegExp(
      r'(?:BEST\s*BEFORE|BB|BBE|B/B)[:.\s]*([0-9A-Z/\-. ]{4,20})',
    );
    for (final m in keyword.allMatches(s)) {
      final tail = m.group(1)!;
      // Skip if this is a duration ("6 MONTHS"); handled separately.
      if (RegExp(r'\b\d+\s*(MONTH|MONTHS|YEAR|YEARS|DAYS?)\b').hasMatch(tail)) {
        continue;
      }
      final d = _tryAnyDate(tail);
      if (d != null) {
        yield ExpiryDateCandidate(
          date: d,
          sourceText: m.group(0)!.trim(),
          confidence: 0.85,
          parsingMethod: 'best_before_date',
        );
      }
    }
  }

  // ---- Step 7: MFG/PKD + duration → compute expiry ----
  Iterable<ExpiryDateCandidate> _durationFromManufacture(String s) sync* {
    final mfgMatch = RegExp(
      r'(?:MFG|MFD|MANUFACTURE[D]?|PKD|PACKED|PKG|PACKAGING|MADE)[:.\s]*([0-9A-Z/\-. ]{4,20})',
    ).firstMatch(s);

    final durMatch = RegExp(
      r'\b(\d{1,2})\s*(MONTH|MONTHS|YEAR|YEARS|DAYS?)\b',
    ).firstMatch(s);

    if (durMatch == null) return;

    final n = int.parse(durMatch.group(1)!);
    final unit = durMatch.group(2)!;
    final base = mfgMatch != null ? _tryAnyDate(mfgMatch.group(1)!) : null;

    if (base == null) return; // need an anchor date to compute from

    final expiry = _addDuration(base, n, unit);
    // Lower confidence: computed, not read directly.
    yield ExpiryDateCandidate(
      date: expiry,
      sourceText:
          '${mfgMatch!.group(0)!.trim()} + ${durMatch.group(0)!.trim()}',
      confidence: 0.7,
      parsingMethod: 'mfg_plus_duration',
    );
  }

  // ---- Step 8: any loose date not tied to a keyword (lowest confidence) ----
  Iterable<ExpiryDateCandidate> _looseDates(String s) sync* {
    for (final m in RegExp(r'\b(\d{1,2}[/\-.]\d{1,2}[/\-.]\d{2,4})\b')
        .allMatches(s)) {
      final d = _tryNumericDate(m.group(1)!);
      if (d != null) {
        yield ExpiryDateCandidate(
          date: d,
          sourceText: m.group(1)!,
          confidence: 0.45,
          parsingMethod: 'loose_numeric',
        );
      }
    }
    for (final m
        in RegExp(r'\b(\d{1,2})\s*([A-Z]{3,4})\s*(\d{2,4})\b').allMatches(s)) {
      final d = _buildDate(
        int.parse(m.group(1)!),
        _months[m.group(2)!],
        _yyyy(m.group(3)!),
      );
      if (d != null) {
        yield ExpiryDateCandidate(
          date: d,
          sourceText: m.group(0)!,
          confidence: 0.5,
          parsingMethod: 'loose_textmonth',
        );
      }
    }
  }

  // ---------- date builders ----------

  DateTime? _tryAnyDate(String chunk) {
    final c = chunk.trim();
    // Full numeric DD/MM/YYYY must be tried BEFORE the partial MM/YYYY branch,
    // otherwise "12/08/2026" wrongly matches "08/2026" as month/year.
    if (RegExp(r'\d{1,2}[/\-.]\d{1,2}[/\-.]\d{2,4}').hasMatch(c)) {
      final d = _tryNumericDate(c);
      if (d != null) return d;
    }
    // 24 AUG 2026
    final tm = RegExp(r'(\d{1,2})\s*([A-Z]{3,4})\s*(\d{2,4})').firstMatch(c);
    if (tm != null) {
      final d = _buildDate(
        int.parse(tm.group(1)!),
        _months[tm.group(2)!],
        _yyyy(tm.group(3)!),
      );
      if (d != null) return d;
    }
    // AUG 2026 / DEC 2026 → last day of that month
    final mm = RegExp(r'\b([A-Z]{3,4})\s*(\d{4})\b').firstMatch(c);
    if (mm != null && _months.containsKey(mm.group(1))) {
      final month = _months[mm.group(1)]!;
      final year = int.parse(mm.group(2)!);
      return DateTime(year, month + 1, 0); // day 0 of next month = last day
    }
    // MM/YYYY → last day of month
    final my = RegExp(r'\b(\d{1,2})[/\-.](\d{4})\b').firstMatch(c);
    if (my != null) {
      final month = int.parse(my.group(1)!);
      final year = int.parse(my.group(2)!);
      if (month >= 1 && month <= 12) return DateTime(year, month + 1, 0);
    }
    // numeric DD/MM/YYYY
    return _tryNumericDate(c);
  }

  /// India-first numeric parsing: assume DD/MM/YYYY. Falls back to MM/DD only
  /// when the first field can't be a day (>12) but second can.
  DateTime? _tryNumericDate(String chunk) {
    final m = RegExp(r'(\d{1,2})[/\-.](\d{1,2})[/\-.](\d{2,4})').firstMatch(chunk);
    if (m == null) return null;
    final a = int.parse(m.group(1)!);
    final b = int.parse(m.group(2)!);
    final y = _yyyy(m.group(3)!);

    // Prefer DD/MM.
    if (a >= 1 && a <= 31 && b >= 1 && b <= 12) return _buildDate(a, b, y);
    // Fall back to MM/DD if that's the only valid reading.
    if (b >= 1 && b <= 31 && a >= 1 && a <= 12) return _buildDate(b, a, y);
    return null;
  }

  DateTime? _buildDate(int day, int? month, int year) {
    if (month == null || month < 1 || month > 12) return null;
    if (day < 1 || day > 31) return null;
    final lastDay = DateTime(year, month + 1, 0).day;
    if (day > lastDay) return null;
    return DateTime(year, month, day);
  }

  int _yyyy(String raw) {
    final n = int.parse(raw);
    if (raw.length <= 2) return 2000 + n; // 26 -> 2026
    return n;
  }

  DateTime _addDuration(DateTime base, int n, String unit) {
    if (unit.startsWith('YEAR')) {
      return DateTime(base.year + n, base.month, base.day);
    }
    if (unit.startsWith('DAY')) {
      return base.add(Duration(days: n));
    }
    // months
    final total = base.month - 1 + n;
    final year = base.year + total ~/ 12;
    final month = total % 12 + 1;
    final lastDay = DateTime(year, month + 1, 0).day;
    final day = base.day > lastDay ? lastDay : base.day;
    return DateTime(year, month, day);
  }
}
