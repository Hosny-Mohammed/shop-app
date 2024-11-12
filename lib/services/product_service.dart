import 'package:dio/dio.dart';
import 'package:hosny_mohammed_0522022/models/product_model.dart';

class ProductService{
  static Dio dio = Dio();
  static const url = 'https://student.valuxapps.com/api/home';

  static Future<ProductModel?> fetchData() async{
    Response response = await dio.get(url);
    if(response.statusCode == 200){
      var model = ProductModel.getJson(response.data);
      if(model.status){
        return model;
      }else{
        return null;
      }
    }
    return null;
  }
}