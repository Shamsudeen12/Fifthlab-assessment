// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'temperature.g.dart';

@JsonSerializable()
class Temperature {
  @JsonKey(name: 'temp')
  final double? currentTemperature;

  @JsonKey(name: 'feels_like')
  final double? feelsLike;

  @JsonKey(name: 'temp_min')
  final double? minimumTemperature;

  @JsonKey(name: 'temp_max')
  final double? maximumTemperature;

  final int? humidity;

  Temperature({
    this.currentTemperature,
    this.feelsLike,
    this.minimumTemperature,
    this.maximumTemperature,
    this.humidity,
  });

  factory Temperature.fromJson(Map<String, dynamic> json) => _$TemperatureFromJson(json);

  Map<String, dynamic> toJson() => _$TemperatureToJson(this);
}
