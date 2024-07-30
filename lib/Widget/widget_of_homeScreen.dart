import 'package:ecomorse/constants/AppConstants.dart';
import 'package:flutter/material.dart';

class NewWidget extends StatelessWidget {
  const NewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        height: 45,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Center(
            child: Text(
          'All product',
          style: TextStyle(color: white),
        )),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: orange,
        ),
      ),
    );
  }
}

// ignore: must_be_immutable

// ====================== Section of slide Under SearchBar ===============
class Category extends StatefulWidget {
  final Function(String) onback;

  const Category({super.key, required this.onback});
  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  final List<String> category = ['All product', 'Desc', 'Category', 'Top 10 limit'];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: category.map((cat) {
        return InkWell(
          onTap: () {
            widget.onback(cat);
          },
          child: Padding(
            padding: EdgeInsets.all(4.0),
            child: AnimatedContainer(
              height: 45,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: yoursellect == cat ? orange : orangelite,
              ),
              duration: const Duration(milliseconds: 500),
              child: Center(
                child: Text(
                  cat,
                  style: TextStyle(
                    color: yoursellect == cat ? Colors.white : orange,
                  ),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

Padding Section_of_slide_Under_SearchBarStatee(String name_of_section) {
  return Padding(
    padding: EdgeInsets.all(4.0),
    child: AnimatedContainer(
      height: 45,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: yoursellect == name_of_section ? orange : orangelite,
      ),
      duration: const Duration(milliseconds: 500),
      child: Center(
          child: Text(
        name_of_section,
        style:
            TextStyle(color: yoursellect == name_of_section ? white : orange),
      )),
    ),
  );
}
