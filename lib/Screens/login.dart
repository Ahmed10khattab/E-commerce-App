import 'package:fire1/Screens/Edit.dart';
import 'package:fire1/custom_wedgit/signup.dart';
import 'package:fire1/custom_wedgit/textform.dart';
import 'package:fire1/functionfirebase/firestore.dart';
import 'package:fire1/provider1.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fire1/Screens/AdminScreen.dart';
import 'package:fire1/Screens/fristscreen.dart';
import 'package:fire1/custom_wedgit/loading.dart';
import 'package:fire1/functionfirebase/Auth.dart';
import 'package:fire1/provider1.dart';
import 'package:flutter/cupertino(1).dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> AllFormFeild = new GlobalKey<FormState>();
  bool isadmin = false;
  final pr = 'admin1234';
  bool keepMeLogin = false;

  //  void valid() {
  //    var n = AllFormFeild.currentState;
  //   if (n!.validate()) {
  //     n.save();
  //   }
  // }

  late TextEditingController password;
  late TextEditingController email;

  @override
  void initState() {
    super.initState();
    password = TextEditingController();
    email = TextEditingController();
  }

  @override
  void dispose() {
    password.dispose();
    email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.amber,
      body: Form(
        key: AllFormFeild,
        child: ListView(
          children: [
            Column(
              children: [
                Container(
                  child: Stack(
                    children: const [
                      Image(
                        image: AssetImage('lib/images/lo.png'),
                      ),
                      Positioned(
                        child: Text(
                          'E-Commerce ',
                          style: TextStyle(fontSize: 20),
                        ),
                        top: 140,
                        left: 18,
                      )
                    ],
                  ),
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * .13),
                  height: 200,
                  width: 150,
                ),
                Divider(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                FormFeild(
                    text: 'Email',
                    photo: const Icon(Icons.email),
                    controllar: email),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, bottom: 10),
                  child: Row(
                    children: [
                      Checkbox(
                          value: keepMeLogin,
                          onChanged: (bool? val) => setState(() {
                                keepMeLogin = val!;
                              })),
                      Text('Remember Me ')
                    ],
                  ),
                ),
                FormFeild(
                    controllar: password,
                    text: 'password',
                    photo: const Icon(Icons.password)),
                Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Builder(builder: (context) {
                      return MaterialButton(
                          child: const Text('Sign in'),
                          color: const Color.fromRGBO(209, 167, 41, 1),
                          onPressed: () async {
                            if (keepMeLogin == true) {
                              keep();
                            }
                            var p = AllFormFeild.currentState;
                          
                            if (p!.validate()) {
                              p.save();
                              if (Provider.of<Adminn>(context, listen: false)
                                      .isadmin &&
                                  password.text == 'admin1234') {
                                try {
                                   

                                  FirebaseAuth auth = FirebaseAuth.instance;
                                  await auth.signInWithEmailAndPassword(
                                      email: email.text.trim(),
                                      password: password.text.trim());
                                  //Store.store.signin(email.text, password.text);
                                  Navigator.pushReplacementNamed(
                                      context, 'AdminScreen');
                                } on FirebaseAuthException catch (e) {
                                  if (e.code == 'user-not-found') {
                                    Fluttertoast.showToast(
                                        msg: ' the Email is wrong');
                                  } else if (e.code == 'wrong-password') {
                                    Fluttertoast.showToast(
                                        msg: 'the password is worng');
                                  }
                                }
                              }

                              try {
                                FirebaseAuth auth = FirebaseAuth.instance;

                                UserCredential userCredential =
                                    await auth.signInWithEmailAndPassword(
                                        email: email.text.trim(),
                                        password: password.text.trim());

                                // Store.store.signin(email.text, password.text);

                                //  var user = userCredential.user;
                                // print(user!.uid);
                                // showDialog(
                                //       context: context,
                                //       builder: (context) => const Center(
                                //               child: CircularProgressIndicator(
                                //             backgroundColor: Colors.blue,
                                //             color: Colors.white,
                                //           )));

                                Navigator.pushReplacementNamed(
                                    context, 'firstScreen');

                                ;
                              } on FirebaseAuthException catch (e) {
                                if (e.code == 'user-not-found') {
                                  Fluttertoast.showToast(
                                      msg: ' the Email is wrong');
                                } else if (e.code == 'wrong-password') {
                                  Fluttertoast.showToast(
                                      msg: 'the password is worng');
                                }

                                print(e);
                              }
                            } else {
                              Scaffold.of(context).showSnackBar(const SnackBar(
                                  content: Text(
                                'enter your email and password',
                                textAlign: TextAlign.center,
                              )));
                            }
                          });
                    })),
              ],
            ),
            Divider(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Row(
              children: [
                Container(
                    padding: const EdgeInsets.only(left: 10),
                    child: const Text(
                      "You don't have an account?",
                      style: TextStyle(fontSize: 18),
                    )),
                Card(
                  color: const Color.fromARGB(255, 255, 212, 82),
                  child: GestureDetector(
                      onTap: (() {
                        Navigator.pushNamed(context, 'SignUp');
                      }),
                      child: const Text('Sign Up',
                          style: TextStyle(fontSize: 18))),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Row(
                children: [
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      Provider.of<Adminn>(context, listen: false).change(true);
                    },
                    child: Text(
                      'I am admin',
                      style: TextStyle(
                          color: Provider.of<Adminn>(
                        context,
                      ).isadmin
                              ? Colors.amber
                              : Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  )),
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      Provider.of<Adminn>(context, listen: false).change(false);
                    },
                    child: Text('I am user',
                        style: TextStyle(
                            color: Provider.of<Adminn>(
                          context,
                        ).isadmin
                                ? Colors.black
                                : Colors.amber),
                        textAlign: TextAlign.center),
                  ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  keep() async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    preference.setBool('keepMeLogin', keepMeLogin);
  }

  void loding(bool val) {
    if (val = true) {
      showDialog(
          context: context,
          builder: (context) => const Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.blue,
                  color: Color.fromRGBO(209, 193, 193, 1),
                ),
              ));
    } else {
      return null;
    }
  }

  // void _valid(BuildContext context) async {
  //   if (AllFormFeild.currentState!.validate()) {
  //     AllFormFeild.currentState!.save();
  //     if (Provider.of<Adminn>(context).isadmin) {
  //       if (password == pr) {
  //         try {
  //           Store.store.signin(email.text, password.text);
  //           Navigator.pushNamed(context, 'AdminScreen');
  //         } catch (e) {
  //           Scaffold.of(context).showSnackBar(SnackBar(content: Text('err')));
  //         }
  //       } else {
  //         Scaffold.of(context).showSnackBar(SnackBar(content: Text('aaaaa')));
  //       }
  //     } else {
  //       try {
  //         Store.store.signin(email.text, password.text);
  //         Navigator.pushNamed(context, 'firstScreen');
  //       } catch (e) {
  //         Scaffold.of(context).showSnackBar(SnackBar(content: Text('mmmm')));
  //       }
  //     }
  //   } else {
  //     Scaffold.of(context).showSnackBar(SnackBar(content: Text('ffffff')));
  //   }
  // }
}
