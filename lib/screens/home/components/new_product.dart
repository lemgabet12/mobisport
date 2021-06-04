import 'package:flutter/material.dart';
import 'package:qatar2022/components/product_card.dart';
import 'package:qatar2022/models/Product.dart';
import 'package:qatar2022/screens/details/details_screen.dart';

import '../../../size_config.dart';

class NewProducts extends StatelessWidget {
  const NewProducts({
    Key key,
    this.products,
  }) : super(key: key);
  // Because our Api provie us list of products
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return Padding(
      padding: EdgeInsets.all(defaultSize * 2), //20
      child: GridView.builder(
        // We just turn off grid view scrolling
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        // just for demo
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:
              SizeConfig.orientation == Orientation.portrait ? 2 : 4,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 0.693,
        ),
        itemBuilder: (context, index) => ProductCard(
            product: products[index],
            press: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsScreen(
                      product: products[index],
                    ),
                  ));
            }),
      ),
    );
  }
}
