import 'package:flutter/material.dart';
import 'package:islamy/screens/home.dart';
import 'package:islamy/screens/onboarding.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'onboarding',
      routes: {
        'home': (context) => Home(),
        'onboarding': (context) => OnboardingScreen(),
      },
      // home: OnboardingScreen(),
    );
  }
}
