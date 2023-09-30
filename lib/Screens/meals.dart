import 'package:flutter/material.dart';
import 'package:meals_app/widgets/meal_grid_item.dart';

import '../models/meals_model.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    this.title,
    this.meals,
    required this.toggleFav,
    required this.favMeals,
  });

  final void Function(Meal meal) toggleFav;
  final String? title;
  final List<Meal>? meals;
  final List<Meal> favMeals;

  @override
  Widget build(BuildContext context) {
    Widget content;
    Widget stringWidget(String string) {
      return Text(
        string,
        style: Theme
            .of(context)
            .textTheme
            .bodyLarge
            ?.copyWith(color: Theme
            .of(context)
            .colorScheme
            .onBackground),
      );
    }
    if (meals == null) {
      print('not meals');
      if (favMeals.isEmpty) {
        print('is empty');
        content = Center(
            child: stringWidget(
                'There is no Favorites Meals to see here.. try to Add one')
        );
      } else {
        print('not empty');
        content = ListView.builder(
            itemBuilder: (ctx, index) {
              return MealGridItem(
                meal: favMeals[index],
                toggleFav: toggleFav,
                favMeal: favMeals,
              );
            },
            itemCount: favMeals!.length);
      }
    } else {
      if (meals!.isEmpty) {
        content = const Center(
          child: Text('Ops... there is no meals to see.. try add one'),
        );
      } else {
        content = ListView.builder(
            itemBuilder: (ctx, index) {
              return MealGridItem(
                meal: meals![index],
                toggleFav: toggleFav,
                favMeal: favMeals,
              );
            },
            itemCount: meals!.length);
      }
    }

    if (title == null) {
      return content;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,

    );
  }
}