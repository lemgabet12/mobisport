import 'package:flutter/material.dart';

class ProgrammeDetiel extends StatelessWidget {
  ProgrammeDetiel({this.cookiename});

  final String cookiename;

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: const Center(
          child: Text('programmeditiel'),
        ),
      ),
    );
  }
}
