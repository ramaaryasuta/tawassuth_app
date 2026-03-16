import 'package:dartz/dartz.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../../core/api/api_client.dart';
import '../../../../core/models/failure.dart';
import '../../../../core/models/typedef.dart';
import '../../../../utils/print_log.dart';
import '../../domain/entity/prayer_time.dart';
import '../../domain/repository/prayer_time_repository.dart';
import '../model/prayer_time_data_model.dart';

class PrayerTimeRepositoryImpl implements PrayerTimeRepository {
  final ApiClient apiClient;

  PrayerTimeRepositoryImpl({required this.apiClient});

  @override
  Future<Result<PrayerTimeData>> getPrayerTime({
    required double lat,
    required double long,
  }) async {
    String yyyymmNow =
        '${DateTime.now().year}-${DateTime.now().month.toString().padLeft(2, '0')}';

    try {
      final response = await apiClient.request(
        method: MHttpMethod.get,
        path:
            'https://islamicapi.com/api/v1/prayer-time/?lat=$lat&lon=$long.5835&date=$yyyymmNow&api_key=${dotenv.env['ISLAMIC_API_KEY']}',
      );

      if (response.statusCode != 200) {
        return Left(
          Failure(
            error: response.data['status'],
            message: response.data['message'],
          ),
        );
      }

      return Right(PrayerTimeDataModel.fromJson(response.data));
    } catch (e, s) {
      printLog('[getPrayerTime] error: $e, stack: $s');
      return Left(Failure(error: e.toString(), message: s.toString()));
    }
  }
}
