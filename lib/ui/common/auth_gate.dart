import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:spesco_app/ui/views/auth_toggle_pages/auth_toggle_pages_view.dart';
import 'package:spesco_app/ui/views/home/home_view.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            // login user
            if (snapshot.hasData) {
              return HomeView();
            }
            // user not logedin÷
            else {
              return AuthTogglePagesView();
            }
          }),
    );
  }
}
