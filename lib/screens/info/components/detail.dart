import 'package:flutter/material.dart';

class InfoDetail extends StatelessWidget {
  InfoDetail({this.cookiename});

  final String cookiename;

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: const Center(
          child: Text('detiel'),
        ),
      ),
    );
  }
}
