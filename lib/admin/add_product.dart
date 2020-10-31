import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _productTitleController = TextEditingController();
  TextEditingController _productDescriptionController = TextEditingController();
  TextEditingController _productPriceController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _productTitleController.dispose();
    _productDescriptionController.dispose();
    _productPriceController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Product"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _productTitleController,
                decoration: InputDecoration(
                  labelText: 'Product Title',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'title is required';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: _productDescriptionController,
                maxLines: 5,
                decoration: InputDecoration(
                  labelText: 'Product Description',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Description is Required';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: _productPriceController,
                keyboardType: TextInputType.numberWithOptions(
                  decimal: true,
                ),
                decoration: InputDecoration(
                  labelText: 'Product Price',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Price is Required';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 8,
              ),
              RaisedButton(
                color: Colors.blue,
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    FirebaseFirestore.instance.collection('products').doc().set({
                      'product_title': _productTitleController.text,
                      'product_description': _productDescriptionController.text,
                      'product_price': double.parse(_productPriceController.text),
                    });
                  }
                },
                child: Text(
                  'Save Product',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
