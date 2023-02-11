import 'package:fifthlab_assessment/core/api/response/current_weather/current_weather_response.dart';

class WeatherData {
  final double? temp;
  final int weatherConditionCode;
  final double? minTemp;
  final double? maxTemp;
  final String description;
  final DateTime date;
  final int? humidity;
  final double? windSpeed;

  const WeatherData({
    required this.weatherConditionCode,
    required this.temp,
    required this.minTemp,
    required this.maxTemp,
    required this.description,
    required this.date,
    required this.humidity,
    required this.windSpeed,
  });

  factory WeatherData.fromWeatherResponse(CurrentWeatherResponse response) {
    return WeatherData(
      weatherConditionCode: response.weather[0].id,
      temp: response.temperature?.currentTemperature,
      minTemp: response.temperature?.minimumTemperature,
      maxTemp: response.temperature?.maximumTemperature,
      description: response.weather[0].description,
      date: DateTime.fromMillisecondsSinceEpoch(response.dt * 1000),
      humidity: response.temperature?.humidity,
      windSpeed: response.wind?.speed,
    );
  }
}
