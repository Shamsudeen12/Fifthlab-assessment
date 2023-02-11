import 'package:dio/dio.dart';
import 'package:fifthlab_assessment/constants/constants_exports.dart';
import 'package:fifthlab_assessment/core/api/response/current_weather/current_weather_response.dart';
import 'package:fifthlab_assessment/core/api/response/forecast_weather/forecast_weather_response.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'weather_api_manager.g.dart';

@LazySingleton()
@RestApi(baseUrl: BaseApiConstants.baseURL)
abstract class WeatherApiManager {
  @GET(BaseApiConstants.currentWeatherEndpoint)
  Future<CurrentWeatherResponse> getCurrentWeatherData(
    @Query(BaseApiConstants.latQueryKey) double lat,
    @Query(BaseApiConstants.lonQueryKey) double lon,
    @Query(BaseApiConstants.apiQueryKey) String apiKey,
  );

  @GET(BaseApiConstants.forecastWeatherEndpoint)
  Future<ForecastWeatherResponse> getForecastWeatherData(
    @Query(BaseApiConstants.latQueryKey) double lat,
    @Query(BaseApiConstants.lonQueryKey) double lon,
    @Query(BaseApiConstants.apiQueryKey) String apiKey,
  );

  @factoryMethod
  static WeatherApiManager create() {
    final client = Dio(BaseOptions(
      baseUrl: dotenv.env[BaseApiConstants.baseURLKey] ?? AppStrings.emptyString,
      receiveTimeout: 60000,
      connectTimeout: 60000,
      sendTimeout: 60000,
    ));

    return _WeatherApiManager(client);
  }
}
