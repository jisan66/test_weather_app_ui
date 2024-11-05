import 'dart:convert';

WeatherDataModel weatherDataModelFromJson(String str) => WeatherDataModel.fromJson(json.decode(str));

String weatherDataModelToJson(WeatherDataModel data) => json.encode(data.toJson());

class WeatherDataModel {
  double? latitude;
  double? longitude;
  double? generationtimeMs;
  double? utcOffsetSeconds;
  String? timezone;
  String? timezoneAbbreviation;
  double? elevation;
  CurrentUnits? currentUnits;
  Current? current;

  WeatherDataModel({
    this.latitude,
    this.longitude,
    this.generationtimeMs,
    this.utcOffsetSeconds,
    this.timezone,
    this.timezoneAbbreviation,
    this.elevation,
    this.currentUnits,
    this.current,
  });

  factory WeatherDataModel.fromJson(Map<String, dynamic> json) => WeatherDataModel(
    latitude: json["latitude"]?.toDouble(),
    longitude: json["longitude"]?.toDouble(),
    generationtimeMs: json["generationtime_ms"]?.toDouble(),
    utcOffsetSeconds: json["utc_offset_seconds"]?.toDouble(),
    timezone: json["timezone"],
    timezoneAbbreviation: json["timezone_abbreviation"],
    elevation: json["elevation"]?.toDouble(),
    currentUnits: json["current_units"] == null ? null : CurrentUnits.fromJson(json["current_units"]),
    current: json["current"] == null ? null : Current.fromJson(json["current"]),
  );

  Map<String, dynamic> toJson() => {
    "latitude": latitude,
    "longitude": longitude,
    "generationtime_ms": generationtimeMs,
    "utc_offset_seconds": utcOffsetSeconds,
    "timezone": timezone,
    "timezone_abbreviation": timezoneAbbreviation,
    "elevation": elevation,
    "current_units": currentUnits?.toJson(),
    "current": current?.toJson(),
  };
}

class Current {
  String? time;
  double? interval;
  double? temperature2M;
  double? relativeHumidity2M;
  double? isDay;
  double? rain;
  double? weatherCode;
  double? windSpeed10M;

  Current({
    this.time,
    this.interval,
    this.temperature2M,
    this.relativeHumidity2M,
    this.isDay,
    this.rain,
    this.weatherCode,
    this.windSpeed10M,
  });

  factory Current.fromJson(Map<String, dynamic> json) => Current(
    time: json["time"],
    interval: json["interval"]?.toDouble(),
    temperature2M: json["temperature_2m"]?.toDouble(),
    relativeHumidity2M: json["relative_humidity_2m"]?.toDouble(),
    isDay: json["is_day"]?.toDouble(),
    rain: json["rain"]?.toDouble(),
    weatherCode: json["weather_code"]?.toDouble(),
    windSpeed10M: json["wind_speed_10m"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "time": time,
    "interval": interval,
    "temperature_2m": temperature2M,
    "relative_humidity_2m": relativeHumidity2M,
    "is_day": isDay,
    "rain": rain,
    "weather_code": weatherCode,
    "wind_speed_10m": windSpeed10M,
  };
}

class CurrentUnits {
  String? time;
  String? interval;
  String? temperature2M;
  String? relativeHumidity2M;
  String? isDay;
  String? rain;
  String? weatherCode;
  String? windSpeed10M;

  CurrentUnits({
    this.time,
    this.interval,
    this.temperature2M,
    this.relativeHumidity2M,
    this.isDay,
    this.rain,
    this.weatherCode,
    this.windSpeed10M,
  });

  factory CurrentUnits.fromJson(Map<String, dynamic> json) => CurrentUnits(
    time: json["time"],
    interval: json["interval"],
    temperature2M: json["temperature_2m"],
    relativeHumidity2M: json["relative_humidity_2m"],
    isDay: json["is_day"],
    rain: json["rain"],
    weatherCode: json["weather_code"],
    windSpeed10M: json["wind_speed_10m"],
  );

  Map<String, dynamic> toJson() => {
    "time": time,
    "interval": interval,
    "temperature_2m": temperature2M,
    "relative_humidity_2m": relativeHumidity2M,
    "is_day": isDay,
    "rain": rain,
    "weather_code": weatherCode,
    "wind_speed_10m": windSpeed10M,
  };
}
