import 'package:flutter/material.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class FiltersScreen extends StatelessWidget {
  const FiltersScreen({super.key});

  static const routeName = 'filtersScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      drawer: const MainDrawer(),
      body: Center(
        child: Text('Filters'),
      ),
    );
  }
}
