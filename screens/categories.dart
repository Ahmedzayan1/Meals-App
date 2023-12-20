import 'package:flutter/material.dart';
import 'package:mealsapp/data/dummy_data.dart';
import 'package:mealsapp/models/category.dart';
import 'package:mealsapp/models/meal.dart';
import 'package:mealsapp/screens/meals.dart';
import 'package:mealsapp/widgets/category_grid_item.dart';

class categoryscreen extends StatefulWidget {
  const categoryscreen({super.key, required this.availablemeals});
  final List<Meal> availablemeals;

  @override
  State<categoryscreen> createState() => _categoryscreenState();
}

class _categoryscreenState extends State<categoryscreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationControl;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationControl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      lowerBound: 0,
      upperBound: 1,
    );
    _animationControl.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationControl.dispose();
    super.dispose();
  }

  void _selectscreen(BuildContext context, Category1 category) {
    final filteredMeals = widget.availablemeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context1) => MealsScreen(
            title: category.title,
            meals: filteredMeals,
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnimatedBuilder(
            animation: _animationControl,
            child: GridView(
                padding:
                    const EdgeInsets.symmetric(vertical: 24, horizontal: 15),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                children: [
                  for (final category in availableCategories)
                    CategoryGridItem(
                      category: category,
                      onSelectCategory: () {
                        _selectscreen(context, category);
                      },
                    )
                ]),
            builder: (context, child) => SlideTransition(
                  child: child,
                  position:
                      (Tween(begin: const Offset(0.3, 0.3), end: Offset(0, 0))
                          .animate(CurvedAnimation(
                    parent: _animationControl,
                    curve: Curves.easeInOut,
                  ))),
                )));
  }
}
