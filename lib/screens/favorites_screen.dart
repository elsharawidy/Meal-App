import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
  FavoritesScreen(this.favoriteMeals);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  void rebuildScreen() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (widget.favoriteMeals.isEmpty) {
      return Center(
        child: Container(
          width: double.infinity,
          height: 30,
          child: FittedBox(
            fit: BoxFit.fill,
            child: Text(
              'You dont have favorites,Please try to add some :)',
              style: TextStyle(
                  backgroundColor: Theme.of(context).accentColor,
                  fontFamily: 'RobotoCondensed',
                  fontSize: 22),
            ),
          ),
        ),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: widget.favoriteMeals[index].id,
            title: widget.favoriteMeals[index].title,
            imageUrl: widget.favoriteMeals[index].imageUrl,
            duration: widget.favoriteMeals[index].duration,
            complexity: widget.favoriteMeals[index].complexity,
            affordability: widget.favoriteMeals[index].affordability,
            refreshScreen: rebuildScreen,
          );
        },
        itemCount: widget.favoriteMeals.length,
      );
    }
  }
}
