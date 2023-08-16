import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire1/Screens/addproductScreen.dart';
import 'package:fire1/models.dart/ordermodel.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fire1/functionfirebase/productmodle.dart';
import 'package:flutter/foundation(1).dart';
import 'package:flutter/material.dart';

class Store {
  // ADD(name,category,location,price) {
  //   Stor.collection('d').add({"name":name,"category":category,"price":price,"location":location});
  // }
getorder(){
   Stream<QuerySnapshot>  geto =
        Stor.collection('product').snapshots();
    
  }
  Stream<QuerySnapshot> user() {
    return Stor
          .collection('order')
          .doc()
          .collection('OrderDetails')
          .snapshots();
    }

  // load() async {
  //   var Stor = FirebaseFirestore.instance;
  //   List<ProductModele> p = [];
  //   await for (var counter in Stor.collection('product').snapshots()) {
  //     for (var i in counter.docs) {
  //       var d = i.data();
  //       p.add(ProductModele(
  //         pcategory: d['name'],
  //         pdescription: d['Discription'],
  //         plocation: d['location'],
  //         pname: d['name'],
  //         pprice: d['price'],
  //       ));
  //     }
  //   }
  //   return p;
  // }

  static var store = Store();
  FirebaseFirestore Stor = FirebaseFirestore.instance;
  Addproduct(ProductModele product) {
    // take object from  productmodle called product
    Stor.collection('product').add({
      'name': product.pname,
      'category': product.pcategory,
      'location': product.plocation,
      'description': product.pdescription,
      'price': product.pprice
    });
  }

  signin(@required String email, @required String password) async {
    await Stor
        .collection('users')
        .doc(Random().nextDouble().toString())
        .set({"email": email, "password": password});
  }

  deleteproduct(documentId) {
    Stor.collection('product').doc(documentId).delete();
  }

  edit(newdata, documentId) {
    Stor.collection('product').doc(documentId).update(newdata);
  }

  BoughtProduct(adresse, List<ProductModele> products) {
    var ref = Stor.collection('order').doc();
    ref.set(adresse);

    for (var i in products) {
      ref.collection('OrderDetails').doc().set({
        'name': i.pname,
        'quantity': i.PQuantity,
        'gategory': i.pcategory,
        'price': i.pprice,
        'Description': i.pdescription,
      });
    }
  }
}
