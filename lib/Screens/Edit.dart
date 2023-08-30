 

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire1/functionfirebase/firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino(1).dart';
import 'package:flutter/material(1).dart';

import '../functionfirebase/productmodle.dart';

class Edit extends StatefulWidget {
  Edit({Key? key}) : super(key: key);

  @override
  State<Edit> createState() => _EditState();
}

FirebaseFirestore f = FirebaseFirestore.instance;
Stream<QuerySnapshot> user = f.collection('product').snapshots();

class _EditState extends State<Edit> {
//  List <ProductModele> p = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<QuerySnapshot>(
      stream: user,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          for (var i in snapshot.data!.docs) {
            List<ProductModele> product = [];

          

 
          }
          var data = snapshot.data;
          return GridView.builder(
            gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: .7),
            itemCount: data!.size,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: GestureDetector(
                  onTapUp: (details) {
                    double dx = details.globalPosition.dx;
                    double dy = details.globalPosition.dy;
                    double dx2 = MediaQuery.of(context).size.width - dx;
                    double dy2 = MediaQuery.of(context).size.width - dy;

                    showMenu(
                        elevation: 40,
                        context: context,
                        position: RelativeRect.fromLTRB(dx, dy, dx2, dy2),
                        items: [
                          PopupMenuItem(
                              child: GestureDetector(
                                  onTap: () => Navigator.pushNamed(
                                      context, 'firstScreen',
                                       ),
                                  child:const Text('go to user page'))),
                          PopupMenuItem(
                              child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, 'manageproduct',
                                        arguments: data.docs[index].id);
                                  },
                                  child: Text('Edit'))),
                          PopupMenuItem(
                              child: GestureDetector(
                                  onTap: () {
                                    Store.store
                                        .deleteproduct(data.docs[index].id);
                                  },
                                  child: Text('delete')))
                        ]);
                  },
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image(
                            fit: BoxFit.fill,
                            image:
                                AssetImage('${data.docs[index]['location']}')),
                      ),
                      Positioned(
                          bottom: 0,
                          child: Opacity(
                            opacity: .8,
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 9, vertical: 1),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('name:${data.docs[index]['name']}'),
                                      Text(
                                        "price: \$ ${data.docs[index]['price']} ",
                                        style: TextStyle(fontSize: 20),
                                      )
                                    ]),
                              ),
                              height: 50,
                              width: MediaQuery.of(context).size.width,
                              color: Color.fromARGB(255, 255, 247, 247),
                            ),
                          ))
                    ],
                  ),
                ),
              );
            },
          );
        }
        return Center(
          child: Text('loading...'),
        );
      },
    )
    );
  }
}
