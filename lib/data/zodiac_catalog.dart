import 'zodiac_sign.dart';
import '../core/utils.dart';
import 'package:intl/intl.dart';

final _date = (int m, int d) => DateTime(2000, m, d);
const _deg = 1.0;

final List<ZodiacSign> kZodiac = [
  ZodiacSign(name: 'Aries', symbol: '♈', start: _date(3, 21), end: _date(4, 19), raHours: 2.5, decDegrees: 20 * _deg),
  ZodiacSign(name: 'Taurus', symbol: '♉', start: _date(4, 20), end: _date(5, 20), raHours: 4.5, decDegrees: 15 * _deg),
  ZodiacSign(name: 'Gemini', symbol: '♊', start: _date(5, 21), end: _date(6, 20), raHours: 7.0, decDegrees: 20 * _deg),
  ZodiacSign(name: 'Cancer', symbol: '♋', start: _date(6, 21), end: _date(7, 22), raHours: 8.5, decDegrees: 20 * _deg),
  ZodiacSign(name: 'Leo', symbol: '♌', start: _date(7, 23), end: _date(8, 22), raHours: 10.5, decDegrees: 12 * _deg),
  ZodiacSign(name: 'Virgo', symbol: '♍', start: _date(8, 23), end: _date(9, 22), raHours: 12.5, decDegrees: -5 * _deg),
  ZodiacSign(name: 'Libra', symbol: '♎', start: _date(9, 23), end: _date(10, 22), raHours: 14.5, decDegrees: -15 * _deg),
  ZodiacSign(name: 'Scorpio', symbol: '♏', start: _date(10, 23), end: _date(11, 21), raHours: 16.5, decDegrees: -30 * _deg),
  ZodiacSign(name: 'Sagittarius', symbol: '♐', start: _date(11, 22), end: _date(12, 21), raHours: 18.0, decDegrees: -25 * _deg),
  ZodiacSign(name: 'Capricorn', symbol: '♑', start: _date(12, 22), end: _date(1, 19), raHours: 21.0, decDegrees: -15 * _deg),
  ZodiacSign(name: 'Aquarius', symbol: '♒', start: _date(1, 20), end: _date(2, 18), raHours: 22.5, decDegrees: -10 * _deg),
  ZodiacSign(name: 'Pisces', symbol: '♓', start: _date(2, 19), end: _date(3, 20), raHours: 0.5, decDegrees: 5 * _deg),
];

ZodiacSign? signForDate(DateTime date) {
  for (final s in kZodiac) {
    if (isDateWithinRange(date, s.start, s.end)) return s;
  }
  return null;
}

String formatRa(double raHours) {
  final h = raHours.floor();
  final m = ((raHours - h) * 60).round();
  return '${h}h ${m}m';
}

String formatDec(double dec) {
  final d = dec.truncate();
  final m = ((dec - d) * 60).abs().round();
  final sign = dec >= 0 ? '+' : '−';
  return '$sign${d.abs()}° ${m}\'';
}

String monthSpan(ZodiacSign s) {
  final f = DateFormat.MMMd();
  return '${f.format(s.start)} – ${f.format(s.end)}';
}