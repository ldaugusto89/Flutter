import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)!.settings.arguments as Meal;
    return Scaffold(
      appBar: AppBar(title: Text(meal.title)),
      body: Column(
        children: [
          SizedBox(
            height: 300,
            width: double.infinity,
            child: Image.network(meal.imageUrl, fit: .cover),
          ),
          Container(
            margin: const .symmetric(vertical: 10),
            child: Text(
              'Ingredientes',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          Container(
            width: 300,
            height: 200,
            padding: const .all(10),
            margin: const .all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              border: .all(color: Colors.grey),
              borderRadius: .circular(10)
            ),
            child: ListView.builder(
              itemCount: meal.ingredients.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Theme.of(context).colorScheme.secondary,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(meal.ingredients[index]),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
