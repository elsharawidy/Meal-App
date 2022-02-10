import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  final Function activateFilters;
  final Map<String, bool> currentFilters;
  FiltersScreen(this.currentFilters, this.activateFilters);
  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegeterian = false;
  bool _vegan = false;
  bool _lactoseFree = false;
  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _vegeterian = widget.currentFilters['vegeterian'];
    _vegan = widget.currentFilters['vegan'];
    _lactoseFree = widget.currentFilters['lactose'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Filters'),
        actions: [
          IconButton(
              onPressed: () {
                final selectedFilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegeterian': _vegeterian,
                };
                widget.activateFilters(selectedFilters);
              },
              icon: Icon(Icons.save))
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Theme.of(context).accentColor,
            child: Text(
              'Adjust your meal selection :)',
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              SwitchListTile(
                title: Text('Gluten-Free'),
                value: _glutenFree,
                subtitle: Text(
                  'Only includes gluten-free meals!',
                  style: TextStyle(fontSize: 16, fontFamily: 'RobotoCondensed'),
                ),
                onChanged: (xValue) {
                  setState(() {
                    _glutenFree = xValue;
                  });
                },
              ),
              SwitchListTile(
                title: Text('vegeterian'),
                value: _vegeterian,
                subtitle: Text(
                  'Only includes vegeterian meals!',
                  style: TextStyle(fontSize: 16, fontFamily: 'RobotoCondensed'),
                ),
                onChanged: (newValue) {
                  setState(() {
                    _vegeterian = newValue;
                  });
                },
              ),
              SwitchListTile(
                title: Text('vegan'),
                value: _vegan,
                subtitle: Text(
                  'Only includes vegan meals!',
                  style: TextStyle(fontSize: 16, fontFamily: 'RobotoCondensed'),
                ),
                onChanged: (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                },
              ),
              SwitchListTile(
                title: Text('lactose-Free'),
                value: _lactoseFree,
                subtitle: Text(
                  'Only includes lactose-Free meals!',
                  style: TextStyle(fontSize: 16, fontFamily: 'RobotoCondensed'),
                ),
                onChanged: (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                },
              ),
            ],
          ))
        ],
      ),
    );
  }
}
