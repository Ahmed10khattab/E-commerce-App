import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class Auth{
  static var fireAuth=Auth();
FirebaseAuth auth = FirebaseAuth.instance;

SignOut() async {
   
  
  await auth.signOut();
    
}

}





// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:fire1/Screens/fristscreen.dart';
// import 'package:flutter/cupertino(1).dart';

// import 'package:flutter/foundation(1).dart';
// import 'package:flutter/widgets.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:path/path(1).dart';
// import 'package:flutter/material.dart';
// import 'package:path/path.dart';

// class Auth {
//   static Auth a1 = Auth();
//   FirebaseAuth auth = FirebaseAuth.instance;

//   signupWithEmailAndPassword(
//       {required String email, required String password}) async {
//     try {
//       UserCredential userCredential = await auth.createUserWithEmailAndPassword(
//           email: email, password: password);

//       var user = userCredential.user;
//       print(user!.uid);
//       if (user.uid.isNotEmpty) {
//       //  Navigator.pushNamed(context, 'firstScreen');
//       }
//     } catch (e) {
//       print(e);
//     }
//   }

//   signinwitheamailandpassword(
//       {required String email, required String password}) async {
//     try {
//       UserCredential userCredential = await auth.signInWithEmailAndPassword(
//           email: email, password: password);
//       if (userCredential.user!.uid.isNotEmpty) {
//       //  Navigator.pushNamed(context, 'firstScreen');
        
//       } else if (kDebugMode) {
//         print('${userCredential.user!.email}is logged in');
//       }
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'user-not-found') {
//         Fluttertoast.showToast(msg: ' the Email is wrong');
//       } else if (e.code == 'wrong-password') {
//         Fluttertoast.showToast(msg: 'the password is worng');
//       }

//       print(e);

//       print(e);
//     }
//   }
// }




// //  try {
// //                                 FirebaseAuth auth = FirebaseAuth.instance;

// //                                 UserCredential userCredential =
// //                                     await auth.createUserWithEmailAndPassword(
// //                                         email: email.text,
// //                                         password: password.text);

// //                                 var user = userCredential.user;
// //                                 print(user!.uid);
// //                                 if (user.uid.isNotEmpty) {
// //                                   Navigator.pushReplacementNamed(
// //                                       context, 'firstScreen');
// //                                 }
                                
// //                               } catch (e) {
// //                                 print(e);
// //                               }


// //                                var p = AllFormFeild.currentState;
// //                               if (p!.validate()) {
// //                                 p.save();
