import 'package:booking_trip_app/signup.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// 'package:booking_trip_app/login.dart';
import 'package:booking_trip_app/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefObj = await SharedPreferences.getInstance();
  final isLogin = prefObj.getBool('is_Login') ?? false;

  runApp(MaterialApp(home: (isLogin) ? Welcome() : SignupApp()));
}
