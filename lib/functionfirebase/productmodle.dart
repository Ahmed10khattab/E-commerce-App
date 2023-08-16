import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModele {
  int? PQuantity;
  String? id;
  String? pname;
  String? pdescription;
  String? plocation;
  String? pprice;
  String? pcategory;

  ProductModele(
      {this.pcategory,
      this.PQuantity,
      this.id,
      this.pdescription,
      this.plocation,
      this.pname,
      this.pprice});

  factory ProductModele.fromMap(QueryDocumentSnapshot<Object?> product) {
    return ProductModele(
        pcategory: product['category'],
        pdescription: product['description'],
        pname: product['name'],
        plocation: product['location'],
        pprice: product['price']);
  }

  Map<String?, dynamic> tojson(data) {
    return {
      pcategory:data['category'] ,
     pdescription  :data['description'] ,
      pname: data['name'],
      plocation: data['location'] ,
     pprice :  data['price']
    };
  }
}
