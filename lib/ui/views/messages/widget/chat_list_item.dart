import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spesco_app/ui/common/app_colors.dart';
import 'package:spesco_app/ui/common/ui_helpers.dart';
import 'package:spesco_app/ui/model/chat_header_model.dart';
import 'package:spesco_app/ui/utilities/string_utils.dart';

class ChatListItem extends StatelessWidget {
  final ChatHeaderModel chatHeader;
  const ChatListItem({Key? key, required this.chatHeader}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.of(context).pushNamed(Chats.route, arguments: chatHeader);
      },
      child: Padding(
        padding: EdgeInsets.only(top: 8.0.h),
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0.h)),
          elevation: 4.0.h,
          child: Padding(
            padding: EdgeInsets.all(12.0.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 16.0.h),
                  child: CircleAvatar(
                    radius: 20.0.r,
                    backgroundColor: kWhite,
                    child: ClipOval(
                      child: Image.asset(
                        chatHeader.user.image,
                        width: 72.0.w,
                        height: 72.0.h,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalSpaceSmall,
                      Text(
                        chatHeader.user.name,
                        textAlign: TextAlign.start,
                      ),
                      verticalSpaceSmall,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 4.0),
                            child: Icon(Icons.check),
                            // child: SvgPicture.asset(Assets.checksIcon),
                          ),
                          Text(
                            chatHeader.message,
                            textAlign: TextAlign.start,
                            maxLines: 1,
                            overflow: TextOverflow.fade,
                          ),
                        ],
                      ),
                      verticalSpaceSmall,
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    verticalSpaceSmall,
                    Text(
                      getTime(),
                      textAlign: TextAlign.start,
                    ),
                    verticalSpaceSmall,
                    if (chatHeader.numberOfMessages > 1)
                      Container(
                        width: 20.w,
                        height: 20.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24.r),
                          color: kcPrimaryColor,
                        ),
                        child: Text(
                          chatHeader.numberOfMessages.toString(),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    verticalSpaceSmall,
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  
  
  }
}
