import 'package:flutter/material.dart';
import 'package:meal_app/pages/category_meals_screen.dart';
import 'package:meal_app/pages/meal_detail_screen.dart';
import 'package:meal_app/pages/tabs_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(
                color: Color.fromRGBO(255, 254, 229, 1),
              ),
              bodyText2: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'RobotoCondensed',
              ),
            ),
      ),
      home: const TabScreen(),
      routes: {
        CategoryMealsScreen.routeName: (BuildContext context) {
          return const CategoryMealsScreen();
        },
        MealDetailScreen.routeName: (BuildContext context) {
          return const MealDetailScreen();
        },
      },
    );
  }
}
