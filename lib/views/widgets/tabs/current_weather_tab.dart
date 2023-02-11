import 'package:fifthlab_assessment/constants/constants_exports.dart';
import 'package:fifthlab_assessment/views/widgets/widgets_exports.dart';
import 'package:flutter/material.dart';

class CurrentWeatherTab extends StatelessWidget {
  const CurrentWeatherTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LocationDateWidget(
            country: 'Sweden',
            state: 'Wroclaw',
            date: DateTime.now(),
          ),
          Flexible(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Image.asset(
                    AppImages.rainyDay,
                  ),
                ),
                const TemperatureDescriptionStatus(
                  temperature: 19,
                  description: 'Light Rain',
                ),
              ],
            ),
          ),
          PropertyListTile(
            title: AppStrings.wind,
            image: AppImages.windIcon,
            value: '19 metres / sec',
            color: Colors.red[900]!,
          ),
          const SizedBox(height: 14),
          PropertyListTile(
            title: AppStrings.humidity,
            image: AppImages.humidityIcon,
            value: '19 metres / sec',
            color: Colors.blue[600]!,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
