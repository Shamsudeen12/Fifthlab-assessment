import 'package:fifthlab_assessment/constants/app_colours.dart';
import 'package:fifthlab_assessment/constants/constants_exports.dart';
import 'package:flutter/material.dart';

class TemperatureDescriptionStatus extends StatelessWidget {
  final int temperature;
  final String description;

  const TemperatureDescriptionStatus({
    super.key,
    required this.temperature,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Text(
              temperature.toString(),
              style: const TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              description,
              style: const TextStyle(
                color: AppColours.darkBlue,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
        const Text(
          AppStrings.degreeCelcius,
          style: TextStyle(
            fontSize: 20,
            color: AppColours.darkBlue,
          ),
        ),
      ],
    );
  }
}
