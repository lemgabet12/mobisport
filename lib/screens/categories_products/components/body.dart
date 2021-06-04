import 'package:flutter/material.dart';
import 'package:qatar2022/components/title_text.dart';
import 'package:qatar2022/services/fetchProducts.dart';

import '../../../size_config.dart';
import 'category_full_products.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Enter");
    // It enables scrolling
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Divider(height: 5),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20)), //20
              child: TitleText(title: "Recommands For You"),
            ),
            // Right Now product is our demo product
            FutureBuilder(
              future: fetchProducts(),
              builder: (context, snapshot) {
                return snapshot.hasData
                    ? CategoryFullProducts(products: snapshot.data)
                    : Center(child: Image.asset("assets/ripple.gif"));
              },
            ),
          ],
        ),
      ),
    );
  }
}
