part of 'zodiac_bloc.dart';

enum ZodiacStatus { idle, loading, ready }

class ZodiacState extends Equatable {
  final DateTime? currentDate;
  final ZodiacSign? currentSign;
  final ZodiacSign? userSign;
  final double? raHours;
  final double? decDegrees;
  final ZodiacStatus status;

  const ZodiacState({
    required this.currentDate,
    required this.currentSign,
    required this.userSign,
    required this.raHours,
    required this.decDegrees,
    required this.status,
  });

  const ZodiacState.initial()
      : currentDate = null,
        currentSign = null,
        userSign = null,
        raHours = null,
        decDegrees = null,
        status = ZodiacStatus.idle;

  ZodiacState copyWith({
    DateTime? currentDate,
    ZodiacSign? currentSign,
    ZodiacSign? userSign,
    double? raHours,
    double? decDegrees,
    ZodiacStatus? status,
  }) =>
      ZodiacState(
        currentDate: currentDate ?? this.currentDate,
        currentSign: currentSign ?? this.currentSign,
        userSign: userSign ?? this.userSign,
        raHours: raHours ?? this.raHours,
        decDegrees: decDegrees ?? this.decDegrees,
        status: status ?? this.status,
      );

  bool get isUserCurrent =>
      currentSign != null && userSign?.name == currentSign?.name;

  @override
  List<Object?> get props =>
      [currentDate, currentSign, userSign, raHours, decDegrees, status];
}
