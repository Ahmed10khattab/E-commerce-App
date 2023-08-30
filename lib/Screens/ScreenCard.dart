import 'dart:io';
import 'dart:ui';

import 'package:fire1/Screens/CardProvider.dart';
import 'package:fire1/Screens/Edit.dart';
import 'package:fire1/Screens/deatilsOfProduct.dart';
import 'package:fire1/Screens/fristscreen.dart';
import 'package:fire1/functionfirebase/firestore.dart';
import 'package:fire1/functionfirebase/productmodle.dart';
import 'package:flutter/cupertino(1).dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting(1).dart';
import 'package:provider/provider.dart';

class ScreenCard extends StatelessWidget {
  const ScreenCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ProductModele> products = Provider.of<AddCard>(context).products;
    // ProductModele product = Provider.of<AddCard>(context).products as ProductModele;
    // ProductModele data = ModalRoute.of(context)!.settings.arguments as ProductModele;

    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          title: const Padding(
            padding: EdgeInsets.only(left: 40),
            child: Text(
              'My Cart',
              style: TextStyle(color: Colors.black),
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
              color: Colors.black,
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back)),
        ),
        body: Stack(
          children: [
            LayoutBuilder(
              builder: (context, constraints) {
                if (products.isNotEmpty) {
                  return Stack(
                    children: [
                      ListView.builder(
                          itemCount: products.length,
                          itemBuilder: (context, index) => Column(
                                children: [
                                  GestureDetector(
                                    onTapUp: (details) {
                                      double dx = details.globalPosition.dx;
                                      double dy = details.globalPosition.dy;
                                      double dy2 =
                                          MediaQuery.of(context).size.height -
                                              dy;
                                      double dx2 =
                                          MediaQuery.of(context).size.width -
                                              dx;
                                      showMenu(
                                          context: context,
                                          position: RelativeRect.fromLTRB(
                                              dx, dy, dx2, dy2),
                                          items: [
                                            PopupMenuItem(
                                                child: GestureDetector(
                                                    onTap: () {
                                                      Navigator.pop(context);
                                                      Provider.of<AddCard>(
                                                              context,
                                                              listen: false)
                                                          .delete(
                                                              products[index]);
                                                    },
                                                    child:
                                                        const Text('delete'))),
                                          ]);
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 13),
                                      child: Row(
                                        children: [
                                          CircleAvatar(
                                            radius: 47,
                                            backgroundImage: AssetImage(
                                                products[index].plocation!),
                                          ),
                                          Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 40, top: 10),
                                                child: Center(
                                                    child: Text(
                                                  'name:  ${products[index].pname} ',
                                                  style: const TextStyle(
                                                      fontStyle:
                                                          FontStyle.italic,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 20),
                                                )),
                                              ),
                                              const SizedBox(
                                                height: 7,
                                              ),
                                              Text(
                                                'Price: \$ ${products[index].pprice}',
                                                style: const TextStyle(
                                                    fontStyle: FontStyle.italic,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 20),
                                              ),
                                              Row(
                                                children: [
                                                  const Text(
                                                    'Quantity : ',
                                                    style:
                                                        TextStyle(fontSize: 20),
                                                  ),
                                                  Text(
                                                    '${products[index].PQuantity}',
                                                    style: const TextStyle(
                                                        fontSize: 17),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.only(left: 20),
                                            child: SizedBox(
                                              height: 15,
                                            ),
                                          )
                                        ],
                                      ),
                                      decoration: BoxDecoration(
                                          boxShadow: const [
                                            BoxShadow(
                                                blurRadius: 10,
                                                color: Color.fromARGB(
                                                    255, 121, 113, 113))
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          color: const Color.fromARGB(
                                              255, 244, 253, 191)),
                                      height: h * .12,
                                      width: w * 1,
                                    ),
                                  ),
                                  SizedBox(
                                    height: h * .05,
                                  )
                                ],
                              )),
                      Positioned(
                          left: w * .18,
                          top: h * .83,
                          child: MaterialButton(
                            elevation: 9,
                            height: 40,
                            minWidth: 50,
                            color: Colors.amber,
                            onPressed: () {
                              String? adresse;
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        title: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                           ],
                                        ),
                                        content: TextFormField(
                                          onChanged: (value) => adresse = value,
                                          decoration: const InputDecoration(
                                              hintText: 'your adresse'),
                                        ),
                                        actions: [
                                          MaterialButton(
                                            onPressed: () {
                                              Store.store.BoughtProduct({ 'adresse' : adresse },products);
                                            },
                                            child: Text('confirm'),
                                          ),
                                          MaterialButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text('cancel'),
                                          )
                                        ],
                                      ));
                            },
                            child: const Text(
                              'Buy Now',
                              style: TextStyle(fontSize: 20),
                            ),
                          )),
                    ],
                  );
                } else {
                  return const Padding(
                    padding: EdgeInsets.only(top: 150),
                    child: Center(child: Text('cart is empty')),
                  );
                }
              },
            ),
          ],
        ));
  }
}
