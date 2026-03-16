import 'package:get_it/get_it.dart';

import 'core/api/api_client.dart';
import 'features/prayer_time/data/repository/prayer_time_repository_impl.dart';
import 'features/prayer_time/domain/repository/prayer_time_repository.dart';
import 'features/prayer_time/domain/usecase/get_prayer_time_usecase.dart';
import 'features/prayer_time/presentation/cubits/prayer_time_cubit.dart';

final sl = GetIt.instance;

Future<void> initializeServiceLocator() async {
  /// core
  sl.registerLazySingleton<ApiClient>(() => ApiClient());

  /// Repository
  sl.registerLazySingleton<PrayerTimeRepository>(
    () => PrayerTimeRepositoryImpl(apiClient: sl<ApiClient>()),
  );

  /// Usecase
  sl.registerLazySingleton<GetPrayerTimeUsecase>(
    () => GetPrayerTimeUsecase(sl<PrayerTimeRepository>()),
  );

  /// Cubit
  sl.registerFactory<PrayerTimeCubit>(
    () => PrayerTimeCubit(getPrayerTimeUsecase: sl<GetPrayerTimeUsecase>()),
  );
}
