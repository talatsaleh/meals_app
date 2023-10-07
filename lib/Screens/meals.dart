import 'package:flutter/material.dart';
import 'package:meals_app/widgets/meal_grid_item.dart';

import '../models/meals_model.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    this.title,
    required this.meals,
  });

  final String? title;
  final List<Meal> meals;

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

    if (meals.isEmpty) {
      print('is empty');
      content = Center(
          child: stringWidget(title == null
              ? 'there is no favorite try add one'
              : 'there is no meals here'));
    } else {
      content = ListView.builder(
          itemBuilder: (ctx, index) {
            return MealGridItem(
              meal: meals[index],
            );
          },
          itemCount: meals.length);
    }
    if (title != null) {
      return Scaffold(
        appBar: AppBar(
          title: Text(title!),
        ),
        body: content,
      );
    } else {
      return content;
    }
  }
}
