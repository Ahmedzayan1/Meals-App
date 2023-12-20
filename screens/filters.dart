import 'package:flutter/material.dart';

enum Filter { glutenfree, lactosefree, vegetarian, vegan }

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.currentFilters});
  final Map<Filter, bool> currentFilters;
  @override
  State<StatefulWidget> createState() {
    return _FilterScreen();
  }
}

class _FilterScreen extends State<FiltersScreen> {
  var _glutenfreeSet = false;
  var _lactosefree = false;
  var _vegan = false;
  var _vegetarian = false;
  @override
  void initState() {
    super.initState();
    _glutenfreeSet = widget.currentFilters[Filter.glutenfree]!;
    _lactosefree = widget.currentFilters[Filter.lactosefree]!;
    _vegan = widget.currentFilters[Filter.vegan]!;
    _vegetarian = widget.currentFilters[Filter.vegetarian]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: MainDrawer(onSelectScreen: ((identifier) {
      //   Navigator.of(context).pop();
      //   if (identifier == 'Meals') {
      //     Navigator.of(context).pushReplacement(
      //         MaterialPageRoute(builder: (ctx) => const Tabscreen()));
      //   }
      // })),
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            Filter.glutenfree: _glutenfreeSet,
            Filter.lactosefree: _lactosefree,
            Filter.vegan: _vegan,
            Filter.vegetarian: _vegetarian
          });
          return false;
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _vegan,
              onChanged: (ischecked) {
                setState(() {
                  _vegan = ischecked;
                });
              },
              title: const Text('Vegan'),
              activeColor: Theme.of(context).colorScheme.tertiary,
            ),
            SwitchListTile(
              value: _glutenfreeSet,
              onChanged: (ischecked) {
                setState(() {
                  _glutenfreeSet = ischecked;
                });
              },
              title: const Text('Gluten-Free'),
              activeColor: Theme.of(context).colorScheme.tertiary,
            ),
            SwitchListTile(
              value: _lactosefree,
              onChanged: (ischecked) {
                setState(() {
                  _lactosefree = ischecked;
                });
              },
              title: const Text('Lactose-Free'),
              activeColor: Theme.of(context).colorScheme.tertiary,
            ),
            SwitchListTile(
              value: _vegetarian,
              onChanged: (ischecked) {
                setState(() {
                  _vegetarian = ischecked;
                });
              },
              title: const Text('vegetarian'),
              activeColor: Theme.of(context).colorScheme.tertiary,
            )
          ],
        ),
      ),
    );
  }
}
