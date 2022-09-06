import 'package:flutter/material.dart';
import 'package:meditation_tracker_assignment3/data/list_items.dart';
import 'package:meditation_tracker_assignment3/screens/favourites_screen.dart';
import 'package:meditation_tracker_assignment3/widget/home_page.dart';
import 'package:provider/provider.dart';
import 'package:meditation_tracker_assignment3/data/button_state.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int _selectedIndex = 0;

  List _widgetOptions =[HomePage(),Favourites()];

  void onItemTapped(int index)
  {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final getTime = Provider.of<PreviousTimers>(context).itemFromList;
    final buttonState = Provider.of<ButtonState>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        elevation: 1,
        backgroundColor: Colors.white,
        title: const Text(
          'Meditation Tracker',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.orange),
        ),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 40),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline, size: 40),
            label: 'Favourites',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: onItemTapped,
      ),
    );
  }
}
