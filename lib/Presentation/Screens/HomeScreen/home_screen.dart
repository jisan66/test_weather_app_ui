import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import '../../../Bloc/weather_bloc.dart';
import 'Screen_Widgets/error_screen.dart';
import 'Screen_Widgets/success_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<void> _refreshWeather(BuildContext context) async {
    context.read<WeatherBloc>().add(WeatherLoadEvent());
  }

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
                      if (state is WeatherLoadingState)
                        Center(
                          child: Lottie.asset(
                            'assets/sun_progress.json',
                            height: 150,
                            width: 150,
                          ),
                        )
                      else if (state is WeatherLoadedState)
                        buildWeatherContent(context, state, isDarkMode)
                      else if (state is WeatherErrorState)
                          buildErrorWeatherContent(context, state, isDarkMode)
                        else
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
