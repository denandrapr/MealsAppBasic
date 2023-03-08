import 'package:flutter/material.dart';
import 'package:udemy_meals_app/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  
  final dynamic saveFilters;
  final Map<String, bool> currentFilter;

  FilterScreen(this.currentFilter, this.saveFilters);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {

  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilter['gluten'] as bool;
    _vegetarian = widget.currentFilter['vegetarian'] as bool;
    _vegan = widget.currentFilter['vegan'] as bool;
    _lactoseFree = widget.currentFilter['lactose'] as bool;
    super.initState();
  }

  Widget _buildSwitchListTile(String title, String description, bool currentValue, dynamic updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue, 
      subtitle: Text(description),
      onChanged: updateValue
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter'),
        actions: [
          IconButton(
            onPressed: () {
              final selectedFilters = {
                'gluten' : _glutenFree,
                'lactose' : _lactoseFree,
                'vegan' : _vegan,
                'vegetarian' : _vegetarian,
              };
              widget.saveFilters(selectedFilters);
            }, 
            icon: Icon(Icons.save)
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListTile(
                  'Gluten-free', 
                  'Only include gluten-free meals', 
                  _glutenFree,
                  (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  }  
                ),
                _buildSwitchListTile(
                  'Lactose-free', 
                  'Only include lactose-free meals', 
                  _lactoseFree,
                  (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  }  
                ),
                _buildSwitchListTile(
                  'Vegetarian', 
                  'Only include vegetarian meals', 
                  _vegetarian,
                  (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  }  
                ),
                _buildSwitchListTile(
                  'Vegan', 
                  'Only include vegan meals', 
                  _vegan,
                  (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  }  
                ),
              ],
            ),
          )
        ],
      )
    );
  }
}