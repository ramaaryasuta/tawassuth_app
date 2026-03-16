import '../../../../core/models/typedef.dart';
import '../entity/prayer_time.dart';
import '../repository/prayer_time_repository.dart';

class GetPrayerTimeUsecase {
  final PrayerTimeRepository prayerTimeRepository;

  GetPrayerTimeUsecase(this.prayerTimeRepository);

  Future<Result<PrayerTimeData>> call({
    required double lat,
    required double lang,
  }) {
    return prayerTimeRepository.getPrayerTime(lat: lat, long: lang);
  }
}
