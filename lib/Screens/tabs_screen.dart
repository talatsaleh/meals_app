import 'package:flutter/material.dart';
import 'package:meals_app/Screens/categories.dart';
import 'package:meals_app/Screens/filter_screen.dart';
import 'package:meals_app/Screens/meals.dart';
import 'package:meals_app/widgets/drawer.dart';

import '../models/meals_model.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

const initFilter = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

class _TabsScreenState extends State<TabsScreen> {
  final List<Meal> _favMeals = [];

  Map<Filter, bool> _selectedFilter = initFilter;

  void _toggleFavorites(Meal meal) {
    final isFav = _favMeals.contains(meal);
    if (isFav) {
      setState(() {
        _favMeals.remove(meal);
      });
    } else {
      setState(() {
        _favMeals.add(meal);
      });
    }
  }

  int _selectedIndex = 0;

  void _selectPage(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void selectedIdentifier(String identifier) async {
    if (identifier == 'filter') {
      Navigator.of(context).pop();
      final result = await Navigator.of(context)
          .push<Map<Filter, bool>>(MaterialPageRoute(builder: (ctx) {
        return FilterScreen(
          glutenFreeFilterSet: _selectedFilter[Filter.glutenFree]!,
          lactoseFreeFilterSet: _selectedFilter[Filter.lactoseFree]!,
          veganFilterSet: _selectedFilter[Filter.vegan]!,
          vegetarianFilterSet: _selectedFilter[Filter.vegetarian]!,
        );
      }));
      _selectedFilter = result ?? initFilter;
    } else {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget activeScreen = CategoriesScreen(
      toggleFav: _toggleFavorites,
      favMeals: _favMeals,
      selectedFilter: _selectedFilter,
    );
    String activeTitle = 'Categories';
    if (_selectedIndex == 1) {
      activeScreen =
          MealsScreen(favMeals: _favMeals, toggleFav: _toggleFavorites);
      activeTitle = 'Your Favorites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activeTitle),
      ),
      drawer: MainDrawer(
        selectIdentifier: selectedIdentifier,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.restaurant_menu,
              ),
              label: 'Categories'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.star,
              ),
              label: 'Favorites')
        ],
      ),
      body: activeScreen,
    );
  }
}
