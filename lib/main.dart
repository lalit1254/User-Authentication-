import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sign_in/pages/login_or_signup_page.dart';
import 'package:sign_in/pages/signup_page.dart';
import 'package:sign_in/routes.dart';

import 'pages/auth_page.dart';
import 'pages/home_page.dart';
import 'pages/login_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
            routes: {
       "/":(context) => LoginPage(),
      MyRoutes.homeRoute: (context) => HomePage(),
      MyRoutes.loginRoute:(context) => LoginPage(),
        MyRoutes.signupRoute:(context) => SignupPage(),
      // MyRoutes.cartRoute:(context) => CartPage(),
      // MyRoutes.profileRoute:(context) => ProfilePage(),
      //  MyRoutes.helpRoute:(context) => HelpPage(),
      },
    );
  }
}