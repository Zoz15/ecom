import 'dart:convert';
import 'package:ecomorse/Widget/widget_of_homeScreen.dart';
import 'package:ecomorse/constants/AppConstants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ecomorse/model/get_all_prodactsJ.dart';

// ignore: camel_case_types, must_be_immutable
class Home_screen extends StatefulWidget {
  Home_screen({super.key});

  @override
  State<Home_screen> createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
  List<AllProducts> list_of_all_product = [];

  // bool islove = false;
  Future<List<AllProducts>> funGetAllProdact() async {
    try {
      final response =
          await http.get(Uri.parse('https://fakestoreapi.com/products'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final productList = (data as List<dynamic>)
            .map((item) => AllProducts.fromJson(item))
            .toList();

        list_of_all_product = productList;

        return productList;
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      // ignore: avoid_print
      print('Error: $e');
      throw e;
    }
  }

  void _setsetstate(String selectedCategory) {
    setState(() {
      yoursellect = selectedCategory;
    });
  }
  @override
  Widget build(BuildContext context) {
    /// *  height and width of screen
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    // end
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: SafeArea(
            child: Column(children: [
              Search_bar(width),
              // list of thisks
              SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Category(
                          onback: _setsetstate,
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 25,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40)),
                          color: orangelite),
                    ),
                    //out line color aond inside listof view

                    yoursellect == 'All product'
                        ? AllproductWidget()
                        : yoursellect == 'Dosc'
                            ? Container(height: 100, width: 100, color: orange)
                            : yoursellect == 'Category'
                                ? Container(height: 100, width: 100, color: orange)
                                :
                                // yoursellect = 'Top 10 limet'
                                Container(height: 100, width: 100, color: orange)
                  ],
                ),
              ),
            ]),
          ),
        ));
  }

// =============================== All product tap =======================
  Container AllproductWidget() {
    return Container(
      color: orangelite,
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 0, right: 20, left: 20, bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'For You',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6), color: orange),
                  child: Image.asset(
                    'assets/back.png',
                    height: 12,
                  ),
                )
              ],
            ),
          ),
          FutureBuilder(
              future: funGetAllProdact(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return const Center(child: Text('An error occurred'));
                  } else {
                    if (snapshot.data == null) {
                      return const Center(child: Text('An error occurred'));
                    } else {
                      return _buildListView(snapshot.data!);
                    }
                  }
                } else {
                  return Center(
                    child: _buildLoading(),
                  );
                }
              }),
        ],
      ),
    );
  }

  ///=============================== search bar ==========================

  Padding Search_bar(double Width) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, right: 15, left: 15),
      child: Row(
        children: [
          SizedBox(
            width: (Width / 11) * 7,
            height: hightoffiald,
            child: TextField(
              onChanged: null,
              onSubmitted: null,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xfff3e5da),
                  hintText: '  Search of movie',
                  prefixIcon:
                      IconButton(icon: Icon(Icons.search), onPressed: null),
                  prefixIconColor: Colors.black,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(radius),
                      borderSide: BorderSide.none)),
            ),
          ),
          size(w: 7),
          InkWell(
            onTap: () {
              setState(() {
                
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
          size(w: 7),
          Container(
            padding: const EdgeInsets.all(12),
            height: hightoffiald,
            width: hightoffiald,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(radius), color: orange),
            child: Image.asset('assets/coin.png'),
          ),
        ],
      ),
    );
  }

  // ============================== buildListView ========================
  int isfrist = 0;

  Widget _buildListView(List<AllProducts> products) {
    // ! -----------------------------------------
    return SizedBox(
      height: 400,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (context, i) {
          final product = products[i];
          String longText = product.title!;

          String truncatedText = longText.length > 30
              ? longText.substring(0, 30) + '...'
              : longText;
          isfrist++;
          return Padding(
            padding: isfrist == 1
                ? EdgeInsets.only(top: 8, bottom: 8, left: 20, right: 8)
                : EdgeInsets.all(8),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    // Navigate to details screen
                  },
                  child: Container(
                    margin: EdgeInsets.all(8),
                    height: 270,
                    width: 230,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      // image: DecorationImage(
                      //   image: NetworkImage('${product.image}'),
                      //   fit: BoxFit.contain,
                      // ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: ClipRRect(
                        child: Image(image: NetworkImage(product.image!)),
                      ),
                    ),
                  ),
                ),
                Text(
                  truncatedText,
                  style: const TextStyle(fontWeight: FontWeight.w900),
                ),
                Text(product.category!),
                Text(
                  '\$${product.price}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

// =========================== bild circular progress ====================
  Widget _buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
