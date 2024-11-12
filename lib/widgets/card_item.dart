import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  String img;
  String productName;
  var price;
  CardItem({super.key, required this.img, required this.productName, required this.price});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          child: Expanded(
            child: Column(
              children: [
                Image.network(img, width: 150, height: 100,),
                const SizedBox(height: 8,),
                Center(child: Text(productName.substring(0,20), )),
                const SizedBox(height: 8,),
                Center(child: Text("$price dollars")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
