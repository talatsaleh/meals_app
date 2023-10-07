import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/favorite_provider.dart';

import '../models/meals_model.dart';

class MealsDetailsScreen extends ConsumerWidget {
  const MealsDetailsScreen({
    super.key,
    required this.meal,
  });

  final Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favMeals = ref.watch(favoriteMealsProvider);
    bool isFav = favMeals.contains(meal);
    final kTitle = Theme
        .of(context)
        .textTheme
        .titleLarge!
        .copyWith(
      color: Theme
          .of(context)
          .colorScheme
          .primary,
    );
    final kBody = Theme
        .of(context)
        .textTheme
        .bodyLarge!
        .copyWith(
      color: Theme
          .of(context)
          .colorScheme
          .onBackground,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              ref
                  .read(favoriteMealsProvider.notifier)
                  .toggleMealFavoriteStatus(meal);
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
              meal.imageUrl,
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
            for (final ingredient in meal.ingredients)
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
            for (final step in meal.steps)
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
