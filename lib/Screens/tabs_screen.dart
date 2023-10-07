import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/Screens/categories.dart';
import 'package:meals_app/Screens/filter_screen.dart';
import 'package:meals_app/Screens/meals.dart';
import 'package:meals_app/providers/favorite_provider.dart';
import 'package:meals_app/providers/meals_provider.dart';
import 'package:meals_app/widgets/drawer.dart';

import '../providers/filter_provider.dart';


class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}



class _TabsScreenState extends ConsumerState<TabsScreen> {
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
        return const FilterScreen();
      }));
    } else {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final favMeal = ref.watch(favoriteMealsProvider);
    final meals = ref.watch(mealsProvider);
    Widget activeScreen = CategoriesScreen(
      favMeals: meals,
    );
    String activeTitle = 'Categories';
    if (_selectedIndex == 1) {
      activeScreen = MealsScreen(
        meals: favMeal,
      );
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
