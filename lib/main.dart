import 'package:flutter/material.dart';
import 'package:qatar2022/routes.dart';
import 'package:qatar2022/screens/splash/splash_screen.dart';
import 'package:qatar2022/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MobiSport',
      theme: theme(),
      // We use routeName so that we dont need to remember the name
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
