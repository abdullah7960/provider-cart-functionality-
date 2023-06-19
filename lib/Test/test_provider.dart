
import 'package:flutter/material.dart';

class ItemsProviderr with ChangeNotifier{
  List<int> _iitemssSelected=[];
  int _values = 0;

  List<int>get iitemssSelected => _iitemssSelected;
  int get values => _values; 

  double _totalPrice = 0.0;
  double get totalPrice => _totalPrice;


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

  void updatedPrice(double priceTwo){
    priceTwo = priceTwo * _values;
    _totalPrice = priceTwo;
    notifyListeners();
  }

  void updatedPriceDecrement(double priceTwo){
    if(_values >=1){
      _totalPrice =totalPrice - priceTwo;
      notifyListeners();
    }
    
    
  }
}