import 'package:flutter/material.dart';
import 'package:calorie_tracker/screens/welcome_screen.dart';
import 'package:calorie_tracker/screens/login_screen.dart';
import 'package:calorie_tracker/screens/registration_screen.dart';
import 'package:calorie_tracker/screens/search_food.dart';

void main() => runApp(CalorieTracker());

class CalorieTracker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        SearchFoodScreen.id: (context) => SearchFoodScreen()
      },
    );
  }
}
