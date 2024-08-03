import 'package:ecomorse/model/get_all_prodactsJ.dart';
import 'package:ecomorse/model/get_desc.dart';
import 'package:flutter/material.dart';

double hightoffiald = 50;
double radius = 10;

Color blue = Color(0xff7d99fd);
Color liteBlue = Color(0xffecf0ff);
Color black = Color(0xff01030a);
Color white = Color(0xffffffff);

Color orange = Color(0xfffd7819);

Color orangelite = Color(0xfff3e5da);

//List category = [, 'Dosc', 'Category', 'Top 10 limet'];
// String allproduct = ;
// String desc = ;
// String category = ;
// String top_10 = ;

String selectedCategory = 'All';
bool sortState = true;

// !================= the list ================
List<AllProducts> list_of_allProducts = [];
List<DescProduct> list_of_desc = [];
List<String> list_of_Categories = [];

// ignore: must_be_immutable
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
