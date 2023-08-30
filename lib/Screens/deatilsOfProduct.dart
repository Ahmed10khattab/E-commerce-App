import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire1/Screens/CardProvider.dart';
import 'package:fire1/functionfirebase/firestore.dart';
import 'package:fire1/functionfirebase/productmodle.dart';
import 'package:flutter/cupertino(1).dart';
import 'package:flutter/material(1).dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';

class DetailOfProduct extends StatefulWidget {
  const DetailOfProduct({Key? key}) : super(key: key);

  @override
  State<DetailOfProduct> createState() => _DetailOfProductState();
}

class _DetailOfProductState extends State<DetailOfProduct> {
  var counter = 1;
  var adresse;
  @override
  Widget build(BuildContext context) {
    ProductModele data =
        ModalRoute.of(context)!.settings.arguments as ProductModele;

    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              Stack(
                children: [
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      height: h * .7,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 4,
                              color: Colors.black.withOpacity(.5))
                        ],
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(20),
                      )),
                  Positioned(
                    top: h * .13,
                    left: w * .2,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30)),
                      child: Image(
                        image: AssetImage(data.plocation!),
                        fit: BoxFit.cover,
                      ),
                      height: h * .4,
                      width: w * .6,
                    ),
                  ),
                  Positioned(
                      top: h * .59,
                      left: w * .6,
                      child: Container(
                        child: Column(
                          children: [
                            const Text(
                              'Quantity',
                              style: TextStyle(fontSize: 18),
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        counter++;
                                      });
                                    },
                                    child: const CircleAvatar(
                                      backgroundColor: Colors.grey,
                                      child: Center(
                                        child: Icon(Icons.add),
                                      ),
                                      radius: 19,
                                    )),
                                Card(
                                    color: Colors.green,
                                    child: Text(
                                      counter.toString(),
                                      style: TextStyle(fontSize: 40),
                                    )),
                                GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        if (counter >= 2) {
                                          counter--;
                                        }
                                      });
                                    },
                                    child: const CircleAvatar(
                                      backgroundColor: Colors.grey,
                                      child:
                                          Center(child: Icon(Icons.minimize)),
                                      radius: 19,
                                    )),
                              ],
                            )
                          ],
                        ),
                      )),
                  Positioned(
                      top: h * .56,
                      left: w * .1,
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Category  :  ${data.pcategory!}',
                              style: const TextStyle(
                                  fontStyle: FontStyle.italic, fontSize: 18),
                            ),
                            Text(
                              'Description  :  ${data.pdescription!}',
                              style: const TextStyle(
                                  fontStyle: FontStyle.italic, fontSize: 18),
                            ),
                            Text(
                              'Name:   ${data.pname}',
                              style: const TextStyle(
                                  fontStyle: FontStyle.italic, fontSize: 18),
                            ),
                            Text(
                              'price  :  ${data.pprice}\$',
                              style: const TextStyle(
                                  fontStyle: FontStyle.italic, fontSize: 18),
                            )
                          ],
                        ),
                      )),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Builder(builder: (context) {
                return GestureDetector(
                  onTap: () {
                    var cartItem = Provider.of<AddCard>(context, listen: false);
                    data.PQuantity = counter;

                    bool exist = false;
                    for (var counter in cartItem.products) {
                      if (counter == data) {
                        
                                           exist = true;

                      }
                    }
                    if (exist) {
                      Scaffold.of(context).showSnackBar(const SnackBar(
                          content: Text("you have added it befor")));
                    } else {
                      cartItem.AddToCard(data);
                      Scaffold.of(context).showSnackBar(
                          const SnackBar(content: Text("added to cart")));
                    }

                 
                  },
                  child: Container(
                    height: h * .07,
                    width: w * .4,
                    child: const Center(
                        child: Text(
                      'Add to cart',
                      style: TextStyle(fontSize: 17),
                    )),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.green),
                  ),
                );
              }),
              
            ],
          ),
        ],
      ),
    );
  }
}
