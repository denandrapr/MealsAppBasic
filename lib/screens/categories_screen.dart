import 'package:flutter/material.dart';
import '../widgets/category_items.dart';
import '../dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(25),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20
      ),
      children: DUMMY_CATEGORIES.map((data) => 
        CategoryItem(
          data.id, 
          data.title, 
          data.color
        )
      ).toList()
    );
  }
}