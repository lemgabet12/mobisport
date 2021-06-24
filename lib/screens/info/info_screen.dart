import 'package:flutter/material.dart';
import 'package:qatar2022/components/AppBarWidget.dart';
import 'package:qatar2022/components/DrawerWidget.dart';
import 'package:qatar2022/components/coustom_bottom_nav_bar.dart';
import 'package:qatar2022/enums.dart';
import 'package:qatar2022/screens/info/components/body.dart';

class InfoScreen extends StatelessWidget {
  static String routeName = "/info";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(context),
      drawer: DrawerWidget(),
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.info),
    );
  }
}
