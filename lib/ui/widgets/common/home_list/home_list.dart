import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'home_list_model.dart';

class HomeList extends StackedView<HomeListModel> {
  const HomeList({super.key});

  @override
  Widget builder(
    BuildContext context,
    HomeListModel viewModel,
    Widget? child,
  ) {
    return const SizedBox.shrink();
  }

  @override
  HomeListModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeListModel();
}
