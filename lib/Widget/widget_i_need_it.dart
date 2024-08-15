import 'dart:math';

import 'package:ecomorse/constants/AppConstants.dart';
import 'package:ecomorse/main.dart';
import 'package:flutter/material.dart';

// ====================== Section of slide Under SearchBar ===============
class CategoryBar extends StatefulWidget {
  final Function(String) onback;

  const CategoryBar({super.key, required this.onback});
  @override
  State<CategoryBar> createState() => _CategoryBarState();
}

class _CategoryBarState extends State<CategoryBar> {
  String selectedCategory = 'All'; // Ensure this is initialized

  @override
  Widget build(BuildContext context) {
    return Row(
      children: category.map((cat) {
        return SizedBox(
          width: (widthOfScreen / 4) - 4,
          child: InkWell(
            onTap: () {
              setState(() {
                selectedCategory = cat;
              });
              widget.onback(cat);
            },
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: AnimatedContainer(
                height: 45,
                padding: const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: selectedCategory != cat
                      ? Border.all(color: Colors.black12)
                      : Border.all(color: Colors.white),
                  color: selectedCategory == cat ? Colors.blue : Colors.white,
                ),
                duration: const Duration(milliseconds: 500),
                child: Center(
                  child: Text(
                    cat,
                    style: TextStyle(
                      color:
                          selectedCategory == cat ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

// ignore: must_be_immutable
class ExploreFristThinkInApp extends StatefulWidget {
  Function(String) onback;
  ExploreFristThinkInApp({
    required this.onback,
    super.key,
  });

  @override
  State<ExploreFristThinkInApp> createState() => _ExploreFristThinkInAppState();
}

class _ExploreFristThinkInAppState extends State<ExploreFristThinkInApp> {
  IconData theicon = Icons.arrow_downward_outlined;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Explore',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                ),
              ),
              Row(
                children: [
                  Text(
                    'Trendy ',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Text(
                        'Cloths',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 30,
                        ),
                      ),
                      Image(
                        image: AssetImage('assets/image/underline.png'),
                        fit: BoxFit.fill, //assets\image\underline.png
                        height: 7,
                        width: 100,
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: selectedCategory == 'All'
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        if (theicon == Icons.arrow_upward_outlined) {
                          sortState = true;
                          theicon = Icons.arrow_downward_outlined;
                        } else {
                          sortState = false;
                          theicon = Icons.arrow_upward_outlined;
                        }
                      });
                      widget.onback(selectedCategory);
                    },
                    icon: Icon(theicon))
                : const SizedBox(
                    height: 2,
                  ),
          )
        ],
      ),
    );
  }
}

//! ================= class =====================

class Size extends StatelessWidget {
  final double h;
  final double w;

  const Size({this.h = 0, this.w = 0, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: w,
      height: h,
    );
  }
}

int getRandomInt(int x) {
  x = x - 1;

  return Random().nextInt(x) + 1;
}
