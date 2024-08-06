import 'package:ecomorse/Screens/categry/allproduct.dart';
import 'package:ecomorse/Screens/details_screen.dart';
import 'package:ecomorse/constants/AppConstants.dart';
import 'package:ecomorse/model/get_form_api.dart';
import 'package:flutter/material.dart';

class Desc extends StatefulWidget {
  const Desc({super.key});

  @override
  State<Desc> createState() => _DescState();
}

class _DescState extends State<Desc> {
  bool isLoading = true;
  String? error;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15, left: 15),
      child: FutureBuilder(
        future: funGetDesc(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: listOfDesc.length,
              itemBuilder: (BuildContext context, int index) {
                final product = listOfDesc[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              DetailsScreen(id: product.id!)));
                    // Navigate to detail screen
                  },
                  child: ProductCard(product: product),
                );
              },
            );
          }
        },
      ),
    );
  }
}
