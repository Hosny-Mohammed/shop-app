import 'package:flutter/cupertino.dart';
import 'package:hosny_mohammed_0522022/models/product_model.dart';
import 'package:hosny_mohammed_0522022/services/product_service.dart';

class ProductProvider extends ChangeNotifier{
  ProductModel? model;
  Future<void> fetchData() async{
    model = await ProductService.fetchData();
    notifyListeners();
  }
}