import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spesco_app/ui/common/ui_helpers.dart';
import 'package:spesco_app/ui/extension/app_typography.dart';
import 'package:spesco_app/ui/extension/palette.dart';
import 'package:spesco_app/ui/views/messages/widget/chat_list_item.dart';
import 'package:stacked/stacked.dart';

import 'messages_viewmodel.dart';

class MessagesView extends StackedView<MessagesViewModel> {
  const MessagesView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    MessagesViewModel viewModel,
    Widget? child,
  ) {
    final ThemeData theme = Theme.of(context);
    final AppTypography? typography = theme.extension<AppTypography>();
    final Palette? palette = theme.extension<Palette>();
    return Scaffold(
      // backgroundColor: kBackground,
      // appBar: AppBar(
      //   title: Text(
      //     'Messages',
      //     style: typography?.titleBold16?.copyWith(
      //       color: palette?.primary6,
      //       fontSize: 14.sp,
      //     ),
      //   ),
      //   backgroundColor: kcBackgroundColor,
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 16.0.h, right: 16.0.h, bottom: 16.0.h),
          child: Column(
            children: [
              verticalSpaceSmall,
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: viewModel.chatHeaders().length,
                itemBuilder: (context, index) {
                  return ChatListItem(
                    chatHeader: viewModel.chatHeaders()[index],
                  ); 
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  MessagesViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      MessagesViewModel();
}
