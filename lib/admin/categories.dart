import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AllCategories extends StatefulWidget {
  @override
  _AllCategoriesState createState() => _AllCategoriesState();
}

class _AllCategoriesState extends State<AllCategories> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Categories"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection("categories").snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return _loading();
                break;

              case ConnectionState.active:
              case ConnectionState.done:
                if (snapshot.hasData) {
                  return ListView(
                    children: snapshot.data.docs.map((DocumentSnapshot document) {
                      return ListTile(
                        title: Text(document.data()['title']),
                        trailing: IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            _deleteCategory(document.id);
                          },
                        ),
                      );
                    }).toList(),
                  );
                }

                break;

              case ConnectionState.none:
                return Container(
                  child: Text("Error!"),
                );
                break;
            }

            return null;
          },
        ),
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

  Future<void> _deleteCategory(String id) {
    CollectionReference category = FirebaseFirestore.instance.collection("categories");
    category.doc(id).delete().then((value) {

    }).catchError((onError){

    });
  }
}
