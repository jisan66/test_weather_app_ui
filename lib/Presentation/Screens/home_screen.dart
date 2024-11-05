import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

import '../../Bloc/weather_bloc.dart';
import '../../Data/Cases/weather_icon.dart';
import '../../Data/Models/weather_model.dart';
import '../../Utils/Themes/card_theme.dart';
import '../../Widgets/my_custom_text.dart';
import 'Screen_Widgets/error_screen.dart';
import 'Screen_Widgets/success_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Function to trigger a weather reload event
  Future<void> _refreshWeather(BuildContext context) async {
    context.read<WeatherBloc>().add(WeatherLoadEvent());
  }

  // Function to load cached data if available
  // Future<WeatherLoadedState?> _loadCachedWeather() async {
  //   var box = Hive.box('weatherBox');
  //   String? storedData = box.get('weatherData');
  //
  //   if (storedData != null) {
  //     final cachedWeatherData = WeatherDataModel.fromJson(jsonDecode(storedData));
  //     final String date = DateFormat('d MMMM').format(DateTime.now());
  //     final String location = "Your Location"; // Update based on cached data if stored
  //
  //     Map<String, String> weatherInfo = getWeatherInfo(cachedWeatherData.current?.weatherCode ?? 0);
  //
  //     return WeatherLoadedState(
  //       data: location,
  //       date: date,
  //       weatherinfo: weatherInfo,
  //       weatherDataModel: cachedWeatherData,
  //     );
  //   }
  //   return null;
  // }

  Widget build(BuildContext context) {
    final isDarkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;
    print("is dark ? $isDarkMode");
    return Scaffold(
      body: Center(
        child: BlocProvider(
          create: (context) => WeatherBloc()..add(WeatherLoadEvent()),
          child: BlocBuilder<WeatherBloc, WeatherState>(
            builder: (context, state) {
              return RefreshIndicator(
                onRefresh: () => _refreshWeather(context),
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      if (state is WeatherLoadingState) // Show loading animation
                        Center(
                          child: Lottie.asset(
                            'assets/sun_progress.json',
                            height: 150,
                            width: 150,
                          ),
                        )
                      else if (state is WeatherLoadedState) // Show weather content
                        buildWeatherContent(context, state, isDarkMode)
                      else if (state is WeatherErrorState) // Handle error state
                          buildErrorWeatherContent(context, state, isDarkMode)
                        else // Fallback in case of unknown state
                          const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Text('Failed to fetch Data'),
                          ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

}
