import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 157, 162, 167),
      body: Padding(
        padding: const EdgeInsets.only(left: 130),
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                onPressed: () {
                  Navigator.pushNamed(context, 'Addproduct');
                },
                child: const Text(
                  'add Product',
                  style: TextStyle(fontSize: 20),
                ),
                color: Colors.blue,
              ),
              const SizedBox(
                height: 10,
              ),
              MaterialButton(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                onPressed: () {
                  Navigator.pushNamed(context, 'edit');
                },
                child: const Text(
                  'Edit Product',
                  style: TextStyle(fontSize: 20),
                ),
                color: Colors.blue,
              ),
              const SizedBox(
                height: 10,
              ),
              MaterialButton(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                onPressed: () {
                  Navigator.pushNamed(context, 'orders');
                },
                child: const Text(
                  'orders',
                  style: TextStyle(fontSize: 20),
                ),
                color: Colors.blue,
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
