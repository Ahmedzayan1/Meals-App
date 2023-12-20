import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealsapp/models/meal.dart';

class favmealsnotifier extends StateNotifier<List<Meal>> {
  favmealsnotifier() : super([]);
  bool togglemealFavstatus(Meal meal) {
    final mealIsFav = state.contains(meal);
    if (mealIsFav) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favprovider = StateNotifierProvider<favmealsnotifier, List<Meal>>((ref) {
  return favmealsnotifier();
});
