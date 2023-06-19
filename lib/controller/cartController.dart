import 'package:flutter/foundation.dart';
import 'package:provider_final/model/productModel.dart';

class CartController with ChangeNotifier {
  List<Product> _products = [];

  List<Product> get products {
    return [..._products];
  }

  void addToCart(Product product) {
    if (!_products.any((element) => element.title == product.title)) {
      _products.add(product);
    }

    notifyListeners();
  }

  void addQty(int index) {
    _products[index].qty += 1;
    notifyListeners();
  }

  void removeQty(int index) {
    _products[index].qty += 1;
    notifyListeners();
  }

  double get totalPrice {
    double total = 0;

    _products.forEach((element) {
      total += int.parse(element.price) * element.qty;
    });

    return total;
  }
}
