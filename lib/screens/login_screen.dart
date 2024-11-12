import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hosny_mohammed_0522022/providers/auth_provider.dart';
import 'package:hosny_mohammed_0522022/screens/signup_screen.dart';
import 'package:provider/provider.dart';
import '../widgets/text_field_item.dart';
import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Log in"),
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
                    TextFieldItem(textEditingController: email, hintText: 'Enter ur email', icon: const Icon(CupertinoIcons.mail_solid),),
                    const SizedBox(height: 10,),
                    TextFieldItem(textEditingController: password, hintText: 'Enter ur password', icon: const Icon(CupertinoIcons.padlock_solid),),
                    const SizedBox(height: 20,),
                    MaterialButton(onPressed: () async{
                      if(formKey.currentState!.validate()){
                        await provider.login(email: email.text, password: password.text);
                        if(provider.loginStatus!){
                          ScaffoldMessenger.of(context).showSnackBar(provider.loginSnackbar!);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                        }else{
                          ScaffoldMessenger.of(context).showSnackBar(provider.loginSnackbar!);
                        }
                      }
                    }, child: const Text("Log in"), color: Colors.blue,),

                    Center(
                      child: Row(
                        children: [
                          Text("Do u wanna create an account"),
                          MaterialButton(onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => SignupScreen()));
                          }, child: Text("Sign Up", style: TextStyle(color: Colors.blue),),)
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
