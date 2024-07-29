import 'dart:convert';
import 'package:ecomorse/constants/AppConstants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ecomorse/model/get_all_prodactsJ.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  List<AllProducts> list_of_all_product = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    funGetAllProdact();
  }

  Future<void> funGetAllProdact() async {
    try {
      final response =
          await http.get(Uri.parse('https://fakestoreapi.com/products'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final x = (data as List<dynamic>)
            .map((item) => AllProducts.fromJson(item))
            .toList();
        setState(() {
          list_of_all_product = x;
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      print('Error: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final Width = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
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
                            prefixIcon: IconButton(
                                icon: Icon(Icons.search), onPressed: null),
                            prefixIconColor: Colors.black,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(radius),
                                borderSide: BorderSide.none)),
                      ),
                    ),
                    size(w: 7),
                    Container(
                      padding: EdgeInsets.all(12),
                      height: hightoffiald,
                      width: hightoffiald,
                      child: Image.asset('assets/flash.png'),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(radius),
                        color: orange,
                      ),
                    ),
                    size(w: 7),
                    Container(
                      padding: EdgeInsets.all(12),
                      height: hightoffiald,
                      width: hightoffiald,
                      child: Image.asset('assets/coin.png'),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(radius),
                        color: orange,
                      ),
                    ),
                  ],
                ),
              ),
              
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          height: 45,
                          padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                          child: Center(child: Text('All product',style: TextStyle(color: white),)),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: orange,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          height: 45,
                          padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                          child: Center(child: Text('el5',style: TextStyle(color: white),)),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: orange,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          height: 45,
                          padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                          child: Center(child: Text('All product',style: TextStyle(color: white),)),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: orange,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          height: 45,
                          padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                          child: Center(child: Text('All product',style: TextStyle(color: white),)),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: orange,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
