
import 'package:Chikito/providers/order_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../widget/order_item_widget.dart' show OrderItemWidget;
import '../providers/order_provider.dart' show OrderProvider;
import '../widget/app_drawer.dart';

class OrderScreen extends StatelessWidget {
  static const routeName = '/your-orders';
  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<OrderProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Tus pedidos'),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: orderData.getOrders().length,
        itemBuilder: (ctx, i) =>
          OrderItemWidget(
            orderData.getOrderItemByIndex(i),
          ),
      ),
    );
  }
}