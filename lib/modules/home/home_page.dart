import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(6.0)
        ,
        child: Image.asset('assets/images/littletree.png'),
      ),
      ),
      body: Container(
          padding: const EdgeInsets.all(20),
          child: const Text(
          'Nome',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23, color: Colors.white),
      ),
      ),

        );
  }
}