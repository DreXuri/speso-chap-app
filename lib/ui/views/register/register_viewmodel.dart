import 'package:flutter/material.dart';
import 'package:spesco_app/app/app.locator.dart';
import 'package:spesco_app/app/app.router.dart';
import 'package:spesco_app/services/auth_guard_service.dart';
import 'package:spesco_app/ui/widgets/custom_snackbar.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class RegisterViewModel extends FormViewModel {
  final _navigationService = locator<NavigationService>();
  final _apiService = locator<AuthGuardService>();

  bool hideText = true;
  bool hidePassword = true;

  void toggleVisibility() {
    hideText = !hideText;
    rebuildUi();
  }

  void togglVisibility() {
    hidePassword = !hidePassword;
    rebuildUi();
  }

  void showSnackBar(BuildContext context, String content,
      {bool isError = false}) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        showCustomSnackBar(context, content, isError: isError);
      },
    );
  }

  void navigateToHomeScreen(emailController, passwordController) async {
    try {
      await _apiService.register(emailController, passwordController);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void actionRouteToLoginView() {
    _navigationService.replaceWithLoginView();
  }
}
