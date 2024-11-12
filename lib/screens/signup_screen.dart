import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hosny_mohammed_0522022/providers/auth_provider.dart';
import 'package:hosny_mohammed_0522022/screens/login_screen.dart';
import 'package:provider/provider.dart';
import '../widgets/text_field_item.dart';
import 'home_screen.dart';

class SignupScreen extends StatelessWidget {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
        centerTitle: true,
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              width: double.infinity,
              child: Column(
          
                children: [
                 const Icon(CupertinoIcons.profile_circled, color: Colors.grey,size: 150,),
                  const SizedBox(height: 10,),
                  TextFieldItem(textEditingController: name, hintText: 'Enter ur name', icon: const Icon(CupertinoIcons.profile_circled),),
                  const SizedBox(height: 10,),
                  TextFieldItem(textEditingController: email, hintText: 'Enter ur email', icon: const Icon(CupertinoIcons.mail_solid),),
                  const SizedBox(height: 10,),
                  TextFieldItem(textEditingController: password, hintText: 'Enter ur password', icon: const Icon(CupertinoIcons.padlock_solid),),
                  const SizedBox(height: 20,),
                  TextFieldItem(textEditingController: phone, hintText: 'Enter ur phone', icon: const Icon(CupertinoIcons.phone),),
                  const SizedBox(height: 20,),
                  MaterialButton(onPressed: () async{
                    if(formKey.currentState!.validate()){
                      await provider.signup(name: name.text, email: email.text, password: password.text, phone: phone.text);
                      if(provider.signupStatus!){
                        ScaffoldMessenger.of(context).showSnackBar(provider.signupSnackbar!);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                      }else{
                        ScaffoldMessenger.of(context).showSnackBar(provider.signupSnackbar!);
                      }
                    }
                  }, child: const Text("Sign Up"), color: Colors.blue,),

                  Center(
                    child: Row(
                      children: [
                        const Text("Do have an account"),
                        MaterialButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                        }, child: Text("Log in", style: TextStyle(color: Colors.blue),),)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      
      ),
    );
  }
}
