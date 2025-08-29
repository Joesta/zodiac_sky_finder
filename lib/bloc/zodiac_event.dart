part of 'zodiac_bloc.dart';

abstract class ZodiacEvent extends Equatable {
  const ZodiacEvent();
  @override
  List<Object?> get props => [];
}

class ZodiacInit extends ZodiacEvent {
  const ZodiacInit();
}

class ZodiacSetUserSign extends ZodiacEvent {
  final ZodiacSign? sign;
  const ZodiacSetUserSign(this.sign);
  @override
  List<Object?> get props => [sign];
}

class ZodiacSetMonth extends ZodiacEvent {
  final int month;
  const ZodiacSetMonth(this.month);
  @override
  List<Object?> get props => [month];
}