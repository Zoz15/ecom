import 'package:ecomorse/Screens/categry/allproduct.dart';
import 'package:ecomorse/Screens/categry/categroy.dart';
import 'package:ecomorse/Screens/categry/man_woman.dart';
import 'package:flutter/material.dart';
import 'package:ecomorse/constants/AppConstants.dart';
import 'package:ecomorse/Widget/widget_of_homeScreen.dart';
import 'package:ecomorse/Screens/categry/desc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void updateState(String category) {
    setState(() {
      selectedCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExploreFristThinkInApp(
          onback: updateState,
        ),
        //SearchBar(width),
        //              ? botton next to search bar
        Expanded(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: CategoryBar(
                  onback: updateState,
                ),
              ),
              //               ? contaner have radius only top

              Expanded(
                  child: selectedCategory == 'All'
                      ? sortState
                          ? const Desc()
                          : allProductWidget()
                      : selectedCategory == 'Other'
                          ? Category(onSelected: updateState)
                          : selectedCategory == 'Man'
                              ? ManWomen(
                                  onSelected: updateState,
                                  isman: true,
                                )
                              : selectedCategory == 'Women'
                                  ? ManWomen(
                                      onSelected: updateState,
                                      isman: false,
                                    )
                                  : Container()),
            ],
          ),
        ),
      ],
    );
  }
}
