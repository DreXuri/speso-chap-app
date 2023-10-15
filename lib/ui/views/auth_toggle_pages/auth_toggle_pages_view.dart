import 'package:flutter/material.dart';
import 'package:spesco_app/ui/views/login/login_view.dart';
import 'package:spesco_app/ui/views/register/register_view.dart';
import 'package:stacked/stacked.dart';

import 'auth_toggle_pages_viewmodel.dart';

class AuthTogglePagesView extends StackedView<AuthTogglePagesViewModel> {
  const AuthTogglePagesView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AuthTogglePagesViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: viewModel.isLogin ? LoginView() : RegisterView(),
    );
  }

  @override
  AuthTogglePagesViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AuthTogglePagesViewModel();
}
