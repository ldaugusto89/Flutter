import 'package:flutter/material.dart';
import 'package:meals/utils/app_routes.dart';
import '../models/category.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(this.category, {super.key});

  final Category category;

  void _selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(AppRoutes.categoriesMeals, arguments: category);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectCategory(context),
      borderRadius: .circular(15),
      child: Container(
        padding: .all(15),
        decoration: BoxDecoration(
          borderRadius: .circular(15),
          gradient: LinearGradient(
            colors: [category.color.withValues(alpha: 0.5), category.color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(category.title),
      ),
    );
  }
}
