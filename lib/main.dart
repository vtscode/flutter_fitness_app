import 'package:flutter/material.dart';
import 'package:flutter_fitness_ui/screen/onboarding_screen.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardingScreen(),
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Color(0xff192a56),
        )
      ),
    );
  }
}
