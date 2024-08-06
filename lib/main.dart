import 'package:ecomorse/Screens/home_screen.dart';
import 'package:ecomorse/Screens/loginscreen.dart';
import 'package:flutter/material.dart';
import 'package:ecomorse/constants/AppConstants.dart';
import 'package:iconsax/iconsax.dart';

void main() {
  runApp(MyApp());
}

late double height;
late double width;

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
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
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
              print(index);
              _selectedIndex = index;
            });
          },
          showSelectedLabels: false,
          showUnselectedLabels: false,
        ),
        body: SafeArea(
          child: _selectedIndex == 0
              ? HomeScreen()
              : _selectedIndex == 1
                  ? Container()
                  : _selectedIndex == 2
                      ? Container()
                      : _selectedIndex == 3
                          ? LoginScreen()
                          : const Center(child: Text('error x55'),),
        ),
      ),
    );
  }
}



    //*         love icon
// Stack(
//                           alignment: Alignment.topRight,
//                           children: [
//                             Image.network(
//                               'https://imgs.search.brave.com/ZYABGg8i634IdrHcai8qHch4bzvJQULWdIunltBVlqc/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9zdGF0/aWMuZGhpd2lzZS5j/b20vaG9tZS9kZXYt/YmxhY2tfMjAoMSku/d2VicD93PTM4NDAm/cT03NQ',
//                               fit: BoxFit.cover,
//                             ),
//                             Stack(
//                               alignment: Alignment.center,
//                               children: [
//                                 Icon(
//                                   Icons.favorite,
//                                   color: orange,
//                                   size: 28,
//                                 ),
//                                 InkWell(
//                                   onTap: () {
//                                     setState(() {
//                                       islove ? islove = false : islove = true;
//                                     });
//                                   },
//                                   child: Padding(
//                                     padding: const EdgeInsets.only(bottom: 1),
//                                     child: AnimatedContainer(
//                                       duration: const Duration(milliseconds: 500),
//                                       // islove ?
                                    
//                                       child: Icon(
//                                         Icons.favorite,
//                                         color: islove ? orange : Colors.white,
//                                         size: 23,
//                                       ),
//                                     ),
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ],
//                         ),