import 'package:equatable/equatable.dart';
import '../../../core/extensions/date_extensions.dart';

/// PLAN §10 — a single parsed expiry guess with provenance + confidence.
class ExpiryDateCandidate extends Equatable {
  const ExpiryDateCandidate({
    required this.date,
    required this.sourceText,
    required this.confidence,
    required this.parsingMethod,
  });

  final DateTime date;
  final String sourceText;
  final double confidence; // 0..1
  final String parsingMethod;

  String get displayDate => date.displayDate;

  @override
  List<Object?> get props => [date, sourceText, confidence, parsingMethod];
}
