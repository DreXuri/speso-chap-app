import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'user_list_item_model.dart';

class UserListItem extends StackedView<UserListItemModel> {
  const UserListItem({super.key});

  @override
  Widget builder(
    BuildContext context,
    UserListItemModel viewModel,
    Widget? child,
  ) {
    return const SizedBox.shrink();
  }

  @override
  UserListItemModel viewModelBuilder(
    BuildContext context,
  ) =>
      UserListItemModel();
}
