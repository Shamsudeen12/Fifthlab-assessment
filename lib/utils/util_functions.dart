import 'package:fifthlab_assessment/constants/constants_exports.dart';

double convertKelvinToCelcius(int temp) {
  return temp - 273;
}

String getIcon(String code) {
  if (code == '800') {
    return AppImages.clearDay;
  } else {
    switch (code[0]) {
      case '2':
        return AppImages.stormyDay;

      case '3':
      case '5':
        return AppImages.rainyDay;

      case '6':
        return AppImages.snowyDay;

      case '8':

      case '7':
        return AppImages.cloudyDay;

      default:
        return AppImages.clearDay;
    }
  }
}
