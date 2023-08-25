import 'package:flutter/material.dart';
import 'package:sign_in/pages/login_page.dart';
import 'package:sign_in/pages/signup_page.dart';

class Login_SignupPage extends StatefulWidget {
   
  const Login_SignupPage({super.key});
 

  @override
  State<Login_SignupPage> createState() => _Login_SignupPageState();
}

class _Login_SignupPageState extends State<Login_SignupPage> {
  bool islogin = false;

  void togglePage() {
    islogin = !islogin;
  }

  @override
  Widget build(BuildContext context) {
    if (islogin) {
      return LoginPage(
        onPressed: togglePage,
      );
    } else {
      return SignupPage(
        onPressed: togglePage,
      );
    }
  }
}
