import 'package:flutter/material.dart';
import 'package:islamy_tasks/ui/screens/main/main.dart';
import 'package:islamy_tasks/ui/screens/main/tabs/sebha/sebha.dart';
import 'package:islamy_tasks/ui/screens/onboarding.dart';
import 'package:islamy_tasks/ui/screens/splash/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(canvasColor: AppColors.gold),
      routes: {
        OnboardingScreen.routeName: (_) => const OnboardingScreen(),
        Splash.routeName: (_) => const Splash(),
        Main.routeName: (_) => const Main(),
        Sebha.routeName: (_) => const Sebha(),
      },
      initialRoute: Splash.routeName,
    );
  }
}

///Extensions in dart???
