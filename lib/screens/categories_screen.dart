import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';

import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text("DeliMeal"),
      ),*/
      body: GridView(
        padding: const EdgeInsets.all(20),
        children: DC
            .map(
              (catData) =>
                  CategoryItem(catData.title, catData.color, catData.id),
            )
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          // set the number of widgets per row, and also increases or decreases the size of each.
          childAspectRatio: 3 / 2,
          //this sets the height in the child smaller > n < bigger
          //childAspectRatio: 1.5,
          mainAxisSpacing: 20,
          // just add spacing vertically
          crossAxisSpacing: 20, // just add spacing horizontally
        ),
      ),
    );
  }
}
