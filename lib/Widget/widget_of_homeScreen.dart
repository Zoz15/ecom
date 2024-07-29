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
        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
        child: Center(child: Text('All product',style: TextStyle(color: white),)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: orange,
        ),
      ),
    );
  }
}




// ignore: must_be_immutable, camel_case_types
class section_of_slide_UnderSearchBar extends StatelessWidget {
  // ignore: non_constant_identifier_names
  String name_of_section;
  // ignore: non_constant_identifier_names
  section_of_slide_UnderSearchBar(
    // ignore: non_constant_identifier_names
    {required this.name_of_section, 
    super.key,
  });
  // ignore: non_constant_identifier_names
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        height: 45,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: orange,
        ),
        child: Center(
            child: Text(
          name_of_section,
          style: TextStyle(color: white),
        )),
      ),
    );
  }
}
