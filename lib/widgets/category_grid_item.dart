import 'package:flutter/material.dart';
import 'package:meals_app/Screens/meals.dart';
import 'package:meals_app/models/meals_model.dart';

import '../Screens/filter_screen.dart';
import '../models/category_model.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({
    required this.category,
    required this.toggleFav,
    required this.favMeals,
    required this.selectedFilter,
    super.key,
  });
  final Map<Filter,bool> selectedFilter;
  final List<Meal> favMeals;
  final void Function(Meal meal) toggleFav;
  final Category category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return MealsScreen(
            title: category.title,
            meals: category.getMealsById(selectedFilter),
            toggleFav: toggleFav,
            favMeals: favMeals
          );
        }));
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(7),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                category.color.withOpacity(.44),
                category.color.withOpacity(.8),
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
            borderRadius: BorderRadius.circular(7)),
        child:
            Text(category.title, style: Theme.of(context).textTheme.titleLarge),
      ),
    );
  }
}
