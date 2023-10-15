import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spesco_app/generated/l10n.dart';
import 'package:spesco_app/ui/common/app_images.dart';
import 'package:spesco_app/ui/common/ui_helpers.dart';
import 'package:spesco_app/ui/extension/app_typography.dart';
import 'package:spesco_app/ui/extension/palette.dart';
import 'package:spesco_app/ui/utilities/validation.dart';
import 'package:spesco_app/ui/widgets/common/primary_button/primary_button.dart';
import 'package:stacked/stacked.dart';
import 'login_viewmodel.dart';
import 'package:stacked/stacked_annotations.dart';
import 'login_view.form.dart';

@FormView(fields: [
  FormTextField(name: 'email'),
  FormTextField(name: 'password'),
])
class LoginView extends StackedView<LoginViewModel> with $LoginView {
  const LoginView({Key? key}) : super(key: key);
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget builder(
    BuildContext context,
    LoginViewModel viewModel,
    Widget? child,
  ) {
    final ThemeData theme = Theme.of(context);
    final AppTypography? typography = theme.extension<AppTypography>();
    final Palette? palette = theme.extension<Palette>();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: sidePadding,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                verticalSpaceLarge,
                Image.asset(
                  AppImages.logo,
                  height: 72.h,
                ),
                verticalSpaceLarge,
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    S.current.welcome,
                    style: typography?.headlineBold28
                        ?.copyWith(color: palette?.gray11),
                  ),
                ),
                verticalSpaceTiny,
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    S.current.please_sign_in_to_speso_app,
                    style: typography?.titleRegular16
                        ?.copyWith(color: palette?.gray8),
                  ),
                ),
                verticalSpaceTiny,
                TextFormField(
                  controller: emailController,
                  focusNode: emailFocusNode,
                  autofillHints: const [AutofillHints.email],
                  keyboardType: TextInputType.emailAddress,
                  validator: Validation.validateEmail,
                  textCapitalization: TextCapitalization.none,
                  decoration: InputDecoration(
                    labelText: S.current.email,
                    hintText: S.current.enter_your_email,
                  ),
                ),
                verticalSpaceSmall,
                TextFormField(
                  controller: passwordController,
                  focusNode: passwordFocusNode,
                  obscureText: viewModel.hideText,
                  validator: Validation.validateField,
                  decoration: InputDecoration(
                    labelText: S.current.password,
                    hintText: S.current.enter_your_password,
                    suffixIcon: IconButton(
                      onPressed: viewModel.toggleVisibility,
                      icon: Icon(
                        viewModel.hideText
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: palette?.primary6,
                      ),
                    ),
                  ),
                ),
                verticalSpaceMedium,
                Text.rich(
                  TextSpan(
                    text: S.current.dont_have_an_account,
                    style: typography?.titleRegular16?.copyWith(
                      color: palette?.gray8,
                      fontSize: 14.sp,
                    ),
                    children: [
                      const TextSpan(text: " "),
                      TextSpan(
                          text: S.current.sign_up,
                          style: typography?.titleBold16?.copyWith(
                            color: palette?.primary6,
                            fontSize: 14.sp,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = viewModel.actionRouteToSignUpView),
                    ],
                  ),
                ),
                verticalSpaceLarge,
                PrimaryButton(
                  buttonText: S.current.login,
                  onTap: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      viewModel.navigateToChatScreen(
                          emailController.text, passwordController.text);
                    }
                  },
                ),
                verticalSpaceSmall,
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void onViewModelReady(LoginViewModel viewModel) {
    syncFormWithViewModel(viewModel);
  }

  @override
  void onDispose(LoginViewModel viewModel) {
    disposeForm();
    super.onDispose(viewModel);
  }

  @override
  LoginViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoginViewModel();
}
