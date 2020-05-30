import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem({
    @required this.id, 
    @required this.title, 
    @required this.quantity, 
    @required this.price
  });
}

class CartProvider with ChangeNotifier {
  Map<String, CartItem> _items = {};
  Map<String, CartItem> get items{
    return {..._items};
  }

  int get itemCount {
    return _items == null ? 0 : _items.length;
  }

  double get totalAmount {
    double total = 0.0;
    _items.forEach((key, value) {
      total = total + (value.price * value.quantity);
    });
    return total;
  }

  List<CartItem> getCartItems(){
    List<CartItem> result = _items.values.toList();
    return result;
  }
  
  void addItem(String productId, String title, int quantity, double price) {
    if(_items.containsKey(productId)){
      _items.update(
        productId,
        (element) => CartItem(
          id: element.id,
          title: element.title,
          quantity: element.quantity + 1,
          price: element.price,
        )
      );
    } else{
      _items.putIfAbsent(
        productId,
        () => CartItem(
          id: DateTime.now().toString(),
          title: title,
          price: price,
          quantity: 1,
        ),
      );
    }
    notifyListeners();
  }
  
  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void clearCart(){
    _items = {};
    notifyListeners();
  }
}