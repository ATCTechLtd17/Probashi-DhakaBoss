import 'package:flutter/material.dart';

class PageState with ChangeNotifier {
  String _currentRoute = '/home'; // Default route

  String get currentRoute => _currentRoute;

  void setRoute(String newRoute) {
    if (_currentRoute != newRoute) {
      _currentRoute = newRoute;
      notifyListeners();
    }
  }
}