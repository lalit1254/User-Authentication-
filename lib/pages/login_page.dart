// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sign_in/pages/home_page.dart';
//import 'package:sign_in/pages/home_page.dart';

import '../routes.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onPressed;
  const LoginPage({
    Key? key,
    this.onPressed,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  signInWithEmailAndPassword() async {
    try {
      setState(() {
        isLoading = true;
      });
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _email.text,
        password: _password.text,
      );
      Navigator.pushReplacementNamed(context, MyRoutes.homeRoute);
      setState(() {
        isLoading = true;
      });
    } on FirebaseAuthException catch (e) {
      setState(() {
        isLoading = false;
      });
      if (e.code == 'user-not-found') { 
        return ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("User not found")));
      } else if (e.code == 'wrong-password') {
        // return Navigator.pushNamed(context, MyRoutes.homeRoute);
        return ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Wrong Password")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   //   appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
        
            child: Column(
              
              children: [
                Image.asset(
                  "assets/images/login1.png",
                  fit: BoxFit.fitHeight,
                  scale: 2,
                ),
                SizedBox(
                  height: 36.0,
                ),
                // Text(
                //   "Welcome ",
                //   style: TextStyle(
                //     fontSize: 28,
                    
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
             
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
                    SizedBox(
                      width: double.infinity,
                      height: 45,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                           
             // onPrimary: Colors.white,
              shadowColor: Colors.greenAccent,
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100)),
              minimumSize: Size(110, 100),
            
                          ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            signInWithEmailAndPassword();
                             // Navigator.pushNamed(context, MyRoutes.homeRoute);
                            
                          }
                        },
                        child: isLoading
                            ? Center(
                                child: CircularProgressIndicator(
                                color: Colors.white,
                              ))
                            : const Text("Login"),
                            
                      ),
                    ),
                 
                      SizedBox(
                        width: double.infinity,
                        height: 45,
                      
                                      
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                             alignment: Alignment.center,
                                 // onPrimary: Colors.white,
                                  shadowColor: Colors.greenAccent,
                                  elevation: 2,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(100)),
                                  minimumSize: Size(110, 100),
                                
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, MyRoutes.signupRoute);
                            },
                            child: const Text("Signup"),
                          ),
                        
                      ),
                    
                    //  Material(
                    //     color: Colors.deepPurple,
                    //    borderRadius:
                    //        BorderRadius.circular( 15 ),
                    //     child: InkWell(
                    //       // hoverColor: Colors.green,
                    //       splashColor: Colors.green,

                       
                  
                    //        onTap: () {
                    //          Navigator.pushNamed(context, MyRoutes.signupRoute);
                    //        },
                    //       // onTap: () => moveToHome(context),

                    //       child: AnimatedContainer(
                    //         duration: Duration(milliseconds: 100),
                    //         width:  100,
                    //         height: 50,
                    //         alignment: Alignment.center,
                    //         // color: Colors.deepPurple,

                    //         child: Text(
                    //                 "SignIn",
                    //                 style: TextStyle(
                    //                     color: Colors.white,
                    //                     // fontWeight: FontWeight.bold,
                    //                     fontSize: 18),
                    //               ),
                    //       ),
                    //     ),
                    //   )
                  ],
                ),
              ],
            ),
          ),
        ),
      
    );
  }
}
