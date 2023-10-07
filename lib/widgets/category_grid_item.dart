import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/Screens/meals.dart';
import 'package:meals_app/providers/filter_provider.dart';

import '../models/category_model.dart';

class CategoryGridItem extends ConsumerWidget {
  const CategoryGridItem({
    required this.category,
    super.key,
  });

  final Category category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedFilter = ref.watch(filterProvider);
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return MealsScreen(
            title: category.title,
            meals: category.getMealsById(selectedFilter),
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
