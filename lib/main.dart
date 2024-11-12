import 'package:flutter/material.dart';
import 'package:hosny_mohammed_0522022/providers/auth_provider.dart';
import 'package:hosny_mohammed_0522022/providers/product_provider.dart';
import 'package:hosny_mohammed_0522022/screens/signup_screen.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [ChangeNotifierProvider(create: (context) => AuthProvider()),ChangeNotifierProvider(create: (context) => ProductProvider())], child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignupScreen(),
    ),);
  }
}
