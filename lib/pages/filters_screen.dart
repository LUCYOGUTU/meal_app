import 'package:flutter/material.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  static const routeName = 'filtersScreen';

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegeterian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: const Text(
              'Adjust your meal selection',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                SwitchListTile(
                  value: _glutenFree,
                  onChanged: (value) {
                    setState(() {
                      _glutenFree = value;
                    });
                  },
                  title: const Text('Gluten Free'),
                  subtitle: const Text('Only include gluten free meals'),
                ),
                SwitchListTile(
                  value: _vegeterian,
                  onChanged: (value) {
                    setState(() {
                      _vegeterian = value;
                    });
                  },
                  title: const Text('Vegeterian'),
                  subtitle: const Text('Only include vegeterian meals'),
                ),
                SwitchListTile(
                  value: _vegan,
                  onChanged: (value) {
                    setState(() {
                      _vegan = value;
                    });
                  },
                  title: const Text('Vegan'),
                  subtitle: const Text('Only include vegan meals'),
                ),
                SwitchListTile(
                  value: _lactoseFree,
                  onChanged: (value) {
                    setState(() {
                      _lactoseFree = value;
                    });
                  },
                  title: const Text('Lactose Free'),
                  subtitle: const Text('Only include lactose free meals'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
