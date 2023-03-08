import 'package:flutter/material.dart';
import 'package:udemy_meals_app/models/meal.dart';
import '../widgets/meal_items.dart';
import './../dummy_data.dart';

class CategoryMealsScreen extends StatefulWidget {

  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {

  String? categoryTitle;
  List<Meal>? displayMeal;
  var _loadedInitData = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs = ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      displayMeal = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayMeal?.removeWhere((meal) => meal.id == mealId);
    });
  }

  // final String categoryId;
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle!)),
      body: ListView.builder(itemBuilder: (context, index) {
        return MealItems(
          id: displayMeal![index].id,
          title: displayMeal![index].title, 
          imageUrl: displayMeal![index].imageUrl, 
          duration: displayMeal![index].duration, 
          complexity: displayMeal![index].complexity, 
          affordability: displayMeal![index].affordability,
        );
      }, itemCount: displayMeal!.length,),
    );
  }
}