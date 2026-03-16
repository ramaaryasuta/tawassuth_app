import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecase/get_prayer_time_usecase.dart';
import 'prayer_time_state.dart';

class PrayerTimeCubit extends Cubit<PrayerTimeState> {
  final GetPrayerTimeUsecase getPrayerTimeUsecase;

  PrayerTimeCubit({required this.getPrayerTimeUsecase})
    : super(PrayerTimeInitial());

  Future<void> getPrayerTime(double lat, double lng) async {
    emit(PrayerTimeLoading());

    try {
      final result = await getPrayerTimeUsecase(lat: lat, lang: lng);

      result.fold(
        (failure) => emit(PrayerTimeFailure(errorMsg: failure.message)),
        (data) => emit(PrayerTimeLoaded(prayerTimeData: data)),
      );
    } catch (e) {
      emit(PrayerTimeFailure(errorMsg: e.toString()));
    }
  }
}
