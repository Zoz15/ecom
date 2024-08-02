import 'package:ecomorse/Screens/home_screen.dart';
import 'package:ecomorse/constants/AppConstants.dart';
// import 'package:ecomorse/model/get_all_prodactsJ.dart';
import 'package:ecomorse/model/get_form_api.dart';
import 'package:flutter/material.dart';

// ============================== all procuct page =========================
Widget AllProductWidget() {
  return FutureBuilder(
    future: fetchAllProducts(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(child: CircularProgressIndicator());
      } else if (snapshot.hasError) {
        return Center(child: Text('Error: ${snapshot.error}'));
      } else if (!snapshot.hasData || snapshot.data == null) {
        return const Expanded(
            child: Center(child: Text('No products available')));
      } else {
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 12,
          ),
          itemCount: list_of_allProducts.length,
          itemBuilder: (context, index) {
            final product = list_of_allProducts[index];
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
  );
}

// ================================== procuct card ======================
class ProductCard extends StatelessWidget {
  final dynamic product;

  const ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: liteBlue),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: width / 2 - 20,
              height: 70,
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ClipRRect(
                    child: Image.network(
                  product.image ?? '',
                  fit: BoxFit.contain,
                )),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                //const SizedBox(height: 4),
                Text(
                  '\$${product.price?.toStringAsFixed(1)}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w800,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
