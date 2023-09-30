import 'package:flutter/material.dart';

import '../models/meals_model.dart';

class MealsDetailsScreen extends StatefulWidget {
  const MealsDetailsScreen({
    super.key,
    required this.meal,
    required this.toggleFav,
    required this.favMeals,
  });

  final List<Meal> favMeals;
  final Meal meal;
  final void Function(Meal meal) toggleFav;

  @override
  State<MealsDetailsScreen> createState() => _MealsDetailsScreenState();
}

class _MealsDetailsScreenState extends State<MealsDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    bool isFav = widget.favMeals.contains(widget.meal);
    final kTitle = Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Theme.of(context).colorScheme.primary,
        );
    final kBody = Theme.of(context).textTheme.bodyLarge!.copyWith(
          color: Theme.of(context).colorScheme.onBackground,
        );
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.meal.title),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                widget.toggleFav(widget.meal);
              });
            },
            icon: Icon(
              isFav == false ? Icons.star_outline : Icons.star,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              widget.meal.imageUrl,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              'Ingredients',
              style: kTitle,
            ),
            const SizedBox(
              height: 12,
            ),
            for (final ingredient in widget.meal.ingredients)
              Text(
                ingredient,
                style: kBody,
              ),
            const SizedBox(
              height: 12,
            ),
            Text(
              'Steps',
              style: kTitle,
            ),
            for (final step in widget.meal.steps)
              Container(
                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
                child: Text(
                  step,
                  style: kBody,
                  textAlign: TextAlign.center,
                ),
              )
          ],
        ),
      ),
    );
  }
}
