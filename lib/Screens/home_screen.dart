import 'package:ecomorse/Screens/categry/allproduct.dart';
import 'package:flutter/material.dart';
import 'package:ecomorse/constants/AppConstants.dart';
import 'package:ecomorse/Widget/widget_of_homeScreen.dart';
import 'package:ecomorse/Screens/categry/desc.dart';

late double height;
late double width;

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategory = 'All product';
  
  void updateSelectedCategory(String category) {
    setState(() {
      selectedCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              SearchBar(width),
              //              ? botton next to search bar
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Category(
                          onback: updateSelectedCategory,
                        ),
                      ),
                    ),
                    //               ? contaner have radius only top
                    Container(
                      width: double.infinity,
                      height: 25,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                        color: orangelite,
                      ),
                    ),
                    Expanded(
                      child: Stack(
                        children: [
                          //                 ? background
                          Container(color: orangelite),
                          selectedCategory == 'All product'
                              ? Padding(
                                  padding: const EdgeInsets.only(right: 15, left: 15),
                                  child: AllProductWidget(),
                                )
                              : selectedCategory == 'Desc'
                                  ? const Padding(
                                    padding: EdgeInsets.only(right: 15, left: 15),
                                    child: Desc(),
                                  )
                                  : Container(
                                      height: 100,
                                      width: 100,
                                      color: orange,
                                    ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ================================== search bar ======================
  Widget SearchBar(double width) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, right: 15, left: 15),
      child: Row(
        children: [
          SizedBox(
            width: (width / 11) * 7,
            height: hightoffiald,
            child: TextField(
              onChanged: null,
              onSubmitted: null,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xfff3e5da),
                hintText: '  Search for products',
                prefixIcon:
                    IconButton(icon: Icon(Icons.search), onPressed: null),
                prefixIconColor: Colors.black,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(radius),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          SizedBox(width: 7),
          InkWell(
            onTap: () {
              setState(() {
                print(yoursellect);
              });
            },
            child: Container(
              padding: EdgeInsets.all(12),
              height: hightoffiald,
              width: hightoffiald,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(radius),
                color: orange,
              ),
              child: Image.asset('assets/flash.png'),
            ),
          ),
          SizedBox(width: 7),
          Container(
            padding: const EdgeInsets.all(12),
            height: hightoffiald,
            width: hightoffiald,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius),
              color: orange,
            ),
            child: Image.asset('assets/coin.png'),
          ),
        ],
      ),
    );
  }
}
