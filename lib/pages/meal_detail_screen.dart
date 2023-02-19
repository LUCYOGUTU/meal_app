import 'package:flutter/material.dart';
import 'package:meal_app/models/dummy_meals.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';
  const MealDetailScreen({super.key});

  Widget _buildColumn(BuildContext context, String title, Widget child) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).primaryColorLight,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(8.0),
          height: MediaQuery.of(context).size.height * 0.4,
          child: child,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments as String;

    final selectedMeal = dummyMeals.firstWhere((meal) => meal.id == id);
    final appBar = AppBar(
      title: Text(selectedMeal.title),
    );

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image.network(
                selectedMeal.imageUrl,
                width: double.infinity,
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    _buildColumn(
                      context,
                      'Ingredients',
                      ListView.builder(
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              ListTile(
                                leading: CircleAvatar(
                                  radius: 15.0,
                                  child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: FittedBox(
                                          child: Text('# ${index + 1}.'))),
                                ),
                                title: Text(selectedMeal.ingredients[index]),
                              ),
                              Divider(
                                color: Theme.of(context).primaryColorLight,
                              ),
                            ],
                          );
                        },
                        itemCount: selectedMeal.ingredients.length,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    _buildColumn(
                        context,
                        'Steps',
                        ListView.builder(
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                ListTile(
                                  leading: CircleAvatar(
                                    radius: 15.0,
                                    child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: FittedBox(
                                            child: Text('# ${index + 1}.'))),
                                  ),
                                  title: Text(selectedMeal.steps[index]),
                                ),
                                Divider(
                                  color: Theme.of(context).primaryColorLight,
                                ),
                              ],
                            );
                          },
                          itemCount: selectedMeal.steps.length,
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.delete),
        onPressed: () {
          Navigator.pop(context, id);
        },
      ),
    );
  }
}
