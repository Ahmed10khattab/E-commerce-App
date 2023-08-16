 
import 'package:flutter/cupertino(1).dart';

class Order {
  
  String? adresse;
 String? DocId;
  Order({required this.adresse,this.DocId });

  factory Order.fromMap(order) {
    return Order(adresse: order['adresse'],  );
  }
}
