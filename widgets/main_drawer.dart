import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectScreen});
  final void Function(String identifier) onSelectScreen;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Color.fromARGB(255, 189, 173, 139),
                const Color.fromARGB(255, 185, 153, 89).withOpacity(0.999)
              ], begin: Alignment.topLeft, end: Alignment.bottomLeft)),
              child: Row(
                children: [
                  const Icon(
                    Icons.fastfood,
                    size: 48,
                    color: Color.fromARGB(255, 48, 28, 0),
                  ),
                  const SizedBox(
                    width: 18,
                  ),
                  Text(
                    'Cooking Up!',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: const Color.fromARGB(255, 48, 28, 0)),
                  )
                ],
              )),
          ListTile(
            leading: const Icon(Icons.restaurant_menu_outlined),
            title: Text(
              'Meals',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: const Color.fromARGB(255, 185, 153, 89), fontSize: 20),
            ),
            onTap: () {
              onSelectScreen('Meals');
            },
          ),
          ListTile(
            leading: const Icon(Icons.filter_alt_outlined),
            title: Text(
              'Filters',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: const Color.fromARGB(255, 185, 153, 89), fontSize: 20),
            ),
            onTap: () {
              onSelectScreen('Filters');
            },
          )
        ],
      ),
    );
  }
}
