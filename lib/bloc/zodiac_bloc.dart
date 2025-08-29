import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../data/zodiac_sign.dart';
import '../data/zodiac_catalog.dart';
import '../services/sky_map_service.dart';

part 'zodiac_event.dart';
part 'zodiac_state.dart';

class ZodiacBloc extends Bloc<ZodiacEvent, ZodiacState> {
  final SkyMapService sky;
  ZodiacBloc({required this.sky}) : super(const ZodiacState.initial()) {
    on<ZodiacInit>(_onInit);
    on<ZodiacSetUserSign>(_onSetUserSign);
    on<ZodiacSetMonth>(_onSetMonth);
  }

  Future<void> _onInit(ZodiacInit event, Emitter<ZodiacState> emit) async {
    final now = DateTime.now();
    final current = signForDate(now);
    emit(state.copyWith(currentDate: now, currentSign: current, status: ZodiacStatus.loading));

    if (current != null) {
      final zodiacPos = await sky.resolve(current);
      emit(state.copyWith(raHours: zodiacPos.raHours, decDegrees: zodiacPos.decDegrees, status: ZodiacStatus.ready));
    } else {
      emit(state.copyWith(status: ZodiacStatus.ready));
    }
  }

  Future<void> _onSetUserSign(ZodiacSetUserSign event, Emitter<ZodiacState> emit) async {
    emit(state.copyWith(userSign: event.sign));
  }

  Future<void> _onSetMonth(ZodiacSetMonth event, Emitter<ZodiacState> emit) async {
    final picked = DateTime(DateTime.now().year, event.month, 15);
    final s = signForDate(picked);
    emit(state.copyWith(currentDate: picked, currentSign: s, status: ZodiacStatus.loading));

    if (s != null) {
      final zoadicPos = await sky.resolve(s);
      emit(state.copyWith(raHours: zoadicPos.raHours, decDegrees: zoadicPos.decDegrees, status: ZodiacStatus.ready));
    } else {
      emit(state.copyWith(status: ZodiacStatus.ready));
    }
  }
}