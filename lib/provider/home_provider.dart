import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {

  int currentBNBIndex = 2;
  bool animateToTop = false;

  void indexChanged(int index) {
    currentBNBIndex = index;
    notifyListeners();
  }
}
