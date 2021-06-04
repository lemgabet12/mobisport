import 'package:flutter/material.dart';
import 'package:qatar2022/services/fetchProducts.dart';

import '../../../size_config.dart';
import 'new_product.dart';
import 'section_title.dart';

class PopularProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(title: "Nouveaux produits", press: () {}),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              FutureBuilder(
                future: fetchNewProductData(),
                builder: (context, snapshot) => snapshot.hasData
                    ? NewProducts(products: snapshot.data)
                    : Center(child: Image.asset("assets/ripple.gif")),
              ),
              SizedBox(width: getProportionateScreenWidth(20)),
            ],
          ),
        )
      ],
    );
  }
}
