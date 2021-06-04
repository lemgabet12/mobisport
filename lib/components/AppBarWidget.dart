import 'package:flutter/material.dart';

Widget appBarWidget(context) {
  return AppBar(
    elevation: 0.0,
    centerTitle: true,
    title: Image.asset(
      "assets/images/logo.png",
      width: 120,
      height: 50,
    ),
  );
}
