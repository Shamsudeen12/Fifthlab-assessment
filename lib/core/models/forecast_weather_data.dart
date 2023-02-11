import 'package:fifthlab_assessment/core/api/response/forecast_weather/forecast_weather_response.dart';

import 'weather_data.dart';

class ForecastWeatherData {
  const ForecastWeatherData({
    required this.list,
  });

  final List<WeatherData> list;

  factory ForecastWeatherData.from(ForecastWeatherResponse forecastWeatherResponse) =>
      ForecastWeatherData(
        list: forecastWeatherResponse.list
            .map((data) => WeatherData.fromWeatherResponse(data))
            .toList(),
      );
}
