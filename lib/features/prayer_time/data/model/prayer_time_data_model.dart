import '../../domain/entity/prayer_time.dart';
import 'hijri_date_model.dart';
import 'timezone_model.dart';

class PrayerTimeDataModel extends PrayerTimeData {
  const PrayerTimeDataModel({
    required super.prayerTimes,
    required super.timezone,
  });

  factory PrayerTimeDataModel.fromJson(Map<String, dynamic> json) {
    return PrayerTimeDataModel(
      timezone: TimezoneModel.fromJson(json['timezone']),
      prayerTimes: (json['data'] as List<dynamic>)
          .map((e) => PrayerTimeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class PrayerTimeModel extends PrayerTime {
  const PrayerTimeModel({
    required super.date,
    required super.times,
    required super.hijriDate,
  });

  factory PrayerTimeModel.fromJson(Map<String, dynamic> json) {
    return PrayerTimeModel(
      date: json['date'],
      times: TimesModel.fromJson(json['times']),
      hijriDate: HijriModel.fromJson(json['hijri_date']['hijri']),
    );
  }
}

class TimesModel extends Times {
  const TimesModel({
    required super.fajr,
    required super.dhuhr,
    required super.asr,
    required super.maghrib,
    required super.isha,
  });

  factory TimesModel.fromJson(Map<String, dynamic> json) {
    return TimesModel(
      fajr: json['Fajr'] ?? '',
      dhuhr: json['Dhuhr'] ?? '',
      asr: json['Asr'] ?? '',
      maghrib: json['Maghrib'] ?? '',
      isha: json['Isha'] ?? '',
    );
  }
}
