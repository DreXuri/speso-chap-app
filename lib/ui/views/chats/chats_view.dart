import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spesco_app/generated/l10n.dart';
import 'package:spesco_app/ui/common/app_images.dart';
import 'package:spesco_app/ui/common/ui_helpers.dart';
import 'package:spesco_app/ui/extension/app_typography.dart';
import 'package:spesco_app/ui/common/app_colors.dart';

import 'package:spesco_app/ui/extension/palette.dart';
import 'package:spesco_app/ui/utilities/string_utils.dart';
import 'package:spesco_app/ui/views/chats/chats_view.form.dart';
import 'package:spesco_app/ui/views/chats/chats_viewmodel.dart';
import 'package:spesco_app/ui/views/chats/widget/message_box.dart';
import 'package:spesco_app/ui/views/messages/messages_view.dart';
import 'package:spesco_app/ui/views/messages/widget/chat_list_item.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

@FormView(fields: [
  FormTextField(name: 'message'),
])
class ChatsView extends StackedView<ChatsViewModel> with $ChatsView {
  final String userEmail;
  final String userId;

  const ChatsView({required this.userEmail, required this.userId, Key? key})
      : super(key: key);
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget builder(
    BuildContext context,
    ChatsViewModel viewModel,
    Widget? child,
  ) {
    final ThemeData theme = Theme.of(context);
    final AppTypography? typography = theme.extension<AppTypography>();
    final Palette? palette = theme.extension<Palette>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.current.chat,
          style: typography?.headlineBold28?.copyWith(color: kcPrimaryColor),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 25.0, right: 25.0),
              child: Text(
                userEmail,
                textAlign: TextAlign.left,
                style:
                    typography?.titleBold16?.copyWith(color: palette?.gray11),
              ),
            ),
            Expanded(
              child: StreamBuilder(
                stream: viewModel.chatService
                    .getChats(userId, viewModel.firebaseAuth.currentUser!.uid),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error ${snapshot.error}');
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text('Loading ');
                  }
                  // return   ListView.builder(
                  //   shrinkWrap: true,
                  //   physics: const NeverScrollableScrollPhysics(),
                  //   itemCount: viewModel.chatHeaders().length,
                  //   itemBuilder: (context, index) {
                  //     return ChatListItem(
                  //       chatHeader: viewModel.chatHeaders()[index],
                  //     );
                  //   },
                  // );
             return 
MessagesView();
             
                  // return ListView(
                  //   children: snapshot.data!.docs
                  //       .map(
                  //           (document) => buildChatMessage(document,
                  //            viewModel))
                  //       .toList(),
                  // );
            
            
                },
              ),
            ),
            MessageBox(
                messageController: messageController,
                onTap: () {
                  debugPrint(messageController.text);
                  // viewModel.sendChat(userId);
                  viewModel.sendChat(userId, messageController.text);
                }),
          ],
        ),
      ),
    );
  }

  Widget buildChatMessage(
      QueryDocumentSnapshot<Object?> document, ChatsViewModel viewModel) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
FirebaseAuth  firebaseAuth = FirebaseAuth.instance;
    var align = (data['senderId'] == firebaseAuth.currentUser!.uid)
    // var align = (data['senderId'] == viewModel.firebaseAuth.currentUser!.uid)
        ? Alignment.centerRight
        : Alignment.centerLeft;

    return Container(
      alignment: align,
      child: InkWell(
        onTap: () {
          // Navigator.of(context).pushNamed(Chats.route, arguments: chatHeader);
        },
        child: Column(
          children: [
            Text(
              data['message'],
              style: TextStyle(color: kcMediumGrey),
            ),
            Text(data['senderEmail']),
            Text(messageController.text,    style: TextStyle(color: kcMediumGrey),),
          ],
        ),
        // child: Padding(
        //   padding: EdgeInsets.only(top: 8.0.h),
        //   child: Card(
        //     shape: RoundedRectangleBorder(
        //         borderRadius: BorderRadius.circular(8.0.h)),
        //     elevation: 4.0.h,
        //     child: Padding(
        //       padding: EdgeInsets.all(12.0.h),
        //       child: Row(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           Container(
        //             margin: EdgeInsets.only(right: 16.0.h),
        //             child: CircleAvatar(
        //               radius: 20.0.r,
        //               backgroundColor: kWhite,
        //               child: ClipOval(
        //                 child: Image.asset(
        //                   AppImages.logo,
        //                   width: 72.0.w,
        //                   height: 72.0.h,
        //                   fit: BoxFit.fill,
        //                 ),
        //               ),
        //             ),
        //           ),
        //           Expanded(
        //             child: Column(
        //               crossAxisAlignment: CrossAxisAlignment.start,
        //               children: [
        //                 verticalSpaceSmall,
        //                 Text(
        //                   data['senderEmail'],
        //                   textAlign: TextAlign.start,
        //                 ),
        //                 verticalSpaceSmall,
        //                 Row(
        //                   crossAxisAlignment: CrossAxisAlignment.center,
        //                   children: [
        //                     Padding(
        //                       padding: const EdgeInsets.only(right: 4.0),
        //                       child: Icon(Icons.check),
        //                       // child: SvgPicture.asset(Assets.checksIcon),
        //                     ),
        //                     Text(
        //                       data['message'],
        //                       // chatHeader.message,
        //                       textAlign: TextAlign.start,
        //                       maxLines: 1,
        //                       overflow: TextOverflow.fade,
        //                     ),
        //                   ],
        //                 ),
        //                 verticalSpaceSmall,
        //               ],
        //             ),
        //           ),
        //           Column(
        //             crossAxisAlignment: CrossAxisAlignment.center,
        //             children: [
        //               verticalSpaceSmall,
        //               Text(
        //                 getTime(),
        //                 textAlign: TextAlign.start,
        //               ),
        //               verticalSpaceSmall,
        //               if (data['message'] > 1)
        //                 // chatHeader.numberOfMessages > 1)
        //                 Container(
        //                   width: 20.w,
        //                   height: 20.h,
        //                   alignment: Alignment.center,
        //                   decoration: BoxDecoration(
        //                     borderRadius: BorderRadius.circular(24.r),
        //                     color: kcPrimaryColor,
        //                   ),
        //                   child: Text(
        //                     data['message'],
        //                     // chatHeader.numberOfMessages.toString(),
        //                     textAlign: TextAlign.center,
        //                   ),
        //                 ),
        //               verticalSpaceSmall,
        //             ],
        //           ),

        //         ],
        //       ),
        //     ),
        //   ),
        // ),
      ),
    );
  }

  @override
  void onViewModelReady(ChatsViewModel viewModel) {
    syncFormWithViewModel(viewModel);
  }

  @override
  void onDispose(ChatsViewModel viewModel) {
    disposeForm();
    super.onDispose(viewModel);
  }

  @override
  ChatsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ChatsViewModel();
}
