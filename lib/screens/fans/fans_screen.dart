import 'package:flutter/material.dart';
import 'package:qatar2022/components/AppBarWidget.dart';
import 'package:qatar2022/components/DrawerWidget.dart';
import 'package:qatar2022/components/coustom_bottom_nav_bar.dart';
import 'package:qatar2022/enums.dart';
import 'package:qatar2022/screens/fans/components/body.dart';

class FansScreen extends StatelessWidget {
  static String routeName = "/fans";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(context),
      drawer: DrawerWidget(),
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.fans),
    );
  }
}
