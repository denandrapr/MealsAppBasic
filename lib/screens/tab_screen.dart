import 'package:flutter/material.dart';
import 'package:udemy_meals_app/models/meal.dart';
import 'package:udemy_meals_app/screens/categories_screen.dart';
import 'package:udemy_meals_app/screens/favorites_screen.dart';
import 'package:udemy_meals_app/widgets/main_drawer.dart';

class TabScreen extends StatefulWidget {
  
  final List<Meal> favoritesMeal;

  TabScreen(this.favoritesMeal);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {

  late List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {
        'page' : CategoriesScreen(),
        'title' : 'Categories'
      },
      {
        'page' : FavoritesScreen(widget.favoritesMeal),
        'title' : 'Your Favorite'
      }
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, 
      child: Scaffold(
        appBar: AppBar(
          title: Text(_pages[_selectedPageIndex]['title'] as String),
        ),
        drawer: MainDrawer(),
        body: _pages[_selectedPageIndex]['page'] as Widget,
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          currentIndex: _selectedPageIndex,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              label: 'Categories'
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.star),
              label: 'Favorites'
            )
          ],
        ),
      )
    );
  } 
}