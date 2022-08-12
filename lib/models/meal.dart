enum Complexity {
  Simple,
  Medium,
  Hard,
  Challenging,

}

enum Affordability { cheap, reasonable, expensive, Affordable,Pricey,Luxurious, }

//enum FoodType { vegan, red_Meat, dairy, fish_meat, bird_meat }

class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  // final FoodType foodType;
  final bool isVegan;
  final bool isLactoseFree;
  final bool isGlutenFree;
  final bool isVegetarian;

  const Meal({
    required this.complexity,
    required this.affordability,
    required this.id,
    required this.categories,
    required this.title,
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
    required this.duration,
    required this.isVegan,
    required this.isLactoseFree,
    required this.isGlutenFree,
    required this.isVegetarian,
    //  this.foodType,
  });
}
