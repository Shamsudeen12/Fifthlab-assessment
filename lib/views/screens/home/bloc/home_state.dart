part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;

  const factory HomeState.loadingState() = _LoadingState;

  const factory HomeState.loadedState({required WeatherData weatherData}) = _LoadedState;

  const factory HomeState.errorState({
    required String message,
    required DateTime date,
  }) = _ErrorState;
}
