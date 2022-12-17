import 'package:flutter/material.dart';

class DropDownCategories extends StatefulWidget {
  const DropDownCategories({super.key, required this.fun});

  final Function fun;

  @override
  State<DropDownCategories> createState() => _DropDownCategoriesState();
}

class _DropDownCategoriesState extends State<DropDownCategories> {
  final List<String> cat = [
    'Electronics',
    'Furniture',
    'Baby',
    'Sports',
    'Fashion',
    'Laptop',
    'Other'
  ];
  late String category;

  @override
  void initState() {
    category = cat.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: DropdownButton<String>(
        value: category,
        onChanged: (String? value) {
          setState(() {
            category = value!;
          });
          widget.fun(value!);
        },
        items: cat.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem(
            value: value,
            child: Align(alignment: Alignment.center, child: Text(value)),
          );
        }).toList(),
      ),
    );
  }
}
