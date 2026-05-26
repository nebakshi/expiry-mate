import 'package:expiry_mate/features/expiry_parser/data/expiry_parser_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final parser = ExpiryParserService();

  DateTime? best(String raw) => parser.bestCandidate(raw)?.date;

  group('ExpiryParserService — PLAN §10 examples', () {
    test('EXP: DD/MM/YYYY', () {
      expect(best('EXP:12/08/2026'), DateTime(2026, 8, 12));
    });

    test('EXP DD-MM-YY (two-digit year)', () {
      expect(best('EXP 12-08-26'), DateTime(2026, 8, 12));
    });

    test('Use by DD MON YYYY', () {
      expect(best('Use by 24 AUG 2026'), DateTime(2026, 8, 24));
    });

    test('MFG MM/YYYY + best before N months', () {
      // 01/2026 + 9 months => Oct 2026, end-of-month convention.
      expect(best('MFG:01/2026 best before 9 months'), DateTime(2026, 10, 31));
    });

    test('PKD DD/MM/YYYY + N months', () {
      expect(best('PKD 15/05/2026 best before 12 months'),
          DateTime(2027, 5, 15));
    });

    test('Best before MON YYYY', () {
      expect(best('BB:DEC 2026'), DateTime(2026, 12, 31));
    });

    test('MFG DD/MM/YYYY + 3 months', () {
      expect(best('MFG 24/05/2026 best before 3 months'),
          DateTime(2026, 8, 24));
    });

    test('duration with no anchor date yields nothing', () {
      // "best before 6 months" alone cannot be anchored.
      expect(best('best before 6 months'), isNull);
    });
  });

  group('ExpiryParserService — robustness', () {
    test('returns empty list for non-date text', () {
      expect(parser.parse('no useful information here'), isEmpty);
    });

    test('DD/MM/YYYY is preferred over partial MM/YYYY interpretation', () {
      // Regression: 12/08/2026 must read as 12 Aug 2026, not Aug/2026 partial.
      expect(best('EXP 12/08/2026'), DateTime(2026, 8, 12));
    });

    test('explicit expiry outranks a loose date elsewhere in the text', () {
      final d = best('Packed 01/01/2026 EXP 31/12/2026');
      expect(d, DateTime(2026, 12, 31));
    });

    test('dot separator: DD.MM.YYYY', () {
      expect(best('EXP 12.08.2026'), DateTime(2026, 8, 12));
    });

    test('dot separator with 2-digit year: DD.MM.YY', () {
      expect(best('EXP 12.08.26'), DateTime(2026, 8, 12));
    });

    test('dash separator with 2-digit year: DD-MM-YY', () {
      expect(best('EXP 15-06-27'), DateTime(2027, 6, 15));
    });

    test('mixed separators from OCR noise: spaces around dots', () {
      expect(best('EXP 12 . 08 . 26'), DateTime(2026, 8, 12));
    });

    test('MON YY (2-digit year, text month)', () {
      expect(best('BB:DEC 26'), DateTime(2026, 12, 31));
    });

    test('MM/YY → last day of month', () {
      expect(best('EXP 08/26'), DateTime(2026, 8, 31));
    });

    test('DD.MON.YY format', () {
      expect(best('EXP 24.AUG.26'), DateTime(2026, 8, 24));
    });

    test('EX: shorthand with separator', () {
      expect(best('EX:12/08/2026'), DateTime(2026, 8, 12));
    });

    test('EX does not false-match EXTRA or similar', () {
      // "EXTRA VIRGIN OLIVE OIL" should not yield an expiry date from "EXTRA".
      expect(best('EXTRA VIRGIN OLIVE OIL'), isNull);
    });
  });
}
