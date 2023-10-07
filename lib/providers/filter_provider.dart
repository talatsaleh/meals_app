import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegan,
  vegetarian,
}

class FilterUpdateNotifier extends StateNotifier<Map<Filter, bool>> {
  FilterUpdateNotifier(this.ref)
      : super({
          Filter.glutenFree: false,
          Filter.lactoseFree: false,
          Filter.vegetarian: false,
          Filter.vegan: false,
        });
  final Ref ref;

  void setFilterTo(Filter filter, bool isActive) {
    state = {
      ...state,
      filter: isActive,
    };
  }
}

final filterProvider =
    StateNotifierProvider<FilterUpdateNotifier, Map<Filter, bool>>(
  (ref) => FilterUpdateNotifier(ref),
);
