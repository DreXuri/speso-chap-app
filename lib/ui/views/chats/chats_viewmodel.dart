import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spesco_app/services/chat_servic_service.dart';
import 'package:spesco_app/ui/model/chat_model.dart';
import 'package:stacked/stacked.dart';

class ChatsViewModel extends FormViewModel {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final ChatServicService chatService = ChatServicService();
  void sendChat(String readerId, String message) async {
    await chatService.sendMessage(readerId, message);
  }

  List<ChatModel> chats = [];
  Future<void> pickFile() async {
    chats.add(
      ChatModel(
        message: '',
        time: Timestamp.now(),
        isSent: false,
        isReceived: false,
        userId: '',
        readerId: '',
        senderEmail: '',
      ),
    );
  }
}
