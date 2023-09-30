import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/meals_model.dart';
import 'package:meals_app/widgets/category_grid_item.dart';

import 'filter_screen.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen(
      {super.key,
      required this.toggleFav,
      required this.favMeals,
      required this.selectedFilter});

  final void Function(Meal meal) toggleFav;
  final List<Meal> favMeals;
  final Map<Filter, bool> selectedFilter;

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(15),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
      ),
      children: [
        for (final category in availableCategories)
          CategoryGridItem(
            category: category,
            toggleFav: toggleFav,
            favMeals: favMeals,
            selectedFilter: selectedFilter,
          ),
      ],
    );
  }
}
