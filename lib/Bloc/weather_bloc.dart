import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_weather_app_ui/Data/Cases/weather_icon.dart';
import '../Data/Models/weather_model.dart';
import '../Data/Repository/weather_repo.dart';
import '../Utils/Services/location_services.dart';
import '../Utils/Services/network_service.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitialState()) {
    Map<String, dynamic> cachedWeatherInfo = {"icon": "assets/default_icon.svg"};

    on<WeatherLoadEvent>((event, emit) async {
      emit(WeatherLoadingState());

      await NetworkConnectivity.checkConnectivity().then((internet) async {
        if (internet) {
          print("internet:::::$internet");
          try {
            DateTime now = DateTime.now();
            String formattedDate = DateFormat('d MMMM').format(now);

            // Get current location coordinates
            List<String> data = await LocationService().getAddress() ?? [];
            if (data.isEmpty || data.length < 2) {
              emit(WeatherErrorState(
                  error: "Failed to get location data\nPlease turn on location and refresh",
                  weatherinfo: cachedWeatherInfo));
              return;
            }

            double latitude = double.tryParse(data[0]) ?? 0.0;
            double longitude = double.tryParse(data[1]) ?? 0.0;

            // Fetch weather data
            WeatherDataModel? weatherDataModel = await WeatherRepository()
                .fetchWeatherData(latitude, longitude);

            if (weatherDataModel != null) {
              // Prepare weather info without Hive storage
              Map<String, String> weatherInfo = getWeatherInfo(
                  weatherDataModel.current?.weatherCode ?? 0);

              debugPrint("inside bloc ::::::::::: ${weatherInfo.toString()}");

              emit(WeatherLoadedState(
                data: data[2],
                date: formattedDate,
                weatherinfo: weatherInfo,
                weatherDataModel: weatherDataModel,
              ));
            } else {
              // Handle case with no internet and no cached data

              emit(WeatherErrorState(
                error: "No internet connection. Please check your connection.",
                data: data[2],
                date: formattedDate,
                weatherinfo: cachedWeatherInfo,
              ));
            }
          } catch (e) {
            emit(WeatherErrorState(error: e.toString(), weatherinfo: cachedWeatherInfo));
          }
        } else {
          emit(WeatherErrorState(error: "No Internet Connection", weatherinfo: cachedWeatherInfo));
        }
      });
    });
  }
}
