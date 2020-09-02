import 'package:flutter/material.dart';
import 'package:calorie_tracker/constants.dart';

class CTRoundedButton extends StatelessWidget {
  CTRoundedButton({this.label, this.onPressed});

  final String label;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Material(
        color: kPrimaryColorGreen,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          elevation: 5.0,
          child: Text(label, style: TextStyle(color: Colors.white, fontSize: 20.0),),
          textColor: Colors.white,
          minWidth: 200.0,
          height: 50.0,
          onPressed: onPressed,
        ),
      ),
    );
  }
}