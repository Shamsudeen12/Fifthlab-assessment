import 'package:fifthlab_assessment/constants/constants_exports.dart';
import 'package:fifthlab_assessment/utils/util_functions.dart';
import 'package:fifthlab_assessment/views/screens/home/bloc/home_bloc.dart';
import 'package:fifthlab_assessment/views/widgets/widgets_exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrentWeatherTab extends StatelessWidget {
  const CurrentWeatherTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<HomeBloc>(context);

    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LocationDateWidget(
            state: bloc.weatherData.name,
            date: bloc.weatherData.date,
          ),
          Flexible(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Image.asset(
                    getIcon(bloc.weatherData.weatherConditionCode.toString()),
                  ),
                ),
                TemperatureDescriptionStatus(
                  temperature: convertKelvinToCelcius(bloc.weatherData.temp?.toInt() ?? 0).toInt(),
                  description: bloc.weatherData.description,
                ),
              ],
            ),
          ),
          PropertyListTile(
            title: AppStrings.wind,
            image: AppImages.windIcon,
            value: '${bloc.weatherData.windSpeed} m / s',
            color: Colors.red[900]!,
          ),
          const SizedBox(height: 14),
          PropertyListTile(
            title: AppStrings.humidity,
            image: AppImages.humidityIcon,
            value: bloc.weatherData.humidity.toString(),
            color: Colors.blue[600]!,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
