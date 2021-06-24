import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:qatar2022/screens/info/components/detail.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCFAF8),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 30.0),
          Container(
              padding: EdgeInsets.only(right: 15.0),
              width: MediaQuery.of(context).size.width - 10.0,
              height: MediaQuery.of(context).size.height - 10.0,
              child: GridView.count(
                crossAxisCount: 2,
                primary: false,
                crossAxisSpacing: 70.0,
                mainAxisSpacing: 70.0,
                childAspectRatio: 0.8,
                children: <Widget>[
                  _buildCard('Hotel', 'assets/images/hotel.png', context),
                  _buildCard('Stadium', 'assets/images/stadium.png', context),
                  _buildCard('Parking', 'assets/images/parking.png', context),
                  _buildCard(
                      'Restorant', 'assets/images/restaurant.png', context),
                  _buildCard('Service', 'assets/images/24-hours.png', context),
                  _buildCard(
                      'Training', 'assets/images/presentation.png', context),
                  _buildCard('Park', 'assets/images/park.png', context),
                  _buildCard(
                      'Shopping', 'assets/images/online-shopping.png', context),
                  _buildCard('rent', 'assets/images/rent.png', context),
                  _buildCard('More', 'assets/images/options.png', context),
                ],
              )),
          SizedBox(height: 1.0)
        ],
      ),
    );
  }

  Widget _buildCard(String name, String imgPath, context) {
    return Padding(
        padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
        child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => InfoDetail(cookiename: name)));
            },
            child: Container(
                child: Column(children: [
              Hero(
                  tag: imgPath,
                  child: Container(
                      height: 200.0,
                      width: 200.0,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(imgPath),
                              fit: BoxFit.contain)))),
              SizedBox(
                height: 50.0,
                width: 50.0,
              ),
              Text(name,
                  style: TextStyle(
                      color: Color(0xFF575E67),
                      fontFamily: 'Varela',
                      fontSize: 30.0)),
            ]))));
  }
}
