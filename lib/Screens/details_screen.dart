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

  final ValueNotifier<bool> colorSelectedNotifier = ValueNotifier<bool>(false);

  @override
  void dispose() {
    colorSelectedNotifier.dispose();
    super.dispose();
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
                    SizedBox(width: 180, child: ColorSelection(onColorSelected: (isSelected) {
                      colorSelectedNotifier.value = isSelected;
                    })),
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
                    ValueListenableBuilder<bool>(
                      valueListenable: colorSelectedNotifier,
                      builder: (context, ifcolorSelected, child) {
                        return AddToCartButton(
                          ifcolorSelected: ifcolorSelected,
                          listOfDetails: listOfDetails,
                          quantity: quantity,
                        );
                      },
                    ),
                  ],
                ),
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

class ColorSelection extends StatefulWidget {
  final Function(bool) onColorSelected;

  const ColorSelection({super.key, required this.onColorSelected});

  @override
  _ColorSelectionState createState() => _ColorSelectionState();
}

class _ColorSelectionState extends State<ColorSelection> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(colors.length, (index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              colorselected = index;
              widget.onColorSelected(true);
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
              colorselected == index
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

class AddToCartButton extends StatefulWidget {
  final bool ifcolorSelected;
  final List listOfDetails;
  final int quantity;

  const AddToCartButton({super.key, required this.ifcolorSelected, required this.listOfDetails, required this.quantity});

  @override
  _AddToCartButtonState createState() => _AddToCartButtonState();
}

class _AddToCartButtonState extends State<AddToCartButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (!widget.ifcolorSelected) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Select Color')),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('added to cart')),
          );
          addCart(widget.listOfDetails[0].id!, widget.quantity);
        }
      },
      child: AnimatedContainer(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: widget.ifcolorSelected ? blue : Colors.grey,
        ),
        duration: const Duration(milliseconds: 500),
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
    );
  }
}