import 'package:equatable/equatable.dart';

import '../../domain/entity/prayer_time.dart';

abstract class PrayerTimeState extends Equatable {
  const PrayerTimeState();
}

class PrayerTimeInitial extends PrayerTimeState {
  @override
  List<Object> get props => [];
}

class PrayerTimeLoading extends PrayerTimeState {
  @override
  List<Object> get props => [];
}

class PrayerTimeFailure extends PrayerTimeState {
  final String errorMsg;

  const PrayerTimeFailure({required this.errorMsg});

  @override
  List<Object> get props => [errorMsg];
}

class PrayerTimeLoaded extends PrayerTimeState {
  final PrayerTimeData prayerTimeData;

  const PrayerTimeLoaded({required this.prayerTimeData});

  @override
  List<Object> get props => [prayerTimeData];
}
