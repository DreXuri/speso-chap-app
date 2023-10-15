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
import 'register_viewmodel.dart';
import 'package:stacked/stacked_annotations.dart';
import 'register_view.form.dart';

@FormView(fields: [
  FormTextField(name: 'email'),
  FormTextField(name: 'password'),
  FormTextField(name: 're-enter password'),
])
class RegisterView extends StackedView<RegisterViewModel> with $RegisterView {
  const RegisterView({Key? key}) : super(key: key);
  static final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();

  @override
  Widget builder(
    BuildContext context,
    RegisterViewModel viewModel,
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
            key: _registerFormKey,
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
                    S.current.sign_up,
                    style: typography?.headlineBold28
                        ?.copyWith(color: palette?.gray11),
                  ),
                ),
                verticalSpaceTiny,
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    S.current.please_register_to_speso,
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
                verticalSpaceSmall,
                TextFormField(
                  controller: reEnterPasswordController,
                  focusNode: reEnterPasswordFocusNode,
                  obscureText: viewModel.hidePassword,
                  validator: Validation.validateField,
                  decoration: InputDecoration(
                    labelText: S.current.retype_password,
                    hintText: S.current.retype_your_password,
                    suffixIcon: IconButton(
                      onPressed: viewModel.togglVisibility,
                      icon: Icon(
                        viewModel.hidePassword
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
                          text: S.current.login,
                          style: typography?.titleBold16?.copyWith(
                            color: palette?.primary6,
                            fontSize: 14.sp,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = viewModel.actionRouteToLoginView),
                    ],
                  ),
                ),
                verticalSpaceLarge,
                PrimaryButton(
                  buttonText: S.current.sign_up,
                  onTap: () {
                    if (passwordController.text !=
                        reEnterPasswordController.text) {
                      viewModel.showSnackBar(context, 'password do not match',
                          isError: true);
                    }
                    if (_registerFormKey.currentState?.validate() ?? false) {
                      viewModel.navigateToHomeScreen(
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
  void onViewModelReady(RegisterViewModel viewModel) {
    syncFormWithViewModel(viewModel);
  }

  @override
  void onDispose(RegisterViewModel viewModel) {
    disposeForm();
    super.onDispose(viewModel);
  }

  @override
  RegisterViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      RegisterViewModel();
}
