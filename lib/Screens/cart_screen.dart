import 'package:ecomorse/constants/AppConstants.dart';
import 'package:ecomorse/model/get_form_api.dart';
import 'package:flutter/material.dart';

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
                return Container(
                  // todo make the design of the cart screen AND add favorite button 
                  // height: 100,
                  width: 100,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.red,
                  ),
                  child: Text(listOfCart[index].id.toString()),
                  // child: Text(snapshot.data![index].id.toString()),


                );
              },
            );
          }
        },
      ),
    );
  }
}
