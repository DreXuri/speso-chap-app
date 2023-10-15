import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spesco_app/ui/model/chat_model.dart';

class ChatServicService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

////send chats
  Future<void> sendMessage(String readerId, String message) async {
    final String currentUserId = _firebaseAuth.currentUser!.uid;
    final String currentUserEmail = _firebaseAuth.currentUser!.email.toString();
    final Timestamp timestamp = Timestamp.now();

    ChatModel newMessage = ChatModel(
      message: message,
      time: timestamp,
      userId: currentUserId,
      readerId: readerId,
      senderEmail: currentUserEmail,
      isSent: true,
      isReceived: true,
    );

    List<String> ids = [currentUserId, readerId];
    ids.sort();
    String chatRoomID = ids.join(" _ ");

    await _fireStore
        .collection('chat_rooms')
        .doc(chatRoomID)
        .collection('messages')
        .add(newMessage.toMap());
  }

////get chats
  Stream<QuerySnapshot> getChats(String userId, String otherUserId) {
    List<String> ids = [userId, otherUserId];
    ids.sort();
    String chatRoomID = ids.join(" _ ");

    return _fireStore
        .collection('chat_rooms')
        .doc(chatRoomID)
        .collection('messages')
        .orderBy('timstamp', descending: false)
        .snapshots();
  }
}
