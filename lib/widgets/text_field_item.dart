import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFieldItem extends StatelessWidget {
  TextEditingController textEditingController;
  String hintText;
  Icon icon;
  TextFieldItem({super.key, required this.textEditingController, required this.hintText, required this.icon});

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      controller:textEditingController,
      decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: hintText,
          suffixIcon: icon
      ),
      validator: (text){
        if(text == null || text.isEmpty){
          return "This Field Can't be empty!";
        }else {
          return null;
        }
      },
    );
  }
}
