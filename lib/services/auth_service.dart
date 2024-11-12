import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hosny_mohammed_0522022/models/user_model.dart';

class AuthService{
  static Dio dio = Dio();
  static const urlLogin = 'https://student.valuxapps.com/api/login';
  static const urlSignup = 'https://student.valuxapps.com/api/register';

  static Future<UserModel?> login({required String email, required String password}) async{
    Map cred = {
      "email" : email,
      "password" : password,
    };
    try{
      Response response = await dio.post(urlLogin, data: cred);
      var model =  UserModel.getJson(response.data);
      if(response.statusCode == 200){
        if(model.status){
          return model;
        }else{
          return null;
        }
      }
    }catch(ex){
      return null;
    }
  }

  static Future<bool> signUp({required String name, required String email, required String password, required String phone}) async{
    Map credLogIn = {
      "name": name,
      "email": email,
      "password": password,
      "phone": phone
    };
    try{
      Response response = await dio.post(urlSignup, data: credLogIn);

      var model = UserModel.getJson(response.data);
      if (kDebugMode) {
        print(model.status);
      }
      if(response.statusCode == 200 && model.status == true){
        return true;
      }
      return false;
    }
    catch(ex){
      return false;
    }
  }
}