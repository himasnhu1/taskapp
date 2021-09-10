import 'package:flutter/material.dart';
import 'HomeScreen.dart';
import 'LoginScreen.dart';
import 'SignUpscreen.dart';
Map routes(BuildContext c){
  Map<String,WidgetBuilder> routes = {
    '/' : (c) => Login(),
    '/Registration_Screen': (c) => SignupScreen(),
    '/home' : (c) => Homescreen(),
  };
  return routes;
}