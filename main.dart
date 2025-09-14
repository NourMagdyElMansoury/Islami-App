import 'package:flutter/material.dart';
import 'package:islami/modules/layout/home.dart';
import 'package:islami/modules/splash_screen/splash_screen.dart';



void main() {
  runApp(Islami());
}

class Islami extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.route,
      routes: {
        SplashScreen.route: (_) => SplashScreen(),
        Home.route: (_) => Home(),
      },
    );
  }
}
