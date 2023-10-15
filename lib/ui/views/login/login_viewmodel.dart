import 'package:flutter/material.dart';
import 'package:spesco_app/app/app.locator.dart';
import 'package:spesco_app/app/app.router.dart';
import 'package:spesco_app/services/auth_guard_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends FormViewModel {
  final _navigationService = locator<NavigationService>();
  final _apiService = locator<AuthGuardService>();
  bool hideText = true;

  void toggleVisibility() {
    hideText = !hideText;
    rebuildUi();
  }

  void navigateToChatScreen(emailController, passwordController) async {
    try {
      await _apiService.signIn(emailController, passwordController);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void actionRouteToSignUpView() {
    _navigationService.replaceWithRegisterView();
  }
}
