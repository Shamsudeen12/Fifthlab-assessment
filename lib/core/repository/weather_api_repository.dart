import 'package:dartz/dartz.dart';
import 'package:fifthlab_assessment/config/failure.dart';
import 'package:fifthlab_assessment/core/models/forecast_weather_data.dart';
import 'package:fifthlab_assessment/core/models/weather_data.dart';

abstract class WeatherApiRepository {
  Future<Either<Failure, WeatherData>> getCurrentWeather();

  Future<Either<Failure, ForecastWeatherData>> getForecastWeather();
}
