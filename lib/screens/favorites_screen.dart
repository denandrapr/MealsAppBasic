import 'package:flutter/material.dart';
import 'package:udemy_meals_app/models/meal.dart';
import 'package:udemy_meals_app/widgets/meal_items.dart';

class FavoritesScreen extends StatelessWidget {
  
  final List<Meal> favoriteMeal;

  FavoritesScreen(this.favoriteMeal);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeal.isEmpty) {
      return Center(
        child: Text('Favorites Screen'),
      );
    } else {
      return ListView.builder(itemBuilder: (context, index) {
          return MealItems(
            id: favoriteMeal[index].id,
            title: favoriteMeal[index].title, 
            imageUrl: favoriteMeal[index].imageUrl, 
            duration: favoriteMeal[index].duration, 
            complexity: favoriteMeal[index].complexity, 
            affordability: favoriteMeal[index].affordability,
          );
        }, itemCount: favoriteMeal.length,);
    }
  }
}