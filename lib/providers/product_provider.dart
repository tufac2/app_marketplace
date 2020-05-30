import 'package:flutter/foundation.dart';

class Product with ChangeNotifier{
  final String id;
  final String title;
  final double price;
  final String imageUrl;
  bool like;
  bool inCart;
  
  Product({
    @required this.id,
    @required this.title,
    @required this.price,
    @required this.imageUrl, String description,
    this.like = false,
    this.inCart = false
  });

  void toggleLikeStatus(){
    this.like = !this.like;
    notifyListeners();
  }
  void toggleInCart(){
    this.inCart = !this.inCart;
    notifyListeners();
  }
}