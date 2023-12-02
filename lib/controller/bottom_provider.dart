import 'package:flutter/material.dart';

class BottomProvider extends ChangeNotifier {
  int selectedindex = 0;
  pagechanger(int index) {
    selectedindex = index;
    notifyListeners();
  }
}
