import 'package:mockito/annotations.dart';
import 'package:weather_app_tdd/features/weather/data/data_source/remote/remote_data_source.dart';
import 'package:weather_app_tdd/features/weather/domain/repositorry/weather_repository.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app_tdd/features/weather/domain/usecases/get_current_weather.dart';

@GenerateMocks(
  [
    WeatherRepository,
    WeatherRemoteDataSource,
    GetCurrentWeatherUseCase,
  ],
  customMocks: [MockSpec<http.Client>(as: #MockHttpClient)],
)
void main() {}
