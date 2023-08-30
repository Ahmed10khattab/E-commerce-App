import 'package:fire1/custom_wedgit/textform.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fire1/Screens/fristscreen.dart';
import 'package:fire1/custom_wedgit/loading.dart';
import 'package:fire1/functionfirebase/Auth.dart';
import 'package:flutter/cupertino(1).dart';
import 'package:flutter/material.dart';
import 'package:flutter/services(1).dart';

class Sign_up extends StatefulWidget {
  const Sign_up({Key? key}) : super(key: key);

  @override
  State<Sign_up> createState() => _LoginState();
}

class _LoginState extends State<Sign_up> {
  GlobalKey<FormState> AllFormFeild = new GlobalKey<FormState>();

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
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                    children: [
                      Container(
                          height: 180,
                          width: 150,
                          child: const Image(
                            image: AssetImage('lib/images/log.jpg'),
                          )),
                      const Positioned(
                        child: Text(
                          'E-Commerce ',
                          style: TextStyle(fontSize: 20),
                        ),
                        top: 160,
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
                    text: 'Create new E-mail',
                    photo: const Icon(Icons.email),
                    controllar: email),
                Divider(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                FormFeild(
                    controllar: password,
                    text: 'password',
                    photo: const Icon(Icons.password)),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Builder(builder: (context) {
                    return MaterialButton(
                        child: const Text('Sign up'),
                        color: const Color.fromARGB(255, 209, 167, 41),
                        onPressed: () async {
                          var p = AllFormFeild.currentState;
                          if (p!.validate()) {
                            p.save();
                          }

                          try {
                            FirebaseAuth auth = FirebaseAuth.instance;

                            UserCredential userCredential =
                                await auth.createUserWithEmailAndPassword(
                                    email: email.text, password: password.text);

                            var user = userCredential.user;
                            print(user!.uid);
                            if (user.uid.isNotEmpty) {
                              showDialog(
                                  context: context,
                                  builder: (context) => const Center(
                                        child: CircularProgressIndicator(
                                          backgroundColor: Colors.blue,
                                          color:
                                              Color.fromRGBO(209, 193, 193, 1),
                                        ),
                                      ));

                              Navigator.pushReplacementNamed(
                                  context, 'firstScreen');
                            }
                          } catch (e) {
                            print(e);

                            Scaffold.of(context).showSnackBar(const SnackBar(
                                backgroundColor:
                                    Color.fromARGB(255, 44, 43, 43),
                                content: Text(
                                  'the email or password is not valid try again ',
                                  textAlign: TextAlign.center,
                                )));
                          }
                        });
                  }),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
