import 'package:flutter/material.dart';
import 'package:meal_app/models/dummy_meals.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  const CategoryMealsScreen({super.key});

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  // const CategoryMealsScreen({

  late String categoryTitle;
  late List<Meal> categoryMeals;
  bool loadedInitData = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (loadedInitData == false) {
      final routeArgs =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;

      categoryTitle = routeArgs['title']!;
      final categoryId = routeArgs['id'];
      categoryMeals = dummyMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();

      loadedInitData = true;
    }
  }

  void _removeMeal(String mealId) {
    setState(() {
      categoryMeals.removeWhere((meal) {
        return meal.id == mealId;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return MealItem(
            id: categoryMeals[index].id,
            title: categoryMeals[index].title,
            imageUrl: categoryMeals[index].imageUrl,
            duration: categoryMeals[index].duration,
            complexity: categoryMeals[index].complexity,
            affordability: categoryMeals[index].affordability,
            removeItem: _removeMeal,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
