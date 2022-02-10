import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/main_drawer.dart';
import './categories_screen.dart';
import './favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
  TabsScreen(this.favoriteMeals);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;
  @override
  void initState() {
    _pages = [
      {'page': CategoriesScreen(), 'title': 'Catogeries'},
      {
        'page': FavoritesScreen(widget.favoriteMeals),
        'title': 'My Favorite Meals'
      },
    ];
    super.initState();
  }

  void _selectedPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _pages[_selectedPageIndex]['title'],
          style: TextStyle(
              fontFamily: 'RobotoCondensed',
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold),
        ),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.black,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text(
              'Catogeries',
              style: TextStyle(
                  fontFamily: 'RobotoCondensed',
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.star),
              title: Text(
                'Favorites',
                style: TextStyle(
                    fontFamily: 'RobotoCondensed',
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              )),
        ],
      ),
    );
  }
}
