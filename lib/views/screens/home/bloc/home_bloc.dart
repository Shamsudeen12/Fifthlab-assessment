import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:fifthlab_assessment/config/failure.dart';
import 'package:fifthlab_assessment/constants/constants_exports.dart';
import 'package:fifthlab_assessment/core/models/forecast_weather_data.dart';
import 'package:fifthlab_assessment/core/models/weather_data.dart';
import 'package:fifthlab_assessment/core/repository/weather_api_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final WeatherApiRepository _weatherApiRepository;

  late WeatherData weatherData;
  late ForecastWeatherData forecastWeatherData;

  HomeBloc(@Named(AppStrings.implRepo) this._weatherApiRepository) : super(const _Initial()) {
    on<_StartedEvent>(_onStarted);

    on<_LoadDataEvent>(_onLoadWeatherData);
  }

  Future<void> _onStarted(_StartedEvent event, Emitter<HomeState> emit) async {
    emit(const _LoadingState());
    var status = await Geolocator.requestPermission();

    if (status == LocationPermission.whileInUse) {
      add(const _LoadDataEvent());
    } else {
      emit(_ErrorState(
        message: AppStrings.noLocationAccessErrMsg,
        date: DateTime.now(),
      ));
    }
  }

  void _onLoadWeatherData(_LoadDataEvent event, Emitter<HomeState> emit) async {
    Either<Failure, WeatherData> response = await _weatherApiRepository.getCurrentWeather();

    response.fold((l) {
      emit(_ErrorState(
        message: l.message,
        date: DateTime.now(),
      ));
    }, (result) async {
      weatherData = result;
      emit(_LoadedState(weatherData: result));

      // Either<Failure, ForecastWeatherData> forecastResponse =
      //     await _weatherApiRepository.getForecastWeather();

      // forecastResponse.fold((l) {
      //   emit(_ErrorState(
      //     message: l.message,
      //     date: DateTime.now(),
      //   ));
      // }, (forecastResult) async {
      //   forecastWeatherData = forecastResult;
      // });
    });
  }
}
