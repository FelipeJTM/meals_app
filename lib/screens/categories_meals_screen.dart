//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

class CategoriesMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';
  final List<Meal>avaibleMeals;
  CategoriesMealsScreen(this.avaibleMeals);

  @override
  _CategoriesMealsScreenState createState() => _CategoriesMealsScreenState();
}

class _CategoriesMealsScreenState extends State<CategoriesMealsScreen> {
  String categoryTitle = "";
  List<Meal> displayedMeals = [];
  Color categoryColor = Colors.grey;

  @override
  void initState() {
    //not work
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final route = ModalRoute.of(context);
    if (route == null) return;
    final routeArgs = route.settings.arguments as Map<String, Object>;
    categoryTitle = routeArgs['title'] as String;
    categoryColor = routeArgs['color'] as Color;
    final categoryId = routeArgs['id'];
    displayedMeals = widget.avaibleMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('$categoryTitle'),
          backgroundColor: categoryColor,
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              title: displayedMeals[index].title,
              imageUrl: displayedMeals[index].imageUrl,
              duration: displayedMeals[index].duration,
              complexity: displayedMeals[index].complexity,
              affordability: displayedMeals[index].affordability,
              id: displayedMeals[index].id,
              removeItemFunction: _removeMeal,
            );
          },
          itemCount: displayedMeals.length,
        ));
  }
}
