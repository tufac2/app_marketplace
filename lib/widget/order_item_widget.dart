import 'package:flutter/material.dart';
import '../providers/order_provider.dart' as o show OrderItem;

class OrderItemWidget extends StatelessWidget {
  final o.OrderItem inOrderItem;
  OrderItemWidget(this.inOrderItem);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(inOrderItem.amount.toString()),
            subtitle: Text(
              inOrderItem.dateTime.toString()
            ),
            trailing: IconButton(
              icon: Icon(Icons.expand_more),
            ),
          )
        ],
      ),
    );
  }
}