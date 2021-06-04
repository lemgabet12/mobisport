import 'package:flutter/material.dart';
import 'components/body.dart';

class CategoryProductsScreen extends StatelessWidget {
  static String routeName = "/catprod";
  final int id;

  const CategoryProductsScreen({Key key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final CategoryArguments agrs = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      body: Body(),
    );
  }
}

/*class CategoryArguments {
  final int id;
  CategoryArguments({@required this.id});
}*/
