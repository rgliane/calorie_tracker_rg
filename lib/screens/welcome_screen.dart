import 'package:flutter/material.dart';
import 'package:calorie_tracker/components/ct_rounded_button.dart';
import 'package:calorie_tracker/screens/registration_screen.dart';
import 'package:calorie_tracker/screens/login_screen.dart';
import 'package:calorie_tracker/screens/search_food.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Calorie Tracker', style: TextStyle(fontSize: 50.0),),
              SizedBox(
                height: 50.0,
              ),
              CTRoundedButton(
                label: 'Log In',
                onPressed: () {
                  Navigator.pushNamed(context, LoginScreen.id);
                },
              ),
              CTRoundedButton(
                label: 'Create Account',
                onPressed: () {
                  Navigator.pushNamed(context, RegistrationScreen.id);
                },
              ),
              CTRoundedButton(
                label: 'Check Food',
                onPressed: () {
                  Navigator.pushNamed(context, SearchFoodScreen.id);
                },
              ),
              SizedBox(
                height: 75.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
