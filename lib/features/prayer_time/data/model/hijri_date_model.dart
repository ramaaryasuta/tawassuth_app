import '../../domain/entity/hijri_date.dart';

class HijriModel extends Hijri {
  const HijriModel({
    required super.date,
    required super.format,
    required super.day,
    required super.month,
    required super.year,
    required super.designation,
    required super.weekday,
    // required super.adjustedHolidays,
    // required super.holidays,
    required super.method,
  });

  factory HijriModel.fromJson(Map<String, dynamic> json) {
    return HijriModel(
      date: json['date'],
      format: json['format'],
      day: json['day'],
      weekday: HijriWeekdayModel.fromJson(json['weekday']),
      month: HijriMonthModel.fromJson(json['month']),
      year: json['year'],
      designation: HijriDesign.fromJson(json['designation']),
      // adjustedHolidays: json['adjusted_holidays'] != []
      //     ? json['adjusted_holidays']
      //     : [],
      // holidays: json['holidays'] != [] ? json['holidays'] : [],
      method: json['method'],
    );
  }
}

class HijriWeekdayModel extends HijriWeekday {
  const HijriWeekdayModel({required super.ar, required super.en});

  factory HijriWeekdayModel.fromJson(Map<String, dynamic> json) {
    return HijriWeekdayModel(ar: json['ar'], en: json['en']);
  }
}

class HijriMonthModel extends HijriMonth {
  const HijriMonthModel({
    required super.ar,
    required super.en,
    required super.days,
    required super.number,
  });

  factory HijriMonthModel.fromJson(Map<String, dynamic> json) {
    return HijriMonthModel(
      ar: json['ar'],
      en: json['en'],
      days: json['days'],
      number: json['number'],
    );
  }
}

class HijriDesign extends HijriDesignation {
  const HijriDesign({required super.abbreviated, required super.expanded});

  factory HijriDesign.fromJson(Map<String, dynamic> json) {
    return HijriDesign(
      abbreviated: json['abbreviated'],
      expanded: json['expanded'],
    );
  }
}
