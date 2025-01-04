import 'package:flutter/material.dart';

class PageTitle with ChangeNotifier{
  String _title = 'Download';
  String get title => _title;

  void setTitle(String newTitle){
    _title = newTitle;
    notifyListeners();
  }
}