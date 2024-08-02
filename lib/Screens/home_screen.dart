import 'package:ecomorse/Screens/categry/allproduct.dart';
import 'package:flutter/material.dart';
import 'package:ecomorse/constants/AppConstants.dart';
import 'package:ecomorse/Widget/widget_of_homeScreen.dart';
import 'package:ecomorse/Screens/categry/desc.dart';

late double height;
late double width;
// String selectedCategory = 'sdf';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void updateSelectedCategory(String category) {
    setState(() {
      selectedCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Explore_frist_think_in_app(),
              //SearchBar(width),
              //              ? botton next to search bar
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Category(
                          onback: updateSelectedCategory,
                        ),
                      ),
                    ),
                    //               ? contaner have radius only top

                    Expanded(
                      child: selectedCategory == 'All'
                          ? Padding(
                              padding:
                                  const EdgeInsets.only(right: 15, left: 15),
                              child: AllProductWidget(),
                            )
                          : selectedCategory == 'Desc'
                              ? const Padding(
                                  padding: EdgeInsets.only(right: 15, left: 15),
                                  child: Desc(),
                                )
                              : Container(
                                  height: 100,
                                  width: 100,
                                  color: orange,
                                ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
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

class Explore_frist_think_in_app extends StatefulWidget {
  Explore_frist_think_in_app({
    super.key,
  });

  @override
  State<Explore_frist_think_in_app> createState() =>
      _Explore_frist_think_in_appState();
}

class _Explore_frist_think_in_appState
    extends State<Explore_frist_think_in_app> {
  IconData theicon = Icons.arrow_upward_outlined;

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
                        theicon == Icons.arrow_upward_outlined
                            ? theicon = Icons.arrow_downward_outlined
                            : theicon = Icons.arrow_upward_outlined;
                      });
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
