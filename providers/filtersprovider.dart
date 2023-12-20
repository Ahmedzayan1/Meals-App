import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Filter {
  _glutenfreeSet,
  _lactosefree,
  _vegan,
  _vegetarian,
}

class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier()
      : super({
          Filter._glutenfreeSet: false,
          Filter._lactosefree: false,
          Filter._vegan: false,
          Filter._vegetarian: false,
        });
  void setFilters(Map<Filter, bool> chosenfilter) {
    state = chosenfilter;
  }

  void setfilter(Filter filter, bool isActive) {
    state = {
      ...state,
      filter: isActive,
    };
  }
}

final filterProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>(
        (ref) => FiltersNotifier());
