import 'package:flutter/material.dart';
import 'package:udemy_meals_app/screens/meal_detail_screen.dart';
import 'package:udemy_meals_app/screens/tab_screen.dart';
import './screens/category_meals_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          labelLarge: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          labelMedium: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          titleMedium: const TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold
          ),
        )
      ),
      // home: const CategoriesScreen(),
      initialRoute: '/',
      routes: {
        '/' : (context) => TabScreen(),
        '/category-meals' : (context) => CategoryMealsScreen(),
        '/meal-detail' : (context) => MealDetailScreen(),
      },
    );
  }
}
