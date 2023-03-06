import 'package:flutter/material.dart';
import '../widgets/meal_items.dart';
import './../dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {

  // final String categoryId;
  // final String categoryTitle;

  // const CategoryMealsScreen(this.categoryId, this.categoryTitle);

  @override
  Widget build(BuildContext context) {

    final routeArgs = ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];

    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    
    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle!)),
      body: ListView.builder(itemBuilder: (context, index) {
        return MealItems(
          id: categoryMeals[index].id,
          title: categoryMeals[index].title, 
          imageUrl: categoryMeals[index].imageUrl, 
          duration: categoryMeals[index].duration, 
          complexity: categoryMeals[index].complexity, 
          affordability: categoryMeals[index].affordability
        );
      }, itemCount: categoryMeals.length,),
    );
  }
}