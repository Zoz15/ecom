import 'package:ecomorse/model/get_all_prodacts.dart';
import 'package:ecomorse/model/get_desc.dart';
import 'package:ecomorse/model/get_jewelery.dart';
import 'package:flutter/material.dart';

double hightoffiald = 50;
double radius = 10;

final Color blue = Color(0xff7d99fd);
final Color liteBlue = Color(0xffecf0ff);
final Color black = Color(0xff01030a);
final Color white = Color(0xffffffff);

//List category = [, 'Dosc',  'Anther', 'Top 10 limet'];
// String allproduct = ;
// String desc = ;
// String category = ;
// String top_10 = ;

String selectedCategory = 'All';
String selectedCategoryLevel2 = 'Electronics';
String dropdownValue = '';
bool sortState = true;

// !================= the list ================
List<AllProducts> list_of_allProducts = [];
List<DescProduct> list_of_desc = [];
List<Jewelery_Electronics> list_of_jewelery_and_electronics = [];
// List<Jewelery_Electronics> list_of_electronics = [];
List<String> list_of_Categories = [];
final List<String> category = [
  'All',
  'Man',
  'Woman',
  'Anther',
];
final List<String> electronicsandjewelery = ['Electronics', 'Jewelery'];

// ignore: must_be_immutable, camel_case_types
class size extends StatelessWidget {
  double h;
  double w;

  size({this.h = 0, this.w = 0, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: w,
      height: h,
    );
  }
}
