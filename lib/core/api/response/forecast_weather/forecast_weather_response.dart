import 'package:fifthlab_assessment/core/api/response/current_weather/current_weather_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'forecast_weather_response.g.dart';

@JsonSerializable()
class ForecastWeatherResponse {
  const ForecastWeatherResponse({
    required this.list,
  });

  final List<CurrentWeatherResponse> list;

  factory ForecastWeatherResponse.fromJson(Map<String, dynamic> json) =>
      _$ForecastWeatherResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastWeatherResponseToJson(this);
}
