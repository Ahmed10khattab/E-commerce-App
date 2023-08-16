import 'package:flutter/material.dart';

class FormFeild extends StatelessWidget {
  FormFeild({
    Key? key,
    @required this.text,
    @required this.photo,
    @required this.controllar,
  }) : super(key: key);
  String? text;
  Icon? photo;
  var controllar;

  msg(String? text) {
    switch (text) {
      case "Create new E-mail":
        return 'email is not valid';
      case "password":
        return 'the password is not valid';
        case "Email":
        return 'the Email is not fount';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return msg(text);
          }
          if (text == "password" && value.length < 6) {
            return 'at least 7 number ';
          }
        },
        obscureText: text == 'password' ? true : false,
        controller: controllar,
        decoration: InputDecoration(
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(color: Colors.white)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(color: Colors.white)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(30)),
            disabledBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
            hintText: text,
            prefixIcon: photo,
            enabledBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
      ),
    );
  }
}
