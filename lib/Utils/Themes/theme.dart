

import 'package:flutter/cupertino.dart';

class Themes{
  LinearGradient dayColor =  LinearGradient(
  colors: [
  const Color(0xffFFFFFF).withOpacity(.7),
  const Color(0xffe5e5e5).withOpacity(.5)
  ],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
  );

  LinearGradient nightColor = LinearGradient(
    colors: [
      const Color(0xffFFFFFF).withOpacity(.7),
      const Color(0xff000000).withOpacity(.5)
    ],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
  );

  LinearGradient dayBackground = const LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        Color(0xff47BFDF),
        Color(0xff4A91FF),
      ]);

  LinearGradient nightBackground = const LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        Color(0xff3898b0),
        Color(0xff090909),
      ]);
}