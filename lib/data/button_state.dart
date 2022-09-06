
import 'package:flutter/material.dart';

class ButtonState extends ChangeNotifier{
  bool isStarted = false;
  void toggleButton()
  {
    isStarted = !isStarted;
    notifyListeners();
  }
}