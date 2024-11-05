Map<String, String> getWeatherInfo(double weatherCode) {
  switch (weatherCode.toInt()) {
    case 0:
      return {"icon": "assets/clear_sky.svg", "description": "Clear sky"};
    case 1:
      return {"icon": "assets/partly_cloudy.svg", "description": "Mainly clear"};
    case 2:
      return {"icon": "assets/partly_cloudy.svg", "description": "Partly cloudy"};
    case 3:
      return {"icon": "assets/partly_cloudy.svg", "description": "Overcast"};
    case 45:
      return {"icon": "assets/fog.svg", "description": "Fog"};
    case 48:
      return {"icon": "assets/fog.svg", "description": "Depositing rime fog"};
    case 51:
      return {"icon": "assets/drizzle.svg", "description": "Light drizzle"};
    case 53:
      return {"icon": "assets/drizzle.svg", "description": "Moderate drizzle"};
    case 55:
      return {"icon": "assets/drizzle.svg", "description": "Dense drizzle"};
    case 56:
      return {"icon": "assets/freezing_drizzle.svg", "description": "Light freezing drizzle"};
    case 57:
      return {"icon": "assets/freezing_drizzle.svg", "description": "Dense freezing drizzle"};
    case 61:
      return {"icon": "assets/rain.svg", "description": "Slight rain"};
    case 63:
      return {"icon": "assets/rain.svg", "description": "Moderate rain"};
    case 65:
      return {"icon": "assets/rain.svg", "description": "Heavy rain"};
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
      return {"icon": "assets/rain_showers.svg", "description": "Slight rain showers"};
    case 81:
      return {"icon": "assets/rain_showers.svg", "description": "Moderate rain showers"};
    case 82:
      return {"icon": "assets/rain_showers.svg", "description": "Violent rain showers"};
    case 85:
      return {"icon": "assets/snow_showers.svg", "description": "Slight snow showers"};
    case 86:
      return {"icon": "assets/snow_showers.svg", "description": "Heavy snow showers"};
    case 95:
      return {"icon": "assets/thunderstorm.svg", "description": "Thunderstorm"};
    default:
      return {"icon": "assets/default_icon.svg", "description": "Unknown weather condition"};
  }
}
