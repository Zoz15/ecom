import 'package:ecomorse/constants/AppConstants.dart';
import 'package:ecomorse/model/get_form_api.dart';
import 'package:flutter/material.dart';
import 'dart:math'; // Added this import

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: fungetcart(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return const Expanded(
                child: Center(child: Text('No products available')));
          } else {
            return ListView.builder(
              itemCount: listOfCart.length,
              itemBuilder: (context, index) {
                // print('${listOfCart[index].products}');
                // print('------------------------------------------------------');
                var cart = listOfCart[index];
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      // todo make the design of the cart screen AND add favorite button
                      width: double.infinity,
                      height: 200,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: liteBlue,
                      ),
                      child: FutureBuilder(
                        future: fenGetDetails(cart.products!.first.productId!),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Center(
                                child: Text('Error 5: ${snapshot.error}'));
                          } else if (!snapshot.hasData ||
                              snapshot.data == null) {
                            return const Expanded(
                                child: Center(
                                    child: Text('No products available')));
                          } else {
                            return Row(
                              children: [
                                Container(
                                  height: 170,
                                  width: 170,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.network(
                                          snapshot.data![0].image!,
                                          fit: BoxFit.contain),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        snapshot.data![0].title!
                                            .split(' ')
                                            .take(2)
                                            .join(' '),
                                        style: const TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        listOfSize[Random()
                                            .nextInt(listOfSize.length)],
                                        style: const TextStyle(fontSize: 20),
                                      ),
                                      Row(
                                        children: [
                                          const Text(
                                            'Color',
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          const SizedBox(width: 5),
                                          Container(
                                            width: 15,
                                            height: 15,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: colors[Random()
                                                  .nextInt(colors.length)],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        '\$${snapshot.data![0].price.toString()}',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Row(
                                        children: [
                                          IconButton(
                                            onPressed: () {},
                                            icon: const Icon(Icons.remove),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            cart.products!.first.quantity
                                                .toString(),
                                            style:
                                                const TextStyle(fontSize: 20),
                                          ),
                                          const SizedBox(width: 10),
                                          IconButton(
                                            onPressed: () {},
                                            icon: const Icon(Icons.add),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            );
                          }
                        },
                      ),
                      // child: Text(listOfCart[index].id.toString()),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
