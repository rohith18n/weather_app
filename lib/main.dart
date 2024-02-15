import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_tdd/features/weather/presentaion/bloc/weather/weather_bloc.dart';
import 'package:weather_app_tdd/features/weather/presentaion/pages/weather_page.dart';
import 'package:weather_app_tdd/injection_container.dart';

void main() {
  setUpLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => locator<WeatherBloc>(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Weather app',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const WeatherPage(),
      ),
    );
  }
}
