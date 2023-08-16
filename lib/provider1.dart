import 'package:flutter/cupertino(1).dart';

class Adminn extends ChangeNotifier {
  bool isadmin = false;
  change(bool val) {
   isadmin = val;
    notifyListeners();
  }
 }
  
 