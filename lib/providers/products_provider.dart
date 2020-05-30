import 'package:flutter/material.dart';
import './product_provider.dart';

class ProductsProvider with ChangeNotifier {
  List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Salmorejo',
      price: 29.99,
      imageUrl:
          'https://images.unsplash.com/photo-1476718406336-bb5a9690ee2a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80',
    ),
    Product(
      id: 'p2',
      title: 'Hamburguesa de Angus',
      price: 59.99,
      imageUrl:
          'https://images.unsplash.com/photo-1536510344784-b43e97721c1f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80',
    ),
    Product(
      id: 'p3',
      title: 'Cocido de la abuela',
      price: 19.99,
      imageUrl:
          'https://images.unsplash.com/photo-1470324161839-ce2bb6fa6bc3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80',
    ),
    Product(
      id: 'p3',
      title: 'Cocido de la abuela',
      price: 19.99,
      imageUrl:
          'https://images.unsplash.com/photo-1470324161839-ce2bb6fa6bc3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80',
    ),
  ];
  
  List<Product> get items {
    return [..._items];
  }

  Product ownFindById(String id) {
    return _items.firstWhere((element) => element.id == id);
  }
  void addProduct () {
    // _items.add(value);
    notifyListeners();
  }
}