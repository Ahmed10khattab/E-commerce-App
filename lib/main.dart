import 'package:fire1/Screens/AdminOrderScreen.dart';
import 'package:fire1/Screens/AdminScreen.dart';
import 'package:fire1/Screens/CardProvider.dart';
import 'package:fire1/Screens/DestailsOfOrder.dart';
import 'package:fire1/Screens/Edit.dart';
import 'package:fire1/Screens/ScreenCard.dart';
import 'package:fire1/Screens/addproductScreen.dart';
import 'package:fire1/Screens/deatilsOfProduct.dart';
import 'package:fire1/Screens/fristscreen.dart';
import 'package:fire1/Screens/login.dart';
import 'package:fire1/Screens/manageproduct.dart';
import 'package:fire1/Screens/providers/DarkModeProvider.dart';
import 'package:fire1/custom_wedgit/signup.dart';
import 'package:fire1/provider1.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
bool darkMode=false;
void main( ) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
 // var shared = SharedPreferences.getInstance();
 //  shared.then((value) => value.getBool('DarkMode'));
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool? IsUserLogedIn;
  @override
  @override
  Widget build(BuildContext context) {
   
    return FutureBuilder<SharedPreferences>(
        future: SharedPreferences.getInstance(),
        builder: (context, snapshot) {

          if (!snapshot.hasData) {
            return const MaterialApp(
         
              home: Scaffold(
                  body: Center(
                child: Text('loading...'),
              )),
            );
          }
          IsUserLogedIn = snapshot.data!.getBool('keepMeLogin') ?? false;
          return MultiProvider(
            providers: [
            // ChangeNotifierProvider(create: (context) => DarkMode()),
              ChangeNotifierProvider(create: (context) => AddCard()),
               ChangeNotifierProvider(create: (context) => Adminn())
            
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Login(),
              initialRoute: IsUserLogedIn! ? 'firstScreen' : ' login',
              routes: {
                'firstScreen': (context) => FristScreen(),
                'login': ((context) => Login()),
                'SignUp': (context) => const Sign_up(),
                'AdminScreen': (context) => const AdminScreen(),
                'Addproduct': (context) => const AddProduct(),
                'edit': (context) => Edit(),
                'manageproduct': (context) => ManageProduct(),
                'detailofproduct': (context) => const DetailOfProduct(),
                'ScreenCard': (context) => ScreenCard(),
                'orders': (context) => Ordered(),
                'OrderDetails': (context) => OrderDetails()
              },
            ),
          );
        });
  }
}
