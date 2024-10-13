import 'package:flutter/material.dart';
import 'package:real_estate_test_poc/theme/theme.dart';
import 'package:stacked/stacked.dart';

class BottomNavigationViewmodel extends BaseViewModel {
  int _selectedIndex = 2;
  int get selectedIndex => _selectedIndex;

  set selectedIndex(int value) {
    _selectedIndex = value;
    notifyListeners();
  }

  void onNavItemTapped(int index) {
    selectedIndex = index;
  }

  Color activeColor(int currentIndex) {
    return _selectedIndex == currentIndex ? Pallete.primaryColor : Colors.black;
  }
}
