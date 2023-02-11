import 'package:fifthlab_assessment/constants/constants_exports.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LocationDateWidget extends StatelessWidget {
  const LocationDateWidget({
    super.key,
    required this.country,
    required this.state,
    required this.date,
  });
  final String country;
  final String state;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat(DateFormat.ABBR_MONTH_WEEKDAY_DAY).format(date);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          '$state,\n$country',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 32.0,
            color: Colors.black.withOpacity(.8),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          formattedDate,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 12,
            color: AppColours.darkBlue,
          ),
        ),
      ],
    );
  }
}
