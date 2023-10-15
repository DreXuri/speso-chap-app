import 'package:cloud_firestore/cloud_firestore.dart';

class ChatModel {
  final String message;
  final Timestamp time;
  final String userId;
  final String readerId;
  final String senderEmail;
  final bool isSent;
  final bool isReceived;

  const ChatModel({
    required this.message,
    required this.time,
    required this.userId,
    required this.readerId,
    required this.senderEmail,
    required this.isSent,
    required this.isReceived,
  });

  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'time': time,
      'userId': userId,
      'readerId': 'readerId',
      'isSent': 'isSent',
      'isReceived': 'isReceived'
    };
  }
}
