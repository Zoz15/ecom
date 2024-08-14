import 'package:ecomorse/Screens/categry/allproduct.dart';
import 'package:ecomorse/Screens/categry/categroy.dart';
import 'package:ecomorse/Screens/categry/man_woman.dart';
import 'package:flutter/material.dart';
import 'package:ecomorse/Widget/widget_i_need_it.dart';
import 'package:ecomorse/Screens/categry/desc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategory = 'All';
  bool sortState = false;

  void _updateState(String category) {
    setState(() {
      selectedCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ExploreFristThinkInApp(
            onback: _updateState,
          ),
          //SearchBar(width),
          //              ? botton next to search bar
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  CategoryBar(
                    onback: _updateState,
                  ),
                  //               ? contaner have radius only top

                  Expanded(
                    child: _buildContent(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    if (selectedCategory == 'All') {
      return sortState ? const Desc() : allProductWidget();
    } else if (selectedCategory == 'Other') {
      return Category(onSelected: _updateState);
    } else if (selectedCategory == 'Man') {
      return ManWomen(
        onSelected: _updateState,
        isman: true,
      );
    } else if (selectedCategory == 'Women') {
      return ManWomen(
        onSelected: _updateState,
        isman: false,
      );
    } else {
      return Container();
    }
  }
}