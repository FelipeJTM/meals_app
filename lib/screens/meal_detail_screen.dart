import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal_detail';
  final Function toggleFavorite;
  final Function isFavoriteMeal;

  MealDetailScreen(this.toggleFavorite, this.isFavoriteMeal);

  Widget buildSectionTitle(BuildContext ctx, String text) {
    return (Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(ctx).textTheme.headline6,
      ),
    ));
  }

  Widget builderContainer(BuildContext ctx, Widget child) {
    return (Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        height: MediaQuery.of(ctx).size.height / 4,
        width: MediaQuery.of(ctx).size.width / 1.5,
        child: child));
  }

  @override
  Widget build(BuildContext context) {
    final route = ModalRoute.of(context);
    if (route == null) return SizedBox.shrink();
    final routeArgs = route.settings.arguments as Map<String, Object>;
    final mealId = routeArgs["id"];
    var currentMeal = DM.firstWhere((element) => element.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text('${currentMeal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Text("$mealTitle"),
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                currentMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, "Ingredients: "),
            builderContainer(
              context,
              ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(
                      '-  ${currentMeal.ingredients[index]}',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                itemCount: currentMeal.ingredients.length,
              ),
            ),
            buildSectionTitle(context, "Steps: "),
            builderContainer(
                context,
                ListView.builder(
                  itemBuilder: (context, index) => Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('#${index + 1}'),
                        ),
                        title: Text(currentMeal.steps[index]),
                      ),
                      Divider(),
                    ],
                  ),
                  itemCount: currentMeal.steps.length,
                ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        //onPressed: () {Navigator.of(context).pop(mealId);},
        child: Icon(isFavoriteMeal(mealId) ? Icons.star : Icons.star_border),
        onPressed: () => toggleFavorite(mealId),
      ),
    );
  }
}
