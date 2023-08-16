import 'dart:developer';

import 'package:fire1/functionfirebase/productmodle.dart';
import 'package:flutter/material.dart';

class AddCard extends ChangeNotifier {
  List<ProductModele> products = [];
  AddToCard(ProductModele product) {
    products.add(product);
    notifyListeners();
  }

  delete(ProductModele product) {
    products.remove(product);
    notifyListeners();
  }
 
}
