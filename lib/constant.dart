import 'package:flutter/material.dart';

//color constant
final MaterialColor colorList = MaterialColor(0xff5c2a64, {
  50: Color(0xffdbdbdb),
  100: Color(0xff8),
  200: Color(0xff756775),
  300: Color(0xff9c7c9c),
  400: Color(0xff917195),
  500: Color(0xff5c2a64),
  600: Color(0xff536dfe),
  700: Color(0xff3d5afe),
  800: Color(0xff3d5afe),
  900: Color(0xff514e51),
});
Widget textButton(String text, Function onPressed) => FlatButton(
  child: Text(text),
  onPressed: onPressed,
);

//string
const String loginScreenHeader = 'Login';
const String mobileNumber = 'User (Contact Number)';
TextStyle oHeader = TextStyle(color: colorList.shade600, fontSize: 25.0);
const String password = 'Password';
const String signupButton = 'Don\'t have account? Sign-Up!';

