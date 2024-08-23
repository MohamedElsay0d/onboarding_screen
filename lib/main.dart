import 'package:flutter/material.dart';
import 'package:onboarding_screen/HomeScreen.dart';

import 'OnboardingScreen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Onboardingscreen(),
      routes: {
        "home": (context) => const Homescreen(),
      },
    );
  }
}
