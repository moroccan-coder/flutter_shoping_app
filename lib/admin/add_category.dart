import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class AddCategoryScreen extends StatefulWidget {
  @override
  _AddCategoryScreenState createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoryScreen> {
  TextEditingController _titleController = TextEditingController();
  var _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  bool _isError = false;

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Category"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: (_isLoading) ? _loading() : _formField(),
      ),
    );
  }

  Widget _loading() {
    return Container(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _formField() {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: _titleController,
            decoration: InputDecoration(labelText: 'Category title'),
            validator: (value) {
              if (value.isEmpty) {
                return "Category title is required!";
              } else {
                return null;
              }
            },
          ),
          SizedBox(
            height: 8,
          ),
          RaisedButton(
              child: Text("Save"),
              onPressed: () async {
                if (_formKey.currentState.validate()) {
                  setState(() {
                    _isLoading = true;
                  });

                  var response = await FirebaseFirestore.instance.collection("categories").where('title', isEqualTo: _titleController.text).snapshots().first;

                  if (response.size >= 1) {
                    setState(() {
                      _isLoading = false;
                      _isError = true;
                    });
                  } else {
                    FirebaseFirestore.instance.collection("categories").doc().set({
                      'title': _titleController.text,
                    }).then((value) {
                      setState(() {
                        _isLoading = false;
                        _isError = false;
                      });
                      _titleController.text = '';
                    }).catchError((error) {
                      setState(() {
                        _isLoading = false;
                        _isError = false;
                      });
                    });
                  }
                }
              }),
          (_isError) ? _error() : Container(),
        ],
      ),
    );
  }

  Widget _error() {
    return Container(
      child: Center(
        child: Text(
          "Duplicate Entry!",
          style: TextStyle(color: Colors.red),
        ),
      ),
    );
  }
}
