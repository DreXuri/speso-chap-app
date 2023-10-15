import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'toggle_auth_model.dart';

class ToggleAuth extends StackedView<ToggleAuthModel> {
  const ToggleAuth({super.key});

  @override
  Widget builder(
    BuildContext context,
    ToggleAuthModel viewModel,
    Widget? child,
  ) {
    return SizedBox.shrink();
  }

  @override
  ToggleAuthModel viewModelBuilder(
    BuildContext context,
  ) =>
      ToggleAuthModel();
}
