import 'package:flutter/material.dart';

double hightoffiald = 50;
double radius = 10;
Color orange = Color(0xfffd7819);
Color white = Colors.white;
Color black = Colors.black;
Color orangelite = Color(0xfff3e5da);


// ignore: must_be_immutable
class size extends StatelessWidget {

  double h;
  double w;

  size({ this.h = 0, this.w = 0, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: w,height: h,);
  }
}
