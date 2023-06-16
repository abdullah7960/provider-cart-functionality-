
import 'package:flutter/material.dart';

class ItemsProvider with ChangeNotifier{
  List<int> _itemssSelected=[];

  List<int>get itemssSelected => _itemssSelected;

  void addItemss(int value){
    itemssSelected.add(value);
    notifyListeners();
  }

  void removeItemss(int value){
    itemssSelected.remove(value);
    notifyListeners();
  }
}