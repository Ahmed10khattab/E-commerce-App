import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire1/Screens/Edit.dart';
import 'package:fire1/Screens/ScreenCard.dart';
import 'package:fire1/Screens/providers/DarkModeProvider.dart';
import 'package:fire1/custom_wedgit/ProductView.dart';
import 'package:fire1/functionfirebase/Auth.dart';
import 'package:fire1/functionfirebase/firestore.dart';
import 'package:fire1/functionfirebase/productmodle.dart';
import 'package:fire1/main.dart';
import 'package:flutter/foundation(1).dart';
import 'package:flutter/gestures(1).dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FristScreen extends StatefulWidget {
  FristScreen({Key? key}) : super(key: key);

  @override
  State<FristScreen> createState() => _FristScreenState();
}

class _FristScreenState extends State<FristScreen> {
  @override
  @override
  bool value = false;

  int TapBarIndex = 0;
  int IndexNavigation = 0;
  List<ProductModele> productListForTrouser = [];
  List<ProductModele> productListForShirt = [];
  List<ProductModele> productListForTShirt = [];
  List<ProductModele> productListForJacket = [];

  Widget build(BuildContext context) {
    

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return DefaultTabController(
      length: 4,
      child: Scaffold(
          drawer: Drawer(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      color: Colors.cyan,
                      height: height * .35,
                      width: double.infinity,
                    ),
                    const Positioned(
                        top: 140,
                        left: 30,
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.blue,
                        )),
                    const Positioned(
                        top: 250,
                        left: 20,
                        child: Text('ahmed50khattab@yahoo.com'))
                  ],
                ),
                ListTile(
                    leading: const Icon(Icons.dark_mode),
                    title: const Text('dark mode'),
                    trailing: Switch(
                        value: value,
                        onChanged: (val) => setState(() {
                              value = val;
                            }))),
                GestureDetector(
                    onTap: () async {

                      Navigator.popAndPushNamed(context, 'login');
                    },
                    child: const ListTile(
                      leading: Icon(Icons.logout),
                      title: Text('LogOut'),
                    )),
              ],
            ),
            backgroundColor: Colors.blueGrey,
          ),
          appBar: AppBar(
            toolbarHeight: 70,
            elevation: 5,
            backgroundColor: const Color.fromARGB(255, 109, 76, 76),
            title: const Padding(
              padding: EdgeInsets.only(top: 25, right: 140),
              child: Text(
                'Discover',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(top: 20, right: 30),
                child: Column(
                  children: [
                     
                    IconButton(
                        onPressed: () {
                          setState(() {

                          });

                        },
                        icon: const Icon(Icons.shopping_cart )),
                     
                  ],
                ),
              )
            ],
            centerTitle: true,
            bottom: const TabBar(
                unselectedLabelStyle: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w300,
                    fontSize: 10),
                unselectedLabelColor: Colors.amber,
                indicatorColor: Color.fromARGB(255, 255, 210, 76),
                tabs: [
                  Text(
                    'jackets',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  Text('trouser',
                      style: TextStyle(color: Colors.black, fontSize: 20)),
                  Text('t-shirt',
                      style: TextStyle(color: Colors.black, fontSize: 20)),
                  Text('shirt',
                      style: TextStyle(color: Colors.black, fontSize: 20)),
                ]),
          ),
          body: Stack(
            children: [
              TabBarView(children: [
                jacket(),
                ProductView(productlistname: productListForTrouser),
                ProductView(productlistname: productListForTShirt),
                ProductView(productlistname: productListForShirt),
              ]),
              Positioned(
                  bottom: 0,
                  child: Stack(
                    children: [
                      Container(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        height: height * .1,
                        width: width,
                      ),
                      Positioned(
                          left: width * .1,
                          top: height * .037,
                          child: Column(
                            children: const [
                              Icon(
                                Icons.home,
                                size: 25,
                              ),
                              Text('Home', style: TextStyle(fontSize: 18))
                            ],
                          )),
                      Positioned(
                          left: width * .42,
                          top: height * .037,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, 'ScreenCard');
                            },
                            child: Column(
                              children: const [
                                Icon(
                                  Icons.favorite,
                                  size: 25,
                                ),
                                Text(
                                  'Favorite',
                                  style: TextStyle(fontSize: 18),
                                )
                              ],
                            ),
                          )),
                      Positioned(
                          left: width * .77,
                          top: height * .037,
                          child: GestureDetector(
                            onTap: () async {
                              SharedPreferences shared =
                                  await SharedPreferences.getInstance();
                              shared.clear();
                              Navigator.popAndPushNamed(context, 'login');
                            },
                            child: Column(
                              children: const [
                                Icon(
                                  Icons.logout,
                                  size: 25,
                                ),
                                Text(
                                  'LogOut',
                                  style: TextStyle(fontSize: 18),
                                )
                              ],
                            ),
                          )),
                    ],
                  )),
            ],
          )),
    );
  }

  Widget jacket() {
    return StreamBuilder<QuerySnapshot>(
      stream: user,
      builder: (context, snapshot) {
        productListForTrouser.clear();
        productListForShirt.clear();
        productListForJacket.clear();
        productListForTShirt.clear();

        List<ProductModele> product = [];
        if (snapshot.hasData) {
          for (var doc in snapshot.data!.docs) {
            ProductModele proudcts = ProductModele.fromMap(doc);

            if (proudcts.pcategory == 'jacket') {
              product.add(proudcts);
            } else if (proudcts.pcategory == 'shirt') {
              productListForShirt.add(proudcts);
            } else if (proudcts.pcategory == 'tshirt') {
              productListForTShirt.add(proudcts);
            } else if (proudcts.pcategory == 'trouser') {
              productListForTrouser.add(proudcts);
            }
          }
          return GridView.builder(
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: .7),
            itemCount: product.length,
            itemBuilder: (context,index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: GestureDetector(
                  onTap: () => Navigator.pushNamed(
                    context,
                    'detailofproduct',
                    arguments: product[index],
                  ),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image(
                            fit: BoxFit.fill,
                            image: AssetImage(product[index].plocation!)),
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
                                      Text('name:  ${product[index].pname!}'),
                                      Text(
                                        'price :${product[index].pprice!} \$',
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
        return const Center(
            child: CircularProgressIndicator(
          color: Colors.blue,
          backgroundColor: Colors.white,
        ));
      },
    );
  }
}
