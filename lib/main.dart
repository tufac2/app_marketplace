import 'package:Chikito/screens/order_screen.dart';
import 'package:flutter/material.dart';
import './screens/product_overview_screen.dart';
import './screens/product_detail_screen.dart';
import 'package:provider/provider.dart';
import './providers/products_provider.dart';
import './providers/cart_provider.dart';
import './providers/order_provider.dart';
import './screens/cart_screen.dart';
import './screens/order_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
        ChangeNotifierProvider(create: (ctx) => ProductsProvider(),),
        ChangeNotifierProvider(create: (ctx) => CartProvider(),),
        ChangeNotifierProvider(create: (ctx) => OrderProvider(),)
        ],
        child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.red,
          accentColor: Colors.deepOrange,
          fontFamily: 'Roboto',
        ),
        home: ProductOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
          OrderScreen.routeName: (ctx) => OrderScreen(),
        }
      ),
    );
  }
}