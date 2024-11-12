import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  String img;
  String title;
  String description;
  ProductDetailScreen({super.key, required this.img, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              Image.network(img),
              const SizedBox(height: 10,),
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold),),
              const SizedBox(height: 10,),
              Text(description)
            ],
          ),
        ),
      ),
    );
  }
}
