import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer_item.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String, bool>currentFilter;
  const FilterScreen(this.saveFilters, this.currentFilter);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFree;
  var _vegetarian;
  var _vegan;
  var _lactoseFree;

  @override
  initState(){
    _glutenFree = widget.currentFilter['gluten'];

    _vegetarian = widget.currentFilter['vegetarian'];

    _vegan = widget.currentFilter['vegan'];

    _lactoseFree = widget.currentFilter['lactose'];

    super.initState();
  }

  Widget _buildSwitchListTile(
      bool option, String title, Function(bool) swapValue,
      [String subtitle = ""]) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: option,
      onChanged: swapValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final Map<String, bool> selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget.saveFilters(selectedFilters);
            },
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(children: [
        //Text('Filters'),
        Container(
          padding: EdgeInsets.all(20),
          child: Text(
            'Adjust your meal selection',
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        Expanded(
            child: ListView(
          children: [
            _buildSwitchListTile(_glutenFree, "Gluten-free", (newValue) {
              setState(() {
                _glutenFree = newValue;
              });
            }, 'only include gluten free meals'),
            _buildSwitchListTile(_vegetarian, "Vegetarian", (newValue) {
              setState(() {
                _vegetarian = newValue;
              });
            }),
            _buildSwitchListTile(_vegan, "Vegan", (newValue) {
              setState(() {
                _vegan = newValue;
              });
            }),
            _buildSwitchListTile(_lactoseFree, "lactose-free", (newValue) {
              setState(() {
                _lactoseFree = newValue;
              });
            }, 'only include lactose free meals'),
          ],
        ))
      ]),
    );
  }
}
