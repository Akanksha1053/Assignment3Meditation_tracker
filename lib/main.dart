import 'package:flutter/material.dart';
import 'package:meditation_tracker_assignment3/data/current_time.dart';
import 'package:meditation_tracker_assignment3/data/list_items.dart';
import 'screens/main_screen.dart';
import 'package:provider/provider.dart';
import 'package:meditation_tracker_assignment3/data/button_state.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
    ChangeNotifierProvider<PreviousTimers>(
    create: (BuildContext context) => PreviousTimers()),
    ChangeNotifierProvider<ButtonState>(
    create: (BuildContext context) => ButtonState()),
        ChangeNotifierProvider<CurrentTime>(
          create: (BuildContext context) => CurrentTime(),
        ),
      ],
      child: MaterialApp(
          home: MainScreen(),
        ),
      );
  }
}
