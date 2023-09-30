import 'package:flutter/material.dart';
import 'package:meals_app/Screens/meals_details_screen.dart';
import 'package:meals_app/widgets/meal_item_treat.dart';
import 'package:transparent_image/transparent_image.dart';

import '../models/meals_model.dart';

class MealGridItem extends StatelessWidget {
  const MealGridItem({
    super.key,
    required this.meal,
    required this.toggleFav,
    required this.favMeal,
  });

  final void Function(Meal meal) toggleFav;
  final Meal meal;
  final List<Meal> favMeal;

  String getFirstUpperCase(String name) {
    return name[0].toUpperCase() + name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return MealsDetailsScreen(
              meal: meal,
              toggleFav: toggleFav,
              favMeals: favMeal,
            );
          }));
        },
        child: Stack(
          children: [
            FadeInImage(
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal!.imageUrl),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                color: Colors.black45,
                child: Column(
                  children: [
                    Text(
                      meal!.title,
                      maxLines: 2,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MealItemTrait(
                          icon: Icons.schedule,
                          label: '${meal!.duration} min',
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        MealItemTrait(
                          icon: Icons.business_center,
                          label: getFirstUpperCase(meal.complexity.name),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        MealItemTrait(
                          icon: Icons.attach_money,
                          label: getFirstUpperCase(meal.affordability.name),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
