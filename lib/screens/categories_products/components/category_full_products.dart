import 'package:flutter/material.dart';
import 'package:qatar2022/components/product_category_card.dart';
import 'package:qatar2022/models/Product.dart';
import 'package:qatar2022/screens/details/details_screen.dart';

import '../../../size_config.dart';

class CategoryFullProducts extends StatelessWidget {
  const CategoryFullProducts({
    Key key,
    this.products,
  }) : super(key: key);
  // Because our Api provie us list of products
  final List<Product> products;
  @override
  Widget build(BuildContext context) {
    print("im here");
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20)), //20
      child: GridView.builder(
        // We just turn off grid view scrolling
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:
              SizeConfig.orientation == Orientation.portrait ? 2 : 4,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 0.693,
        ),
        itemBuilder: (context, index) => ProductCategoryCard(
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
