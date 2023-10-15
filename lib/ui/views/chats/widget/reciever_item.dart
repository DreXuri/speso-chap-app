import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spesco_app/ui/common/app_colors.dart';
import 'package:spesco_app/ui/common/app_images.dart';
import 'package:spesco_app/ui/model/chat_model.dart';

class ReceiverItem extends StatelessWidget {
  final ChatModel chatModel;
  const ReceiverItem({Key? key, required this.chatModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16, top: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
              color: kcRecShade,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    chatModel.message,
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    chatModel.time.toString(),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 16.0.h),
            child: CircleAvatar(
              radius: 16.0.r,
              backgroundColor: kWhite,
              child: ClipOval(
                child: Image.asset(
                  AppImages.logo,
                  width: 72.0.w,
                  height: 72.0.h,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
