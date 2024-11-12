import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hosny_mohammed_0522022/models/user_model.dart';
import 'package:hosny_mohammed_0522022/services/auth_service.dart';

class AuthProvider extends ChangeNotifier{
  bool? loginStatus;
  bool? signupStatus;
  SnackBar? loginSnackbar;
  SnackBar? signupSnackbar;

  Future<void> login({required String email, required String password}) async{
    var model = await AuthService.login(email: email, password: password);

    if(model != null){
      loginSnackbar = const SnackBar(content: Text("Login Successfully"), backgroundColor: Colors.green,);
      loginStatus = true;
    }else{
      loginSnackbar = const SnackBar(content: Text("Login Failed"), backgroundColor: Colors.red,);
      loginStatus = false;
    }
    notifyListeners();
  }

  Future<void> signup({required String name, required String email, required String password, required String phone}) async{
    signupStatus = await AuthService.signUp(name: name, email: email, password: password,phone: phone);

    if(signupStatus!){
      signupSnackbar = const SnackBar(content: Text("Signup Successfully"), backgroundColor: Colors.green,);
    }else{
      signupSnackbar = const SnackBar(content: Text("Signup Failed"), backgroundColor: Colors.red,);
    }
    notifyListeners();
  }
}