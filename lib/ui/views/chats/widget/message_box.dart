import 'package:flutter/material.dart';
import 'package:spesco_app/ui/common/app_colors.dart';
import 'package:spesco_app/ui/widgets/message_textfield.dart';

class MessageBox extends StatefulWidget {
  final VoidCallback onTap;
  final TextEditingController? messageController;
  const MessageBox({Key? key, required this.onTap, this.messageController})
      : super(key: key);

  @override
  MessageBoxState createState() => MessageBoxState();
}

class MessageBoxState extends State<MessageBox> {
  Color _sendIconColor = kcMediumGrey;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      color: kcRecShade,
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: widget.onTap,
            child: Icon(
              Icons.file_copy,
              color: kcPrimaryColor,
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: MessageTextField(
                    controller: widget.messageController,
                    hintText: 'Type a message',
                    hasLabel: false,
                    keyBoardType: TextInputType.multiline,
                    padding: const EdgeInsets.only(left: 16, right: 14),
                    verticalContentPadding: 0,
                    onChanged: (p0) {
                      if (p0.isEmpty) {
                        setState(() {
                          _sendIconColor = kcPrimaryColor;
                        });
                      } else if (p0.isNotEmpty) {
                        setState(() {
                          _sendIconColor = kcPrimaryColor;
                        });
                      }
                    },
                    suffixIcon: IconButton(
                      icon: Icon(
                        Icons.send,
                        color: kcPrimaryColor,
                      ),
                      onPressed: widget.onTap,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
