import 'package:flutter/material.dart';
import 'package:meal_app/pages/categories_screen.dart';
import 'package:meal_app/pages/favourites_screen.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Deli Meals'),
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(
                  Icons.category,
                ),
                text: 'Category',
              ),
              Tab(
                icon: Icon(
                  Icons.star,
                ),
                text: 'Favourites',
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            CategoriesScreen(),
            FavouritesScreen(),
          ],
        ),
      ),
    );
  }
}
