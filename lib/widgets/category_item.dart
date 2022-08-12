import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;
  final String id;

  CategoryItem(this.title, this.color, this.id);

  void selectCategory(BuildContext ctx) {
    //push other page standard:
    /* Navigator.of(ctx).push(MaterialPageRoute(builder: (BuildContext _ctx) {
      return CategoriesMealsScreen("1", title, color);
    }));*/
    //push named route standard:
/*    Navigator.of(ctx).pushNamed('/category-meals',*/
//      arguments: {'id': 'n', 'title': title, 'color': color});
    //push named route (more secure):
    Navigator.of(ctx).pushNamed(CategoriesMealsScreen.routeName,
        arguments: {'id': id, 'title': title, 'color': color});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [color.withOpacity(0.7), color],
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
