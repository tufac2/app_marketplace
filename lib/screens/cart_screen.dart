import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../providers/order_provider.dart';
import '../widget/cart_item.dart' as ci;

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Tu cesta"),
      ),
      body: Column(children: <Widget>[
          Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: cart.itemCount,
              itemBuilder: (BuildContext context, int i) {
                return ci.CartItem(
                  cart.items.values.toList()[i].id,
                  cart.items.keys.toList()[i],
                  cart.items.values.toList()[i].price,
                  cart.items.values.toList()[i].quantity,
                  cart.items.values.toList()[i].title,  
                );
              },
          ),
        ),
        Card(
          margin: EdgeInsets.all(25),
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Total',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                // Expanded(
                //   child: ListView.builder(
                //     padding: const EdgeInsets.all(8),
                //     itemCount: cart.itemCount,
                //       itemBuilder: (BuildContext context, int i) {
                //         return ci.CartItem(
                //           cart.items.values.toList()[i].id,
                //           cart.items.values.toList()[i].price,
                //           cart.items.values.toList()[i].quantity,
                //           cart.items.values.toList()[i].title,  
                //         );
                //       },
                //   ),
                // ),
                // Expanded(
                //   child: ListView.builder(
                //     itemBuilder: (ctx, i) => ci.CartItem(
                //       cart.items.values.toList()[i].id,
                //       cart.items.values.toList()[i].price,
                //       cart.items.values.toList()[i].quantity,
                //       cart.items.values.toList()[i].title,
                //     ),
                //     itemCount: cart.itemCount,
                //   ),
                // ),
                SizedBox(width: 10,),
                Spacer(),
                Chip(
                  label: Text('${cart.totalAmount.toString()}\€'),
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                FlatButton(
                  child:
                    Text("PEDIR"),
                    onPressed: () {
                      Provider.of<OrderProvider>(context, listen:false).addOrder(
                        cart.getCartItems(),
                        cart.totalAmount,
                      );
                      cart.clearCart();
                    },
                    textColor: Theme.of(context).primaryColor,
                )
              ],
            ),
          )
        )
      ]),
    );
  }
}