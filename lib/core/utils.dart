import 'package:intl/intl.dart';

String monthLabel(DateTime date) => DateFormat.MMMM().format(date);

bool isDateWithinRange(DateTime date, DateTime start, DateTime end) {
  final normalized = DateTime(2000, date.month, date.day);
  final s = DateTime(2000, start.month, start.day);
  final e = DateTime(2000, end.month, end.day);

  if (e.isAfter(s) || e.isAtSameMomentAs(s)) {
    return (normalized.isAfter(s) || normalized.isAtSameMomentAs(s)) &&
        (normalized.isBefore(e) || normalized.isAtSameMomentAs(e));
  } else {
    return normalized.isAfter(s) || normalized.isBefore(e) ||
        normalized.isAtSameMomentAs(s) || normalized.isAtSameMomentAs(e);
  }
}