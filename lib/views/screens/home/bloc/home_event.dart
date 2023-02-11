part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.startedEvent() = _StartedEvent;

  const factory HomeEvent.loadedEvent({
    required WeatherData weatherData,
  }) = _LoadedEvent;

  const factory HomeEvent.loadDataEvent() = _LoadDataEvent;
}
