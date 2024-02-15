import 'package:get_it/get_it.dart';
import 'package:weather_app_tdd/features/weather/data/data_source/remote/remote_data_source.dart';
import 'package:weather_app_tdd/features/weather/data/repository/weather_repository_impl.dart';
import 'package:weather_app_tdd/features/weather/domain/repositorry/weather_repository.dart';
import 'package:weather_app_tdd/features/weather/domain/usecases/get_current_weather.dart';
import 'package:weather_app_tdd/features/weather/presentaion/bloc/weather/weather_bloc.dart';
import 'package:http/http.dart' as http;

final locator = GetIt.instance;

void setUpLocator() {
  // bloc

  locator.registerFactory(() => WeatherBloc(locator()));

  // usecase

  locator.registerLazySingleton(() => GetCurrentWeatherUseCase(locator()));

  // repositories

  locator.registerLazySingleton<WeatherRepository>(
      () => WeatherRepositoryImpl(weatherRemoteDataSource: locator()));

  // data source

  locator.registerLazySingleton<WeatherRemoteDataSource>(
      () => WeatherRemoteDataSourceImpl(client: locator()));

  // external

  locator.registerLazySingleton(() => http.Client());
}
