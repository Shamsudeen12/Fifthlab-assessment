import 'package:auto_route/auto_route.dart';
import 'package:fifthlab_assessment/views/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: [
    AutoRoute(
      page: HomeScreen,
      initial: true,
    ),
  ],
)
class AppRouter extends _$AppRouter {}
