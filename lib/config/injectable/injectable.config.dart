// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:fifthlab_assessment/core/api/weather_api_manager.dart' as _i3;
import 'package:fifthlab_assessment/core/repository/weather_api_repository.dart'
    as _i4;
import 'package:fifthlab_assessment/core/repository/weather_api_repository_impl.dart'
    as _i5;
import 'package:fifthlab_assessment/views/screens/home/bloc/home_bloc.dart'
    as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of main-scope dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i3.WeatherApiManager>(() => _i3.WeatherApiManager.create());
  gh.lazySingleton<_i4.WeatherApiRepository>(
    () => _i5.WeatherApiRepositoryImpl(gh<_i3.WeatherApiManager>()),
    instanceName: 'impl',
  );
  gh.factory<_i6.HomeBloc>(
      () => _i6.HomeBloc(gh<_i4.WeatherApiRepository>(instanceName: 'impl')));
  return getIt;
}
