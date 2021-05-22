import 'package:RecipeReview/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String, bool> currentFilters;
  FilterScreen(this.saveFilters, this.currentFilters);
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree;
  bool _vegetarian;
  bool _vegan;
  bool _lactoseFree;
  @override
  initState() {
    super.initState();
    _glutenFree = widget.currentFilters['gluten'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _vegan = widget.currentFilters['vegan'];
    _lactoseFree = widget.currentFilters['lactose'];
  }

  Widget _buildSwttchListTile(String title, String description,
      bool currentValue, Function updateValuee) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateValuee,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your filters'),
          actions: [
            IconButton(
                icon: Icon(Icons.save),
                onPressed: () {
                  final selectedFilters = {
                    'gluten': _glutenFree,
                    'lactose': _lactoseFree,
                    'vegan': _vegan,
                    'vegetarian': _vegetarian,
                  };
                  widget.saveFilters(selectedFilters);
                })
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your meal section.',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildSwttchListTile(
                      'Gluten-Free',
                      'Only included gluten-free meals',
                      _glutenFree, (newVlaue) {
                    setState(() {
                      _glutenFree = newVlaue;
                    });
                  }),
                  _buildSwttchListTile(
                      'Vegetarian',
                      'Only included vegetarian meals',
                      _vegetarian, (newVlaue) {
                    setState(() {
                      _vegetarian = newVlaue;
                    });
                  }),
                  _buildSwttchListTile(
                      'Lactose free',
                      'Only included lactose-free meals',
                      _lactoseFree, (newVlaue) {
                    setState(() {
                      _lactoseFree = newVlaue;
                    });
                  }),
                  _buildSwttchListTile(
                      'Vegan', 'Only included Vegan meals', _vegan, (newVlaue) {
                    setState(() {
                      _vegan = newVlaue;
                    });
                  }),
                ],
              ),
            )
          ],
        ));
  }
}
