import 'package:provider/provider.dart';
import '../providers/products_provider.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';
  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;
    final loadedProduct = Provider.of<ProductsProvider>(context, listen: false).ownFindById(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                loadedProduct.imageUrl,
                fit: BoxFit.cover,
                )
            ),
            SizedBox(height: 10,),
            Text(
              '${loadedProduct.price.toString()}\€',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 10,),
            Text(
              loadedProduct.title,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 18,
              ),
            ),            
          ],
        ),
      ),
    );
  }
  
}