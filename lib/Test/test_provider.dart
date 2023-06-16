
import 'package:flutter/material.dart';

class ItemsProviderr with ChangeNotifier{
  List<int> _iitemssSelected=[];
  int _values = 1;

  List<int>get iitemssSelected => _iitemssSelected;
  int get values => _values; 


  void addItemss(int value){
    iitemssSelected.add(value);
    notifyListeners();
  }

  void removeItemss(int value){
    iitemssSelected.remove(value);
    notifyListeners();
  }

  void incrementItemss(){
    _values++;
    notifyListeners();
  }

  void decreaseItemss(){
    if(_values>=2){
      _values--;
    }
    
    notifyListeners();
  }
}