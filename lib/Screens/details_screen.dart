import 'package:ecomorse/Screens/home_screen.dart';
import 'package:ecomorse/constants/AppConstants.dart';
import 'package:ecomorse/model/get_form_api.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'dart:math';

class DetailsScreen extends StatelessWidget {
  int id;
  DetailsScreen({super.key, required this.id});

  int getRandomInt() {
    int _randomNumber = 0;
    Random random = Random();
    var min = 100;
    var max = 900;
    _randomNumber = min + random.nextInt(max - min);
    return _randomNumber;
  }

  int getRandomIntPrice() {
    int _randomNumber = 0;
    Random random = Random();
    var min = 9;
    var max = 20;
    _randomNumber = min + random.nextInt(max - min);
    return _randomNumber;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: white,
      appBar: AppBar(
        //backgroundColor: white,
        title: const Text('Details'),
        centerTitle: true,
        actions: const [Icon(Iconsax.shop), Size(w: 10)],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: FutureBuilder(
          future: fetGetDetails(id), // todo adsfadfadf
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.connectionState == ConnectionState.done) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        width: double.infinity,
                        height: (height / 2) - 25,
                        child: ClipRRect(
                          child: Image.network(
                            listOfDetails[0].image!,
                            fit: BoxFit.cover,
                          ),
                        )),
                    const Size(h: 5),
                    SizedBox(
                        width: double.infinity,
                        child: Center(
                            child: Text(
                          listOfDetails[0].title!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ))),
                    const Size(
                      h: 10,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 20,
                        ),
                        Text(
                          ' ${listOfDetails[0].rating?.rate} (${listOfDetails[0].rating?.count})  . ${getRandomInt()} reviwes',
                          style: const TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    const Size(h: 7),
                    ReadMoreText(text: listOfDetails[0].description!),
                    const Size(h: 10),
                    const Text(
                      'Select Color',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    const Size(
                      h: 10,
                    ),
                    SizedBox(width: 180, child: ColorSelection()),
                    const Size(h: 12),
                    const Text(
                      'Select Size',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    const SizeOfT(),
                    const Size(h: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          ' ${listOfDetails[0].price!} ',
                          style: const TextStyle(
                            fontFamily: 'Schyler',
                            fontSize: 25,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text.rich(
                          TextSpan(
                            text:
                                (listOfDetails[0].price! + getRandomIntPrice())
                                    .toStringAsFixed(2),
                            style: const TextStyle(
                                fontFamily: 'Schyler',
                                fontSize: 22,
                                fontWeight: FontWeight.w300,
                                decoration: TextDecoration.lineThrough,
                                color: Colors.black54),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            // todo go to car
                          },
                          child: Container(
                            height: 50,
                            width: width / 2,
                            //width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: blue,
                            ),
                            child: const Center(
                              child: Text(
                                'add to car',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            } else {
              return const Center(child: Text('Error loading products'));
            }
          },
        ),
        // child: Column(
        //   children: [
        //     Container(
        //       width: double.infinity,
        //       decoration: BoxDecoration(
        //         image: DecorationImage(image: NetworkImage(protected.image)),
        //         borderRadius: BorderRadius.circular(20),
        //       ),
        //     )
        //   ],
        // ),
      ),
    );
  }
}

class ColorSelection extends StatefulWidget {
  @override
  _ColorSelectionState createState() => _ColorSelectionState();
}

class _ColorSelectionState extends State<ColorSelection> {
  int selectedIndex = -1; // No color selected

  final List colors = [
    Color(0xff51c51c),
    Color(0xff7a0808),
    black,
    Color.fromARGB(255, 236, 236, 236),
    Color(0xff1510db),

    // Colors.green,
    // const Color.fromARGB(255, 214, 89, 67),
    // Colors.black,
    // Color.fromARGB(255, 214, 205, 118),
    // //white,
    // Color.fromARGB(255, 12, 70, 117),
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(colors.length, (index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: colors[index],
                ),
              ),
              selectedIndex == index
                  ? Icon(
                      Icons.check,
                      color: index == 3 ? Colors.black : Colors.white,
                      size: 15,
                    )
                  : const Size(
                      h: 1,
                    )
            ],
          ),
        );
      }),
    );
  }
}

class ReadMoreText extends StatefulWidget {
  final String text;

  ReadMoreText({required this.text});

  @override
  _ReadMoreTextState createState() => _ReadMoreTextState();
}

class _ReadMoreTextState extends State<ReadMoreText> {
  bool isExpanded = false;
  late TapGestureRecognizer _tapGestureRecognizer;

  @override
  void initState() {
    super.initState();
    _tapGestureRecognizer = TapGestureRecognizer();
  }

  @override
  void dispose() {
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final words = widget.text.split(' ');
    final first20Words = words.take(15).join(' ');

    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: isExpanded ? widget.text : '$first20Words...',
            style: TextStyle(fontSize: 12, color: Colors.black54),
          ),
          TextSpan(
            text: isExpanded ? ' Read less' : ' Read more',
            style: TextStyle(fontSize: 12, color: Colors.blue),
            recognizer: _tapGestureRecognizer
              ..onTap = () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
          ),
        ],
      ),
    );
  }
}

class SizeOfT extends StatefulWidget {
  const SizeOfT({super.key});

  @override
  State<SizeOfT> createState() => _SizeOfTState();
}

class _SizeOfTState extends State<SizeOfT> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: Row(
        children: listOfSize.map((cat) {
          return Expanded(
            child: InkWell(
              onTap: () {
                setState(() {
                  selectedSize = cat;
                });
                //widget.onback(cat);
              },
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: AnimatedContainer(
                  height: 40,
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: selectedSize != cat
                        ? Border.all(color: Colors.black12)
                        : Border.all(color: white),
                    color: selectedSize == cat ? blue : white,
                  ),
                  duration: const Duration(milliseconds: 500),
                  child: Center(
                    child: Expanded(
                      child: Text(
                        cat,
                        style: TextStyle(
                          color: selectedSize == cat ? Colors.white : black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
