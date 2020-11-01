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

  String selectedValue;

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
        child: SingleChildScrollView(
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
                _selectCategory(),
                SizedBox(height: 16,),
                RaisedButton(
                  color: Colors.blue,
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _showLoaderDialog(context);
                      FirebaseFirestore.instance.collection('products').doc().set({
                        'product_title': _productTitleController.text,
                        'product_description': _productDescriptionController.text,
                        'product_price': double.parse(_productPriceController.text),
                        'product_category' : selectedValue,
                      }).then((value) {
                        Navigator.pop(context);
                        _productPriceController.text = '';
                        _productTitleController.text = '';
                        _productDescriptionController.text = '';
                      }).catchError((onError)=>Navigator.pop(context));
                    }
                  },
                  child: Text(
                    'Save Product',
                    style: TextStyle(color: Colors.white),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _selectCategory() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('categories').snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Error: ${snapshot.error}");
        }

        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Text("Loading");
          default:
            return DropdownButton<String>(
              hint: Text("Select Category"),
              iconSize: 30,
              elevation:4,
              icon: Icon(Icons.keyboard_arrow_down_sharp),
              dropdownColor: Colors.grey,
              onChanged: (String value) {
                setState(() {
                  selectedValue = value;
                });
              },
              value: selectedValue,
              items: snapshot.data.docs.map((DocumentSnapshot document) {
                return DropdownMenuItem<String>(
                  value: document.data()['title'],
                  child: Text(document.data()['title'],style: TextStyle(color: Colors.black),),
                );
              }).toList(),
            );
        }

        return null;
      },
    );
  }



  _showLoaderDialog(BuildContext context){
    AlertDialog alert=AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(margin: EdgeInsets.only(left: 7),child:Text("Save Product..." )),
        ],),
    );
    showDialog(barrierDismissible: false,
      context:context,
      builder:(BuildContext context){
        return alert;
      },
    );
  }
}
