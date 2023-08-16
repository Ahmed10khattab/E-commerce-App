import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,width: 200,
      color: Colors.grey,
      child: Center(
        child:SpinKitChasingDots(
          duration: Duration(seconds: 1),
          color: Colors.blue,
          size: 100,
           
        ) ,
      ),
      
    );
  }
}