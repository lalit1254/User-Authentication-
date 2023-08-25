import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sign_in/pages/login_page.dart';

import '../routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello"),
        actions: [
          IconButton(
              onPressed: () {
                     Navigator.pushReplacementNamed(context, MyRoutes.loginRoute);

              },
              icon: Icon(Icons.logout))
        ],
      ),
    );
  }
}
