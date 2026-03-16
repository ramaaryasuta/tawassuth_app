import 'package:equatable/equatable.dart';

class Hijri extends Equatable {
  final String date;
  final String format;
  final String day;
  final HijriWeekday weekday;
  final HijriMonth month;
  final String year;
  final HijriDesignation designation;
  // final List<String> holidays;
  // final List<String> adjustedHolidays;
  final String method;

  const Hijri({
    required this.date,
    required this.format,
    required this.day,
    required this.weekday,
    required this.month,
    required this.year,
    required this.designation,
    // required this.holidays,
    // required this.adjustedHolidays,
    required this.method,
  });

  factory Hijri.empty() => const Hijri(
    date: '',
    format: '',
    day: '',
    weekday: HijriWeekday(en: '', ar: ''),
    month: HijriMonth(number: 0, en: '', ar: '', days: 0),
    year: '',
    designation: HijriDesignation(abbreviated: '', expanded: ''),
    // holidays: [],
    // adjustedHolidays: [],
    method: '',
  );

  @override
  List<Object?> get props => [
    date,
    format,
    day,
    weekday,
    month,
    year,
    designation,
    // holidays,
    // adjustedHolidays,
    method,
  ];
}

class HijriWeekday extends Equatable {
  final String en;
  final String ar;

  const HijriWeekday({required this.en, required this.ar});

  @override
  List<Object?> get props => [en, ar];
}

class HijriMonth extends Equatable {
  final int number;
  final String en;
  final String ar;
  final int days;

  const HijriMonth({
    required this.number,
    required this.en,
    required this.ar,
    required this.days,
  });

  @override
  List<Object?> get props => [number, en, ar, days];
}

class HijriDesignation extends Equatable {
  final String abbreviated;
  final String expanded;

  const HijriDesignation({required this.abbreviated, required this.expanded});

  @override
  List<Object?> get props => [abbreviated, expanded];
}
