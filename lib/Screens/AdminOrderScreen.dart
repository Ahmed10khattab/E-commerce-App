import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire1/functionfirebase/firestore.dart';
import 'package:fire1/functionfirebase/productmodle.dart';
import 'package:fire1/models.dart/ordermodel.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino(1).dart';
import 'package:flutter/material(1).dart';

class Ordered extends StatefulWidget {
  const Ordered({Key? key}) : super(key: key);

  @override
  State<Ordered> createState() => _OrderedState();
}

class _OrderedState extends State<Ordered> {
  @override
  Widget build(BuildContext context) {
    Stream<QuerySnapshot> user =
        FirebaseFirestore.instance.collection('order').snapshots();
    double height = MediaQuery.of(context).size.height;
    var ID;
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream: user,
          builder: (context, snapshot) {
            List<Order> order = [];
            if (snapshot.hasData) {
              for (var i in snapshot.data!.docs) {
                Order products = Order.fromMap(i);
                
            
                order.add(products);
            
                
              }
              return ListView.builder(
                  itemCount: order.length,
                  itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(20),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, 'OrderDetails',
                                arguments:order[index].DocId );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(20)),
                            height: MediaQuery.of(context).size.height * .13,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  ' customer adress : ${order[index].adresse!}',
                                  style: TextStyle(fontSize: height * .025),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ));
            } else {
              return Center(child: Text('nodata'));
            }
          }),
    );
  }
}
