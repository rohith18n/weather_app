import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:weather_app_tdd/core/errorr/exeption.dart';
import 'package:weather_app_tdd/core/errorr/failure.dart';
import 'package:weather_app_tdd/features/weather/data/data_source/remote/remote_data_source.dart';
import 'package:weather_app_tdd/features/weather/domain/entities/weather.dart';
import 'package:weather_app_tdd/features/weather/domain/repositorry/weather_repository.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  final WeatherRemoteDataSource weatherRemoteDataSource;
  WeatherRepositoryImpl({required this.weatherRemoteDataSource});

  @override
  Future<Either<Failure, WeatherEntity>> getCurrentWeather(
      String cityName) async {
    try {
      final result = await weatherRemoteDataSource.getCurrentWeather(cityName);
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure('An error has occurred'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
