import 'package:flutter/material.dart';

import '../Screens/filter_screen.dart';
import '../data/dummy_data.dart';
import 'meals_model.dart';

class Category {
  const Category({
    required this.id,
    required this.title,
    this.color = Colors.orange,
  });

  final String id;
  final String title;
  final Color color;


  List<Meal> getMealsById(Map<Filter, bool> filters) {
    List<Meal>? meals =
        dummyMeals.where((meal) => meal.categories.contains(id)).toList();
    if (filters[Filter.glutenFree]!) {
      meals = meals.where((meal) {
        return meal.isGlutenFree;
      }).toList();
    }
    if (filters[Filter.lactoseFree]!) {
      meals.where((meal) {
        return meal.isLactoseFree == true;
      });
    }
    if (filters[Filter.vegan]!) {
      meals = meals.where((meal) {
        return meal.isVegan;
      }).toList();
    }
    if (filters[Filter.vegetarian]!) {
      meals = meals.where((meal) {
        return meal.isVegetarian == true;
      }).toList();
    }
    return meals;
  }
}
