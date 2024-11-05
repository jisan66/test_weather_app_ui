part of 'weather_bloc.dart';

@immutable
abstract class WeatherState {}

class WeatherInitialState extends WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  final String data;
  final String date;
  final Map<String,dynamic> weatherinfo;
  final WeatherDataModel weatherDataModel;

  WeatherLoadedState({
    required this.date,
    required this.data,
    required this.weatherinfo,
    required this.weatherDataModel,
  });
}

class WeatherLoadedWithErrorState extends WeatherState {
  final String data;
  final String date;
  final Map<String,dynamic> weatherinfo;
  final String error;
  final WeatherDataModel weatherDataModel;

  WeatherLoadedWithErrorState({
    required this.date,
    required this.data,
    required this.weatherinfo,
    required this.error,
    required this.weatherDataModel,
  });
}

class WeatherErrorState extends WeatherState {

  final String error;
  final String? data;
  final String? date;
  final Map<String,dynamic> weatherinfo;
  final WeatherDataModel? weatherDataModel;

  WeatherErrorState({
    required this.error,
    this.date,
    this.data,
     required this.weatherinfo,
    this.weatherDataModel,});
}
