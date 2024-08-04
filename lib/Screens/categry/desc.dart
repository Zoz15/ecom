import 'package:ecomorse/Screens/categry/allproduct.dart';
import 'package:ecomorse/constants/AppConstants.dart';
import 'package:ecomorse/model/get_form_api.dart';
import 'package:flutter/material.dart';

class Desc extends StatefulWidget {
  const Desc({Key? key}) : super(key: key);

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
          } else
          
          {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: list_of_desc.length,
              itemBuilder: (BuildContext context, int index) {
                final product = list_of_desc[index];
                return InkWell(
                  onTap: () {
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
