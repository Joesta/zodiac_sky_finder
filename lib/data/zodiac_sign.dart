import 'package:equatable/equatable.dart';

class ZodiacSign extends Equatable {
  final String name;
  final String symbol;
  final DateTime start;
  final DateTime end;
  final double raHours;
  final double decDegrees;

  const ZodiacSign({
    required this.name,
    required this.symbol,
    required this.start,
    required this.end,
    required this.raHours,
    required this.decDegrees,
  });

  @override
  List<Object?> get props => [name, symbol, start, end, raHours, decDegrees];
}