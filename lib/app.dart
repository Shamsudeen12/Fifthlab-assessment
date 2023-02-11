import 'package:auto_route/auto_route.dart';
import 'package:fifthlab_assessment/constants/app_fonts.dart';
import 'package:fifthlab_assessment/constants/constants_exports.dart';
import 'package:fifthlab_assessment/routing/app_router.dart';
import 'package:flutter/material.dart';

class WeatherForecastApp extends StatelessWidget {
  WeatherForecastApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: AppStrings.appTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: AppFonts.primaryFont,
      ),
      routerDelegate: AutoRouterDelegate(_appRouter),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
