import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:test_weather_app_ui/Data/Cases/weather_icon.dart';
import '../Data/Models/weather_model.dart';
import '../Data/Repository/weather_repo.dart';
import '../Utils/location_services.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitialState()) {
    Map<String, dynamic> cachedWeatherInfo = {"icon": "assets/default_icon.svg", "description": "Unknown weather condition"};
    on<WeatherLoadEvent>((event, emit) async {
      emit(WeatherLoadingState());

      try {
        DateTime now = DateTime.now();
        String formattedDate = DateFormat('d MMMM').format(now);

        // Get current location coordinates
        List<String> data = await LocationService().getAddress() ?? [];
        if (data.isEmpty || data.length < 2) {
          emit(WeatherErrorState(error: "Failed to get location data", weatherinfo: cachedWeatherInfo));
          return;
        }

        double latitude = double.tryParse(data[0]) ?? 0.0;
        double longitude = double.tryParse(data[1]) ?? 0.0;

        // Fetch weather data
        WeatherDataModel? weatherDataModel = await WeatherRepository().fetchWeatherData(latitude, longitude);

        // Open Hive box
        var box = Hive.box('weatherBox');

        if (weatherDataModel != null) {
          // Store weather data in Hive as a JSON string
          box.put('weatherData', jsonEncode(weatherDataModel.toJson()));

          // Prepare and emit loaded state
          Map<String, String> weatherInfo = getWeatherInfo(weatherDataModel.current?.weatherCode ?? 0);
          box.put('weatherInfo', weatherInfo);

          emit(WeatherLoadedState(
            data: data[2],
            date: formattedDate,
            weatherinfo: weatherInfo,
            weatherDataModel: weatherDataModel,
          ));
        } else{

        WeatherDataModel? weatherDataModel = box.get('weatherData') != null ? WeatherDataModel.fromJson(jsonDecode(box.get('weatherData'))) : null;
        Map<String, String> cachedWeatherInfo = box.get('weatherInfo') != null
            ? Map<String, String>.from(box.get('weatherInfo'))
            :  {"icon": "assets/default_icon.svg", "description": "Unknown weather condition"};
      // Emit error state if no data is returned


            if(weatherDataModel != null ){
            emit(WeatherErrorState(
              error: "No internet connection. Please check your connection.",
              data: data[2],
              date: formattedDate,
              weatherinfo: cachedWeatherInfo,
              weatherDataModel: weatherDataModel,
            ));
          }
            else {
              // Emit error state if no data is returned
              emit(WeatherErrorState(error: "No internet connection. Please check your connection.", weatherinfo: cachedWeatherInfo));
            }
        }
      } catch (e) {
        print(":this is only error");
        emit(WeatherErrorState(error: e.toString(), weatherinfo: cachedWeatherInfo));
      }
    });
  }
}
