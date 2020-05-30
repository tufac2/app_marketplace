import 'package:Chikito/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widget/product_grid.dart';
import 'package:badges/badges.dart';
import '../screens/cart_screen.dart';
import '../widget/app_drawer.dart';

class ProductOverviewScreen extends StatelessWidget{
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
          title: Text("Restaurante"),
          actions: <Widget>[
            // IconButton(icon: Icon(Icons.shopping_cart),),
            Consumer<CartProvider>(
              builder: (_, cart, _c) => Badge(
              badgeContent: Text(cart.itemCount.toString()),
              child: IconButton(
                icon: Icon(Icons.shopping_cart, size: 30),
                onPressed: () {
                  Navigator.of(context).pushNamed(CartScreen.routeName);
                }
              ),
              badgeColor: Colors.white,
              position: BadgePosition.topRight(top: 13, right: 30),
              ),
            ),
          ],
        ),
        drawer: AppDrawer(),
        body: ProductGrid()
      );
  }
}
