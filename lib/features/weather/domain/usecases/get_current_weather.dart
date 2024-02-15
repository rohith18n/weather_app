import 'package:dartz/dartz.dart';
import 'package:weather_app_tdd/core/errorr/failure.dart';
import 'package:weather_app_tdd/features/weather/domain/entities/weather.dart';
import 'package:weather_app_tdd/features/weather/domain/repositorry/weather_repository.dart';

class GetCurrentWeatherUseCase {
  final WeatherRepository weatherRepository;

  GetCurrentWeatherUseCase(this.weatherRepository);

  Future<Either<Failure, WeatherEntity>> execute(String cityName) {
    return weatherRepository.getCurrentWeather(cityName);
  }
}
