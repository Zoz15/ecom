import 'package:ecomorse/Screens/categry/allproduct.dart';
import 'package:ecomorse/Screens/details_screen.dart';
import 'package:ecomorse/constants/AppConstants.dart';
import 'package:ecomorse/model/get_form_api.dart';
import 'package:flutter/material.dart';

class ManWomen extends StatelessWidget {
  final Function(String) onSelected;
  final bool isman;

  const ManWomen({super.key, required this.onSelected, required this.isman});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 15, left: 15),
        child: FutureBuilder(
          future: isman ? funGetJewelery('m') : funGetJewelery('w'),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.connectionState == ConnectionState.done) {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: listOfJeEleMenWomen.length,
                itemBuilder: (BuildContext context, int index) {
                  final product = listOfJeEleMenWomen[index];
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
            } else {
              return const Center(child: Text('Error loading products'));
            }
          },
        ),
      ),
    );
  }
}
