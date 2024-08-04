import 'package:ecomorse/constants/AppConstants.dart';
import 'package:flutter/material.dart';

// class NewWidget extends StatelessWidget {
//   const NewWidget({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(4.0),
//       child: Container(
//         height: 45,
//         padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
//         child: Center(
//             child: Text(
//           'All product',
//           style: TextStyle(color: white),
//         )),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(25),
//           color: orange,
//         ),
//       ),
//     );
//   }
// }

// ignore: must_be_immutable
// ====================== Section of slide Under SearchBar ===============
class CategoryBar extends StatefulWidget {
  final Function(String) onback;

  const CategoryBar({super.key, required this.onback});
  @override
  State<CategoryBar> createState() => _CategoryBarState();
}

class _CategoryBarState extends State<CategoryBar> {
  

  @override
  Widget build(BuildContext context) {
    return Row(
      children: category.map((cat) {
        return Expanded(
          child: InkWell(
            onTap: () {
              selectedCategory = cat;
              widget.onback(cat);
            },
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: AnimatedContainer(
                height: 45,
                padding: const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: selectedCategory != cat
                      ? Border.all(color: Colors.black12)
                      : Border.all(color: white),
                  color: selectedCategory == cat ? blue : white,
                ),
                duration: const Duration(milliseconds: 500),
                child: Center(
                  child: Expanded(
                    child: Text(
                      cat,
                      style: TextStyle(
                        color: selectedCategory == cat ? Colors.white : black,
                      ),
                    ),
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

// Padding Section_of_slide_Under_SearchBarStatee(String name_of_section) {
//   return Padding(
//     padding: EdgeInsets.all(4.0),
//     child: AnimatedContainer(
//       height: 45,
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(25),
//         color: selectedCategory == name_of_section ? orange : orangelite,
//       ),
//       duration: const Duration(milliseconds: 500),
//       child: Center(
//           child: Text(
//         name_of_section,
//         style: TextStyle(
//             color: selectedCategory == name_of_section ? white : orange),
//       )),
//     ),
//   );
// }
