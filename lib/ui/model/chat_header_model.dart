import 'package:spesco_app/ui/model/user_model.dart';

class ChatHeaderModel {
  final User user;
  final String message;
  final String time;
  final int numberOfMessages;
  final bool isRead;

  const ChatHeaderModel({
    required this.user,
    required this.message,
    required this.time,
    required this.numberOfMessages,
    required this.isRead,
  });
}
