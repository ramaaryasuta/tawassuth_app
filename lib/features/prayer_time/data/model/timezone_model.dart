import '../../domain/entity/timezone.dart';

class TimezoneModel extends Timezone {
  const TimezoneModel({
    required super.name,
    required super.utcOffset,
    required super.abbreviation,
  });

  factory TimezoneModel.fromJson(Map<String, dynamic> json) {
    return TimezoneModel(
      name: json['name'],
      utcOffset: json['utc_offset'],
      abbreviation: json['abbreviation'],
    );
  }
}
