import 'package:ecomorse/constants/AppConstants.dart';
import 'package:ecomorse/main.dart';
import 'package:ecomorse/model/get_form_api.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:ecomorse/Widget/widget_i_need_it.dart';

// ignore: must_be_immutable
class DetailsScreen extends StatefulWidget {
  int id;
  DetailsScreen({super.key, required this.id});

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int getRandomInt() {
    int randomNumber = 0;
    Random random = Random();
    var min = 100;
    var max = 900;
    randomNumber = min + random.nextInt(max - min);
    return randomNumber;
  }

  int getRandomIntPrice() {
    int randomNumber = 0;
    Random random = Random();
    var min = 9;
    var max = 20;
    randomNumber = min + random.nextInt(max - min);
    return randomNumber;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: white,
      appBar: AppBar(
        //backgroundColor: white,
        title: const Text('Details'),
        centerTitle: true,
        // actions: const [Icon(Iconsax.shop), Size(w: 10)],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: FutureBuilder(
          future: fenGetDetails(widget.id), // todo adsfadfadf
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
                            color: white),
                        width: double.infinity,
                        height: (heightOfScreen / 2) - 25,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ClipRRect(
                            child: Hero(
                              tag: widget.id.toString(),
                              child: Image.network(
                                listOfDetails[0].image!,
                                fit: BoxFit.contain,
                              ),
                            ),
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
                    const Size(h: 10),
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
                    const Size(h: 10),
                    const SizedBox(width: 180, child: ColorSelection()),
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
                          ' \$${listOfDetails[0].price!} ',
                          style: const TextStyle(
                            fontFamily: 'Schyler',
                            fontSize: 35,
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
                        const Quantity()
                      ],
                    ),
                    const Size(h: 10),
                    InkWell(
                      onTap: () {
                        // todo go to car
                      },
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        //width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: blue,
                        ),
                        child: Center(
                          child: InkWell(
                            onTap: () {
                              addCart(widget.id, quantity);
                            },
                            child: const Text(
                              'add to car',
                              style: TextStyle(
                                fontSize: 20,
                                color: white,
                              ),
                            ),
                          ),
                        ),
                      ),
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
  const ColorSelection({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ColorSelectionState createState() => _ColorSelectionState();
}

class _ColorSelectionState extends State<ColorSelection> {
  int selectedIndex = -1; // No color selected

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

  const ReadMoreText({super.key, required this.text});

  @override
  // ignore: library_private_types_in_public_api
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
            style: const TextStyle(fontSize: 12, color: Colors.black54),
          ),
          TextSpan(
            text: isExpanded ? ' Read less' : ' Read more',
            style: const TextStyle(fontSize: 12, color: Colors.blue),
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
    return SizedBox(
      width: 300,
      child: Row(
        children: listOfSize.map((cat) {
          return Flexible(
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
          );
        }).toList(),
      ),
    );
  }
}

class Quantity extends StatefulWidget {
  const Quantity({super.key});

  @override
  State<Quantity> createState() => _QuantityState();
}

class _QuantityState extends State<Quantity> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Quantity:'),
        const Size(w: 10),
        DropdownButton<int>(
          value: quantity,
          items: List.generate(10, (index) => index + 1)
              .map((value) => DropdownMenuItem<int>(
                    value: value,
                    child: Text(value.toString()),
                  ))
              .toList(),
          onChanged: (value) {
            setState(() {
              quantity = value!;
            });
          },
        ),
        const Size(w: 10),
      ],
    );
  }
}
