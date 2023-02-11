import 'package:fifthlab_assessment/core/api/entities/wind/wind.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:fifthlab_assessment/core/api/entities/temperature/temperature.dart';
import 'package:fifthlab_assessment/core/api/entities/weather/weather.dart';

part 'current_weather_response.g.dart';

@JsonSerializable()
class CurrentWeatherResponse {
  final List<Weather> weather;

  @JsonKey(name: 'main')
  final Temperature? temperature;

  @JsonKey(name: 'wind')
  final Wind? wind;

  final String name;

  final int dt;

  CurrentWeatherResponse({
    required this.name,
    required this.weather,
    this.temperature,
    required this.dt,
    this.wind,
  });

  factory CurrentWeatherResponse.fromJson(Map<String, dynamic> json) =>
      _$CurrentWeatherResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentWeatherResponseToJson(this);
}
