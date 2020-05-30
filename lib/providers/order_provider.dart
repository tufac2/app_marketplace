import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import './cart_provider.dart';

class OrderItem {
  @required final String id;
  @required final double amount;
  @required final List<CartItem> products;
  @required final DateTime dateTime;

  OrderItem({
    @required this.id,
    @required this.amount,
    @required this.products,
    @required this.dateTime
  });
}
class OrderProvider with ChangeNotifier{
  List<OrderItem> _orders = [];
  
  List<OrderItem> getOrders(){
    return [..._orders];
  }

  OrderItem getOrderItemByIndex(int index) {
    return _orders[index];
  }
  
  void addOrder(List<CartItem> cartProducts, double total){
    _orders.insert(0,
      OrderItem(
        id: DateTime.now().toString(),
        amount: total,
        products: cartProducts,
        dateTime: DateTime.now(),
      ),
    );
    notifyListeners();
  }
}