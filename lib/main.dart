import 'package:ecomorse/Screens/cart_screen.dart';
import 'package:ecomorse/Screens/home_screen.dart';
import 'package:ecomorse/Screens/loginscreen.dart';
import 'package:flutter/material.dart';
import 'package:ecomorse/constants/AppConstants.dart';
import 'package:iconsax/iconsax.dart';

void main() {
  runApp(const MyApp());
}

late double heightOfScreen;
late double widthOfScreen;

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void updateState(String category) {
    setState(() {
      selectedCategory = category;
    });
  }

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    heightOfScreen = MediaQuery.of(context).size.height;
    widthOfScreen = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Iconsax.home),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.shop),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.heart),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.user),
              label: '',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: blue,
          unselectedItemColor: Colors.black54,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          showSelectedLabels: false,
          showUnselectedLabels: false,
        ),
        body: SafeArea(
          child: _selectedIndex == 0
              ? const HomeScreen()
              : _selectedIndex == 1
                  ? const CartScreen()
                  : _selectedIndex == 2
                      ? Container()
                      : _selectedIndex == 3
                          ? const LoginScreen()
                          : const Center(
                              child: Text('error x55'),
                            ),
        ),
      ),
    );
  }
}
