import 'package:firebase_core/firebase_core.dart';
import 'package:fire1/custom_wedgit/textform.dart';
import 'package:fire1/functionfirebase/firestore.dart';
import 'package:fire1/functionfirebase/productmodle.dart';
import 'package:flutter/cupertino(1).dart';
import 'package:flutter/foundation(1).dart';
import 'package:flutter/material.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  GlobalKey<FormState> glob = GlobalKey<FormState>();
  static String? name, category, Description, price, location;
  final store = Store();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: glob,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                onChanged: (value) {
                  name = value;
                },
                decoration: InputDecoration(hintText: 'name'),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                onChanged: (value) {
                  price = value;
                },
                decoration: InputDecoration(hintText: 'price'),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                onChanged: (value) => category = value,
                decoration: InputDecoration(hintText: 'category'),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                 onChanged: (value) => location = value,
                decoration: InputDecoration(hintText: 'location'),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                onChanged: (value) => Description = value,
                decoration: InputDecoration(hintText: 'product Description'),
              ),
              SizedBox(
                height: 10,
              ),
              MaterialButton(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                onPressed: () {
                  if (glob.currentState!.validate()) {
                    glob.currentState!.save();
                    Store.store.Addproduct(ProductModele(
                        pcategory:category ,
                        pdescription: Description,
                        plocation: location,
                        pname: name,
                        pprice: price));
                  }
                },
                child: Text('Add Product'),
                color: Colors.blueGrey,
              )
            ],
          ),
        ),
      ),
    );
  }
}
