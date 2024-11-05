Map<String, String> getWeatherInfo(double weatherCode) {
  switch (weatherCode.toInt()) {
    case 0:
      return {"icon_day": "assets/clear_sky.svg", "icon_night": "assets/night_clear_sky.svg","description": "Clear sky"};
    case 1:
      return {"icon_day": "assets/clear_sky.svg", "icon_night": "assets/night_clear_sky.svg", "description": "Mainly clear"};
    case 2:
      return {"icon_day": "assets/day_partly_cloudy.svg", "icon_night": "assets/night_partly_cloudy.svg","description": "Partly cloudy"};
    case 3:
      return {"icon_day": "assets/cloudy.svg", "icon_night": "assets/cloudy.svg", "description": "Overcast"};
    case 45:
      return {"icon_day": "assets/fog.svg", "icon_night": "assets/fog.svg", "description": "Fog"};
    case 48:
      return {"icon_day": "assets/fog.svg", "icon_night": "assets/fog.svg", "description": "Depositing rime fog"};
    case 51:
      return {"icon_day": "assets/drizzle.svg", "icon_night": "assets/drizzle.svg", "description": "Light drizzle"};
    case 53:
      return {"icon_day": "assets/drizzle.svg", "icon_night": "assets/drizzle.svg", "description": "Moderate drizzle"};
    case 55:
      return {"icon_day": "assets/day_drizzle.svg", "icon_night": "assets/night_drizzle.svg", "description": "Dense drizzle"};
    case 56:
      return {"icon_day": "assets/day_drizzle.svg", "icon_night": "assets/night_drizzle.svg", "description": "Light freezing drizzle"};
    case 57:
      return {"icon_day": "assets/day_drizzle.svg", "icon_night": "assets/night_drizzle.svg", "description": "Dense freezing drizzle"};
    case 61:
      return {"icon_day": "assets/day_slight_rain.svg", "icon_night": "assets/night_slight_rain.svg", "description": "Slight rain"};
    case 63:
      return {"icon_day": "assets/moderate_rain.svg", "icon_night": "assets/moderate_rain.svg", "description": "Moderate rain"};
    case 65:
      return {"icon_day": "assets/heavy_rain.svg", "icon_night": "assets/heavy_rain.svg", "description": "Heavy rain"};
    case 66:
      return {"icon": "assets/freezing_rain.svg", "description": "Light freezing rain"};
    case 67:
      return {"icon": "assets/freezing_rain.svg", "description": "Heavy freezing rain"};
    case 71:
      return {"icon": "assets/snow_fall.svg", "description": "Slight snowfall"};
    case 73:
      return {"icon": "assets/snow_fall.svg", "description": "Moderate snowfall"};
    case 75:
      return {"icon": "assets/snow_fall.svg", "description": "Heavy snowfall"};
    case 77:
      return {"icon": "assets/snow_grains.svg", "description": "Snow grains"};
    case 80:
      return {"icon_day": "assets/day_slight_rain.svg", "icon_night": "assets/night_slight_rain.svg", "description": "Slight rain showers"};
    case 81:
      return {"icon_day": "assets/moderate_rain.svg", "icon_night": "assets/moderate_rain.svg","description": "Moderate rain showers"};
    case 82:
      return {"icon_day": "assets/violent_rain_showers.svg", "icon_night": "assets/violent_rain_showers.svg", "description": "Violent rain showers"};
    case 85:
      return {"icon": "assets/snow_showers.svg", "description": "Slight snow showers"};
    case 86:
      return {"icon": "assets/snow_showers.svg", "description": "Heavy snow showers"};
    case 95:
      return {"icon_day": "assets/thunderstorm.svg", "icon_night": "assets/thunderstorm.svg", "description": "Thunderstorm"};
    default:
      return {"icon": "assets/default_icon.svg", "description": "Unknown weather condition"};
  }
}
