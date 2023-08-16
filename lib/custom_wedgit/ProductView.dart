import 'package:fire1/functionfirebase/productmodle.dart';
import 'package:flutter/cupertino(1).dart';
import 'package:flutter/material.dart';

class ProductView extends StatefulWidget {
  ProductView({Key? key, @required this.productlistname}) : super(key: key);

  var productlistname;

  @override
  
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  @override
  
  
  Widget build(BuildContext context) {
    
      return GridView.builder(
        physics: BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: .7),
        itemCount: widget.productlistname.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: GestureDetector(
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'detailofproduct',
                      arguments: widget.productlistname[index]);
                },
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image(
                          fit: BoxFit.fill,
                          image: AssetImage(widget.productlistname[index].plocation!)),
                    ),
                    Positioned(
                        bottom: 0,
                        child: Opacity(
                          opacity: .8,
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 9, vertical: 1),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        'name: ${widget.productlistname[index].pname!}'),
                                    Text(
                                      'price: ${widget.productlistname[index].pprice!} \$',
                                      style: TextStyle(fontSize: 20),
                                    )
                                  ]),
                            ),
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            color: Color.fromARGB(255, 255, 247, 247),
                          ),
                        ))
                  ],
                ),
              ),
            ),
          );
        },
      );
    }  
}

