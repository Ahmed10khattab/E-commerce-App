import 'package:fire1/functionfirebase/firestore.dart';
import 'package:flutter/cupertino(1).dart';
import 'package:flutter/material(1).dart';

import '../functionfirebase/productmodle.dart';

class ManageProduct extends StatelessWidget {
  ManageProduct({Key? key}) : super(key: key);
  GlobalKey<FormState> glob = GlobalKey<FormState>();
  String? category, Description, location, name, loction, price;

  @override
  Widget build(BuildContext context) {
    var id = ModalRoute.of(context)!.settings.arguments;
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
                    Store.store.edit(
                        ({
                          'name': name,
                          'location': location,
                          'category': category,
                          'price': price,
                          'description': Description
                        }),
                        id);
                  }
                },
                child: Text('update Product'),
                color: Colors.blueGrey,
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, 'firsScreen');
                  },
                  child: Container(
                      color: Colors.blue,
                      child: Padding(
                        padding: const EdgeInsets.all(80),
                        child: Text('go to user screen '),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
