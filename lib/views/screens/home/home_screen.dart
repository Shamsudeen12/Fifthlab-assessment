import 'package:fifthlab_assessment/config/injectable/injectable.dart';
import 'package:fifthlab_assessment/constants/constants_exports.dart';
import 'package:fifthlab_assessment/views/screens/home/bloc/home_bloc.dart';
import 'package:fifthlab_assessment/views/widgets/widgets_exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rive/rive.dart' hide LinearGradient;

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeBloc>()
        ..add(
          const HomeEvent.startedEvent(),
        ),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Scaffold(
            body: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColours.backgroundOne,
                    AppColours.backgroundTwo,
                  ],
                  begin: AlignmentDirectional.topStart,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 100,
                    child: Opacity(
                      opacity: .5,
                      child: Image.asset(
                        AppImages.backgroundImage,
                        height: 500,
                        width: 500,
                      ),
                    ),
                  ),
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30.0,
                        vertical: 18.0,
                      ),
                      child: state.maybeWhen(
                        errorState: (message, _) {
                          return const RiveAnimation.asset(AppImages.errorAnim);
                        },
                        loadingState: () {
                          return const RiveAnimation.asset(AppImages.loadingAnim);
                        },
                        orElse: () {
                          return DefaultTabController(
                            length: 2,
                            child: Column(
                              children: [
                                TabBar(
                                  indicator: BoxDecoration(
                                    color: Colors.white.withOpacity(0.8),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  tabs: const [
                                    Tab(
                                      child: Text(
                                        AppStrings.currentTabTitle,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    Tab(
                                      child: Text(
                                        AppStrings.sevenDaysTabTitle,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: TabBarView(
                                    children: [
                                      const CurrentWeatherTab(),
                                      Container(),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
