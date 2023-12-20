import 'package:flutter/material.dart';
import 'package:mealsapp/providers/favprovider.dart';
import 'package:mealsapp/screens/categories.dart';
import 'package:mealsapp/screens/filters.dart';
import 'package:mealsapp/screens/meals.dart';
import 'package:mealsapp/widgets/main_drawer.dart';
import 'package:mealsapp/providers/meals_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Tabscreen extends ConsumerStatefulWidget {
  const Tabscreen({super.key});
  @override
  ConsumerState<Tabscreen> createState() {
    return _tabscreen();
  }
}

class _tabscreen extends ConsumerState<Tabscreen> {
  int _selectedpage = 0;
  Map<Filter, bool> _selectedFilters = {
    Filter.glutenfree: false,
    Filter.lactosefree: false,
    Filter.vegan: false,
    Filter.vegetarian: false
  };
  void _selectpage(int index) {
    setState(() {
      _selectedpage = index;
    });
  }

  void showinfomsg(String msg) {}

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'Filters') {
      final result =
          await Navigator.of(context).push<Map<Filter, bool>>(MaterialPageRoute(
              builder: (ctx) => FiltersScreen(
                    currentFilters: _selectedFilters,
                  )));
      setState(() {
        _selectedFilters = result ??
            {
              Filter.glutenfree: false,
              Filter.lactosefree: false,
              Filter.vegan: false,
              Filter.vegetarian: false
            };
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final meals = ref.watch(mealsProvider);
    final availablemeals = meals.where((meal) {
      if (_selectedFilters[Filter.glutenfree]! && !meal.isGlutenFree) {
        return false;
      }
      if (_selectedFilters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      if (_selectedFilters[Filter.lactosefree]! && !meal.isLactoseFree) {
        return false;
      }
      if (_selectedFilters[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      return true;
    }).toList();

    Widget activepage = categoryscreen(
      availablemeals: availablemeals,
    );
    var activetitle = 'Categories';
    if (_selectedpage == 1) {
      final favMeals = ref.watch(favprovider);
      activepage = MealsScreen(
        meals: favMeals,
      );
      activetitle = 'your favorites';
    }
    return Scaffold(
      drawer: MainDrawer(onSelectScreen: _setScreen),
      appBar: AppBar(
        title: Text(activetitle),
      ),
      body: activepage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectpage,
        currentIndex: _selectedpage,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites')
        ],
      ),
    );
  }
}
