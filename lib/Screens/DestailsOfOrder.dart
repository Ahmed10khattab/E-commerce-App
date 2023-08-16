import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire1/functionfirebase/firestore.dart';
import 'package:fire1/functionfirebase/productmodle.dart';
import 'package:fire1/models.dart/ordermodel.dart';
import 'package:flutter/cupertino(1).dart';
import 'package:flutter/material(1).dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var docId = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
        body: StreamBuilder<QuerySnapshot>(
      stream: Store.store.user(),
      builder: (context, snapshot) {
        List<ProductModele> list = [];
        if (snapshot.hasData) {
          for (var i in snapshot.data!.docs) {
            ProductModele product = ProductModele.fromMap(i);

            list.add(product);
          }
          return ListView.builder(
              itemCount: list.length,
              itemBuilder: ((context, index) {
            return    Center(
              child: Column(
                    children: [Center(child: Text(list[index].pcategory!))
                                        ],
                  ),
            );
              }));
        }
        return const Center(child: Text('loading...'));
      },
    ));
  }
}
