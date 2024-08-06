import 'package:ecomorse/Screens/categry/allproduct.dart';
import 'package:ecomorse/Screens/categry/categroy.dart';
import 'package:ecomorse/Screens/categry/man_woman.dart';
import 'package:flutter/material.dart';
import 'package:ecomorse/constants/AppConstants.dart';
import 'package:ecomorse/Widget/widget_of_homeScreen.dart';
import 'package:ecomorse/Screens/categry/desc.dart';
import 'package:iconsax/iconsax.dart';

late double height;
late double width;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void updateState(String category) {
    setState(() {
      selectedCategory = category;
    });
  }

  // void updateState(String category) {
  //   setState(() {
  //     selectedCategory = category;
  //   });
  // }
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    Center(child: Text('Home Page')),
    Center(child: Text('Store Page')),
    Center(child: Text('Favorite Page')),
    Center(child: Text('Profile Page')),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
          onTap: _onItemTapped,
          showSelectedLabels: false,
          showUnselectedLabels: false,
        ),
        body: SafeArea(
          child: Column(
            children: [
              ExploreFristThinkInApp(
                onback: updateState,
              ),
              //SearchBar(width),
              //              ? botton next to search bar
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: CategoryBar(
                        onback: updateState,
                      ),
                    ),
                    //               ? contaner have radius only top

                    Expanded(
                        child: selectedCategory == 'All'
                            ? sortState
                                ? const Desc()
                                : allProductWidget()
                            : selectedCategory == 'Other'
                                ? Category(onSelected: updateState)
                                : selectedCategory == 'Man'
                                    ? ManWomen(
                                        onSelected: updateState,
                                        isman: true,
                                      )
                                    : selectedCategory == 'Women'
                                        ? ManWomen(
                                            onSelected: updateState,
                                            isman: false,
                                          )
                                        : Container()),
                  ],
                ),
              ),
            ],
          ),
        ),
//         BottomNavigationBar(
//   currentIndex: _currentIndex,
//   onTap: (index) => setState(() => _currentIndex = index),
//   items: [
//     BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//     BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
//   ],
// ),
        // drawer: NavigationBar(
        //   destinations: const [
        //     NavigationDrawerDestination(icon: Icon(Iconsax.home), label: Text('Home')),
        //     NavigationDrawerDestination(icon: Icon(Iconsax.shop), label: Text('Store')),
        //     NavigationDrawerDestination(icon: Icon(Iconsax.heart), label: Text('Favorite')),
        //     NavigationDrawerDestination(icon: Icon(Iconsax.user), label: Text('Profile')),
        //   ],
        //   onDestinationSelected: (value) {
        //     setState(() {

        //     });
        //   },

        // ),
      ),
    );
  }

  // ================================== search bar ======================
  // Widget SearchBar(double width) {
  //   return Padding(
  //     padding: const EdgeInsets.only(top: 15, right: 15, left: 15),
  //     child: Row(
  //       children: [
  //         SizedBox(
  //           width: (width / 11) * 7,
  //           height: hightoffiald,
  //           child: TextField(
  //             onChanged: null,
  //             onSubmitted: null,
  //             decoration: InputDecoration(
  //               filled: true,
  //               fillColor: Color(0xfff3e5da),
  //               hintText: '  Search for products',
  //               prefixIcon:
  //                   IconButton(icon: Icon(Icons.search), onPressed: null),
  //               prefixIconColor: Colors.black,
  //               border: OutlineInputBorder(
  //                 borderRadius: BorderRadius.circular(radius),
  //                 borderSide: BorderSide.none,
  //               ),
  //             ),
  //           ),
  //         ),
  //         SizedBox(width: 7),
  //         InkWell(
  //           onTap: () {
  //             setState(() {
  //               print(selectedCategory);
  //             });
  //           },
  //           child: Container(
  //             padding: EdgeInsets.all(12),
  //             height: hightoffiald,
  //             width: hightoffiald,
  //             decoration: BoxDecoration(
  //               borderRadius: BorderRadius.circular(radius),
  //               color: orange,
  //             ),
  //             child: Image.asset('assets/flash.png'),
  //           ),
  //         ),
  //         SizedBox(width: 7),
  //         Container(
  //           padding: const EdgeInsets.all(12),
  //           height: hightoffiald,
  //           width: hightoffiald,
  //           decoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(radius),
  //             color: orange,
  //           ),
  //           child: Image.asset('assets/coin.png'),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}

// ignore: must_be_immutable
class ExploreFristThinkInApp extends StatefulWidget {
  Function(String) onback;
  ExploreFristThinkInApp({
    required this.onback,
    super.key,
  });

  @override
  State<ExploreFristThinkInApp> createState() => _ExploreFristThinkInAppState();
}

class _ExploreFristThinkInAppState extends State<ExploreFristThinkInApp> {
  IconData theicon = Icons.arrow_downward_outlined;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Explore',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                ),
              ),
              Row(
                children: [
                  Text(
                    'Trendy ',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Text(
                        'Cloths',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 30,
                        ),
                      ),
                      Image(
                        image: AssetImage('assets/underline.png'),
                        fit: BoxFit.fill, //assets\image\underline.png
                        height: 7,
                        width: 100,
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: selectedCategory == 'All'
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        if (theicon == Icons.arrow_upward_outlined) {
                          sortState = true;
                          theicon = Icons.arrow_downward_outlined;
                        } else {
                          sortState = false;
                          theicon = Icons.arrow_upward_outlined;
                        }
                      });
                      widget.onback(selectedCategory);
                    },
                    icon: Icon(theicon))
                : const SizedBox(
                    height: 2,
                  ),
          )
        ],
      ),
    );
  }
}
