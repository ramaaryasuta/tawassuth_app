import '../../../../core/models/typedef.dart';
import '../entity/prayer_time.dart';

abstract class PrayerTimeRepository {
  const PrayerTimeRepository();

  Future<Result<PrayerTimeData>> getPrayerTime({
    required double lat,
    required double long,
  });
}
