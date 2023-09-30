import 'package:flutter/material.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegan,
  vegetarian,
}

class FilterScreen extends StatefulWidget {
  FilterScreen({
    super.key,
    required this.glutenFreeFilterSet,
    required this.lactoseFreeFilterSet,
    required this.veganFilterSet,
    required this.vegetarianFilterSet,
  });

  bool glutenFreeFilterSet;
  bool lactoseFreeFilterSet;
  bool veganFilterSet;
  bool vegetarianFilterSet;

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            Filter.glutenFree: widget.glutenFreeFilterSet,
            Filter.lactoseFree: widget.lactoseFreeFilterSet,
            Filter.vegan: widget.veganFilterSet,
            Filter.vegetarian: widget.vegetarianFilterSet,
          });
          return false;
        },
        child: Column(
          children: [
            SwitchListTile(
              value: widget.glutenFreeFilterSet,
              onChanged: (newValue) {
                setState(() {
                  widget.glutenFreeFilterSet = newValue;
                });
              },
              title: Text(
                'Gluten-Free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'only include Gulten-free meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              contentPadding: const EdgeInsets.all(12),
            ),
            SwitchListTile(
              value: widget.lactoseFreeFilterSet,
              onChanged: (newValue) {
                setState(() {
                  widget.lactoseFreeFilterSet = newValue;
                });
              },
              title: Text(
                'Lactose-Free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'only include Lactose-free meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              contentPadding: const EdgeInsets.all(12),
            ),
            SwitchListTile(
              value: widget.veganFilterSet,
              onChanged: (newValue) {
                setState(() {
                  widget.veganFilterSet = newValue;
                });
              },
              title: Text(
                'Vegan',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'only include Vegan meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              contentPadding: const EdgeInsets.all(12),
            ),
            SwitchListTile(
              value: widget.vegetarianFilterSet,
              onChanged: (newValue) {
                setState(() {
                  widget.vegetarianFilterSet = newValue;
                });
              },
              title: Text(
                'Vegetarian',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'only include Vegetarian meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              contentPadding: const EdgeInsets.all(12),
            )
          ],
        ),
      ),
    );
  }
}
