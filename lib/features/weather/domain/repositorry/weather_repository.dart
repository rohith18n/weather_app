import 'package:dartz/dartz.dart';
import 'package:weather_app_tdd/core/errorr/failure.dart';
import 'package:weather_app_tdd/features/weather/domain/entities/weather.dart';

abstract class WeatherRepository {
  Future<Either<Failure, WeatherEntity>> getCurrentWeather(String cityName);
}
