import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:spesco_app/ui/views/home/home_view.dart';
import 'package:spesco_app/ui/views/login/login_view.dart';
import 'package:stacked/stacked.dart';

import 'auth_gate_model.dart';

class AuthGate extends StackedView<AuthGateModel> {
  const AuthGate({super.key});

  @override
  Widget builder(
    BuildContext context,
    AuthGateModel viewModel,
    Widget? child,
  ) {
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
              return LoginView();
            }
          }),
    );
  }

  @override
  AuthGateModel viewModelBuilder(
    BuildContext context,
  ) =>
      AuthGateModel();
}
