import 'package:flutter/material.dart';
import 'package:nasa/constants.dart';
import 'package:nasa/login_page.dart';
import 'package:nasa/splash_page.dart';
import 'package:nasa/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        splashId:(context)=>const SplashPage(),
        loginId:(context)=>const LoginPage(),
        homeId:(context)=> HomePage(),
      },
      initialRoute: splashId,
    );
  }
}
