import 'package:flutter/material.dart';
import 'package:qatar2022/components/RSSDemo.dart';

class Body extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'feed',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RSSdemo(),
    );
  }
}
