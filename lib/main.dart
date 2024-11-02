import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'my_custom_text.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  LinearGradient dayBackground = const LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        Color(0xff47BFDF),
        Color(0xff4A91FF),
      ]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(gradient: dayBackground),
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
                            // Shadow effect for "drop.svg"
                            Positioned(
                              left: 10,  // Offset x-axis
                              top: 2,    // Offset y-axis
                              child: SvgPicture.asset(
                                'assets/location.svg',
                                fit: BoxFit.fitHeight,
                                color: Colors.black.withOpacity(0.15), // Shadow color
                              ),
                            ),
                            SvgPicture.asset(
                              'assets/location.svg', // Main SVG image
                              fit: BoxFit.contain,
                            ),

                          ],
                        ),
                            const SizedBox(width: 12),
                            const MyText(
                              text: "Dhaka, Bangladesh",
                              fontSize: 18,
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 60.0),
                          child: SvgPicture.asset(
                            'assets/cloudy.svg', // Main SVG image
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          // This is the border thickness
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                const Color(0xffFFFFFF).withOpacity(.7),
                                const Color(0xffe5e5e5).withOpacity(.5)
                              ], // Your gradient colors
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                            ),
                            borderRadius: BorderRadius.circular(
                                28), // Outer border radius
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [
                                    const Color(0xff47BFDF).withOpacity(.25),
                                    const Color(0xff4A91FF).withOpacity(.25),
                                  ]),
                              // color: Colors.white70.withOpacity(1),
                              borderRadius: BorderRadius.circular(
                                  24), // Inner border radius, slightly less
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 12),
                                  Expanded(
                                    flex: 4,
                                    child: Column(
                                      children: [
                                        const MyText(
                                            text: "Today, 12 September",
                                            fontSize: 20),
                                        MyText(
                                          text: "  29°",
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
                                  const Expanded(
                                    flex: 1,
                                    child: MyText(
                                        fontWeight: FontWeight.w600,
                                        text: "Cloudy",
                                        fontSize: 24),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Padding(
                                      padding: const EdgeInsets.all(36.0),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      flex:1,
                                                      child: Stack(
                                                        alignment: Alignment.center,
                                                        children: [
                                                          // Offset shadow SVG behind the main SVG
                                                          Positioned(
                                                            left: 8,  // Offset x-axis
                                                            top: 2,    // Offset y-axis
                                                            child: SvgPicture.asset(
                                                              'assets/windy.svg',
                                                              fit: BoxFit.fitHeight,
                                                              color: Colors.black.withOpacity(0.15), // Shadow color
                                                            ),
                                                          ),
                                                          // Main SVG image
                                                          SvgPicture.asset(
                                                            'assets/windy.svg',
                                                            fit: BoxFit.fitHeight,
                                                          ),
                                                        ],
                                                      ),

                                                    ),
                                                    const Expanded(flex:2,child: MyText(text: "Wind")),
                                                    const Expanded(flex:1,child:MyText(text: "|", fontSize: 12)),
                                                    const Expanded(flex:3,child: MyText(text: "10 km/h")),
                                                  ],
                                                ),
                                                const SizedBox(height:12),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      flex:1,
                                                      child: Stack(
                                                        alignment: Alignment.center,
                                                        children: [
                                                          // Shadow effect for "drop.svg"
                                                          Positioned(
                                                            left: 10,  // Offset x-axis
                                                            top: 2,    // Offset y-axis
                                                            child: SvgPicture.asset(
                                                              'assets/drop.svg',
                                                              fit: BoxFit.fitHeight,
                                                              color: Colors.black.withOpacity(0.15), // Shadow color
                                                            ),
                                                          ),
                                                          SvgPicture.asset(
                                                            'assets/drop.svg', // Main SVG image
                                                            fit: BoxFit.contain,
                                                          ),

                                                        ],
                                                      ),
                                                    ),
                                                    const Expanded(flex:2,child: MyText(text: "Hum")),
                                                    const Expanded(flex:1,child: MyText(text: "|", fontSize: 12)),
                                                    const Expanded(flex:3,child: MyText(text: "54 %"))
                                                    
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 100,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
