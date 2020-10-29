
import 'package:flutter/material.dart';

class AllProducts extends StatefulWidget {
  @override
  _AllProductsState createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Products'),),
      body: Container(
        child: Center(
          child: Text('My Products'),
        ),
      ),
    );
  }
}
