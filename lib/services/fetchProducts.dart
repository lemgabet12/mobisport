import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:qatar2022/models/Product.dart';
import 'package:qatar2022/models/get_date.dart';

import '../constants.dart';

// Fetch our Products from API
// For Specific category
Future<List<Product>> fetchProducts() async {
  final response = await http.get(Uri.parse(
      "https://f63911585638.ngrok.io/tarifEtudiant/api/products?ws_key=$ws_key&language=1&output_format=JSON&display=[id,name,id_category_default,date_add,id_default_image,price,description_short,id_category_default]&filter[id_category_default]=8"));
  print(response.body);
  print(response.statusCode);
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    List<Product> products = (json.decode(response.body) as List)
        .map((data) => Product.fromJson(data))
        .toList();
    // Return list of products
    return products;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load products');
  }
}

// Products for home

Future<List<Product>> fetchNewProductData() async {
  var mydate = new GetDate();
  String dateIn = mydate.getCurrentDate();
  String dateOut = mydate.getSpecificDate(7);

  final response = await http.get(
    Uri.parse(
        'https://f63911585638.ngrok.io/tarifEtudiant/api/products?ws_key=$ws_key&language=1&output_format=JSON&display=[id,name,id_category_default,date_add,id_default_image,price,description_short]&filter[date_add]=[$dateIn,$dateOut]&date=1'),
  );
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    List<Product> products = (json.decode(response.body) as List)
        .map((data) => Product.fromJson(data))
        .toList();
    // Return list of products
    return products;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load new products');
  }
}
