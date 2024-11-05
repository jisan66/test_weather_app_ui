import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../Bloc/weather_bloc.dart';
import '../../../Utils/Themes/card_theme.dart';
import '../../../Utils/Themes/theme.dart';
import '../../../Widgets/my_custom_text.dart';



Widget buildErrorWeatherContent(BuildContext context, WeatherErrorState state, bool isDark) {
  return Container(
    height: MediaQuery.of(context).size.height,
    width: double.infinity,
    decoration: BoxDecoration(gradient: Themes().dayBackground),
    child: Stack(
      children: [
        Positioned(
          left: 0,
          top: 80,
          child: SvgPicture.asset(
            fit: BoxFit.fitHeight,
            'assets/line_1.svg',
          ),
        ),
        Positioned(
          right: 0,
          top: 30,
          child: SvgPicture.asset(
            fit: BoxFit.fitHeight,
            'assets/line_2.svg',
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                            left: 10,
                            top: 2,
                            child: SvgPicture.asset(
                              'assets/location.svg',
                              fit: BoxFit.fitHeight,
                              color: Colors.black.withOpacity(0.15),
                            ),
                          ),
                          SvgPicture.asset(
                            'assets/location.svg',
                            fit: BoxFit.contain,
                          ),
                        ],
                      ),
                      const SizedBox(width: 12),
                      MyText(
                        text:  state.weatherDataModel == null ? "Location Unknown" :  state.data!,
                        fontSize: 18,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60.0),
                    child: SvgPicture.asset(
                      state.weatherinfo!["icon"],
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          const Color(0xffFFFFFF).withOpacity(.7),
                          const Color(0xffe5e5e5).withOpacity(.5)
                        ],
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                      ),
                      borderRadius: BorderRadius.circular(28),
                    ),
                    child:Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            const Color(0xff47BFDF).withOpacity(.25),
                            const Color(0xff4A91FF).withOpacity(.25),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Center(
                        child:   state.weatherDataModel == null ?
                        const MyText(text: "Failed to get Location Data")
                            :
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(height: 12),
                            Expanded(
                              flex: 4,
                              child: Column(
                                children: [
                                  MyText(
                                    text: "Today, ${state.date}",
                                    fontSize: 20,
                                  ),
                                  MyText(
                                    text: "${state.weatherDataModel!.current?.temperature2M?.toInt() ?? 'N/A'}°",
                                    fontSize: 100,
                                    shadow: Shadow(
                                      offset: const Offset(-15.0, 15.0),
                                      blurRadius: 50.0,
                                      color: Colors.black.withOpacity(.2),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: MyText(
                                fontWeight: FontWeight.w600,
                                text: state.weatherinfo["description"],
                                fontSize: 24,
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Padding(
                                padding: const EdgeInsets.all(36.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: Stack(
                                                  alignment: Alignment.center,
                                                  children: [
                                                    Positioned(
                                                      left: 8,
                                                      top: 2,
                                                      child: SvgPicture.asset(
                                                        'assets/windy.svg',
                                                        fit: BoxFit.fitHeight,
                                                        color: Colors.black.withOpacity(0.15),
                                                      ),
                                                    ),
                                                    SvgPicture.asset(
                                                      'assets/windy.svg',
                                                      fit: BoxFit.fitHeight,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const Expanded(flex: 2, child: MyText(text: "Wind")),
                                              const Expanded(flex: 1, child: MyText(text: "|", fontSize: 12)),
                                              Expanded(
                                                flex: 3,
                                                child: MyText(text: "${state.weatherDataModel!.current?.windSpeed10M ?? 'N/A'} km/h"),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 12),
                                          Row(
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: Stack(
                                                  alignment: Alignment.center,
                                                  children: [
                                                    Positioned(
                                                      left: 10,
                                                      top: 2,
                                                      child: SvgPicture.asset(
                                                        'assets/drop.svg',
                                                        fit: BoxFit.fitHeight,
                                                        color: Colors.black.withOpacity(0.15),
                                                      ),
                                                    ),
                                                    SvgPicture.asset(
                                                      'assets/drop.svg',
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const Expanded(flex: 2, child: MyText(text: "Hum")),
                                              const Expanded(flex: 1, child: MyText(text: "|", fontSize: 12)),
                                              Expanded(
                                                flex: 3,
                                                child: MyText(text: "${state.weatherDataModel!.current?.relativeHumidity2M ?? 'N/A'} %"),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}