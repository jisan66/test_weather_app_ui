import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final Shadow? shadow;
  final FontWeight? fontWeight;
  const MyText({super.key, required this.text, this.fontSize, this.shadow, this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return  Text(text,textAlign : TextAlign.center,style: GoogleFonts.overpass(
      color: Colors.white,
      fontSize: fontSize ?? 20,
      fontWeight: fontWeight,
      shadows: <Shadow>[
        // Shadow(
        //   offset: Offset(10.0, 10.0),
        //   blurRadius: 3.0,
        //   color: Color.fromARGB(255, 0, 0, 0),
        // ),
        shadow ?? Shadow(
          offset: const Offset(-2.0, 3),
          blurRadius: 2.0,
          color: Colors.black.withOpacity(.125),
        ),
      ],
    ),);
  }
}
