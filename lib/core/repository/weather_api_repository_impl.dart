import 'package:fifthlab_assessment/constants/constants_exports.dart';
import 'package:fifthlab_assessment/core/api/response/current_weather/current_weather_response.dart';
import 'package:fifthlab_assessment/core/api/weather_api_manager.dart';
import 'package:fifthlab_assessment/core/models/weather_data.dart';
import 'package:fifthlab_assessment/config/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:fifthlab_assessment/core/repository/weather_api_repository.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';

@Named(AppStrings.implRepo)
@LazySingleton(as: WeatherApiRepository)
class WeatherApiRepositoryImpl extends WeatherApiRepository {
  final WeatherApiManager _weatherApiManager;

  WeatherApiRepositoryImpl(this._weatherApiManager);

  Future<WeatherData> _getCurrentWeather() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      CurrentWeatherResponse response = await _weatherApiManager.getCurrentWeatherData(
        position.latitude,
        position.longitude,
        dotenv.env[BaseApiConstants.apiKey]!,
      );

      return WeatherData.fromWeatherResponse(response);
    } catch (err) {
      if (err is Failure) rethrow;
      throw Failure.fromException(err as Exception);
    }
  }

  @override
  Future<Either<Failure, WeatherData>> getCurrentWeather() async {
    final Either<Failure, WeatherData> result = await Task(() => _getCurrentWeather())
        .attempt()
        .map(
          (either) => either.leftMap(
            (obj) {
              try {
                return obj as Failure;
              } catch (err) {
                throw obj;
              }
            },
          ),
        )
        .run();

    return result;
  }
}
