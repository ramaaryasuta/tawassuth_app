import 'package:equatable/equatable.dart';

import 'hijri_date.dart';
import 'timezone.dart';

class PrayerTimeData extends Equatable {
  final Timezone timezone;
  final List<PrayerTime> prayerTimes;

  const PrayerTimeData({required this.timezone, required this.prayerTimes});

  @override
  List<Object?> get props => [timezone, prayerTimes];
}

class PrayerTime extends Equatable {
  final String date;
  final Hijri hijriDate;
  final Times times;

  const PrayerTime({
    required this.date,
    required this.times,
    required this.hijriDate,
  });

  @override
  List<Object?> get props => [date, times, hijriDate];
}

class Times extends Equatable {
  final String fajr;
  final String dhuhr;
  final String asr;
  final String maghrib;
  final String isha;

  const Times({
    required this.fajr,
    required this.dhuhr,
    required this.asr,
    required this.maghrib,
    required this.isha,
  });

  @override
  List<Object?> get props => [fajr, dhuhr, asr, maghrib, isha];
}
