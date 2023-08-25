// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:sign_in/pages/home_page.dart';

import '../routes.dart';

class SignupPage extends StatefulWidget {
  final void Function()? onPressed;
  const SignupPage({
    Key? key,
    this.onPressed,
  }) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  createUserWithEmailAndPassword() async {
    try {
      setState(() {
        isLoading = true;
      });
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _email.text,
        password: _password.text,
      );
      Navigator.pushReplacementNamed(context, MyRoutes.loginRoute);
      setState(() {
        isLoading = false;
      });
    } on FirebaseAuthException catch (e) {
      setState(() {
        isLoading = false;
      });
      if (e.code == 'weak-password') {
        return ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("weak-password")));
      } else if (e.code == 'email-already-in-use') {
        return ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("email-already-in-use")));
      }
    } catch (e) {
       setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(
      // title: Text("Sign In"),
     
        ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,

            child: Column(
              children: [
                Image.asset(
                  "assets/images/signup.png",
                  fit: BoxFit.fitHeight,
                  scale: 2.5,
                ),
                OverflowBar(
                  overflowSpacing: 20,
                  children: [
                    TextFormField(
                      controller: _email,
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Email is Empty';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(hintText: "Email"),
                    ),
                    TextFormField(
                      controller: _password,
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Email is Empty';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(hintText: "Password"),
                    ),
                    // SizedBox(
                    //   height: 0.0,
                    // ),
                    // SizedBox(
                    //   width: double.infinity,
                    //   height: 45,
                    //   child: ElevatedButton(
                    //     onPressed: () {
                    //       if (_formKey.currentState!.validate()) {
                    //         // signInWithEmailAndPassword();
                    //       }
                    //       Navigator.pushNamed(context, MyRoutes.homeRoute);
                    //     },
                    //     child: isLoading
                    //         ? Center(
                    //             child: CircularProgressIndicator(
                    //             color: Colors.white,
                    //           ))
                    //         : const Text("Login"),
                    //   ),
                    // ),
                    SizedBox(
                      width: double.infinity,
                      height: 45,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            createUserWithEmailAndPassword();
                          }
                        },
                        child: const Text("Signup"),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
