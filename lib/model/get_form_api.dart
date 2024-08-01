import 'dart:convert';
import 'package:ecomorse/constants/AppConstants.dart';
import 'package:ecomorse/model/get_all_prodactsJ.dart';
import 'package:ecomorse/model/get_desc.dart';
import 'package:http/http.dart' as http;

Future<List<AllProducts>> fetchAllProducts() async {
  try {
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final productList = (data as List<dynamic>)
          .map((item) => AllProducts.fromJson(item))
          .toList();

      list_of_allProducts = productList;

      return productList;
    } else {
      throw Exception('Failed to load products');
    }
  } catch (e) {
    print('Error: $e');
    throw e;
  }
}

Future<List<DescProduct>> funGetDesc() async {
  try {
    final response = await http
        .get(Uri.parse('https://fakestoreapi.com/products?sort=desc'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final productList = (data as List<dynamic>)
          .map((item) => DescProduct.fromJson(item))
          .toList();

      list_of_desc = productList;
      print(productList);
      return productList;
    } else {
      throw Exception('Failed to load products');
    }
  } catch (e) {
    print('Error: $e');
    throw e;
  }
}
