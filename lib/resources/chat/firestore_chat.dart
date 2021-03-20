import 'package:cloud_firestore/cloud_firestore.dart';

import '../../core/models/chat_model.dart';

class ChatRepository {
  FirebaseFirestore firestoreInstance;

  ChatRepository() {
    this.firestoreInstance = FirebaseFirestore.instance;
  }

  void receivedCheck(String docMasterId, String docId) async {
    await firestoreInstance
        .collection('chat')
        .doc(docMasterId)
        .collection("mensagens")
        .doc(docId)
        .update({'visualizado': true});
  }

  void updateChat(String docMasterId, String docId, double starts) async {
    await firestoreInstance
        .collection('chat')
        .doc(docMasterId)
        .collection("mensagens")
        .doc(docId)
        .update({'visualizado': true, 'starts': starts});
  }

  void addChat(String docId, ChatModel chat) {
    firestoreInstance
        .collection('chat')
        .doc(docId)
        .collection("mensagens")
        .doc(DateTime.now().millisecondsSinceEpoch.toString())
        .set(chat.toMap());
  }

  Future<Stream<QuerySnapshot>> receiveMessages(String docId) async {
    Stream<QuerySnapshot> snapshot = firestoreInstance
        .collection('chat')
        .doc(docId)
        .collection("mensagens")
        .orderBy('timestamp', descending: true)
        .limit(20)
        .snapshots();
    return snapshot;
  }

  Future<Stream<QuerySnapshot>> receiveOneMessage(String docId) async {
    Stream<QuerySnapshot> snapshot = firestoreInstance
        .collection('chat')
        .doc(docId)
        .collection("mensagens")
        .orderBy('timestamp', descending: true)
        .limit(1)
        .snapshots();
    return snapshot;
  }

  Future<List<ChatModel>> getLastMessages(String docId) async {
    List<ChatModel> chatList = [];
    QuerySnapshot snapshot = await firestoreInstance
        .collection('chat')
        .doc(docId)
        .collection("mensagens")
        .orderBy('timestamp', descending: true)
        .limit(20)
        .get();
    if (snapshot.size > 0) {
      snapshot.docs.forEach((element) {
        Map<String, dynamic> data = element.data();
        chatList.add(ChatModel.fromSnapshot(data, element));
      });
    }
    return chatList;
  }

  Future<List<ChatModel>> getMoreMessages(
      String docId, DocumentSnapshot docRef) async {
    List<ChatModel> chatList = [];
    QuerySnapshot snapshot = await firestoreInstance
        .collection('chat')
        .doc(docId)
        .collection("mensagens")
        .startAfterDocument(docRef)
        .orderBy('timestamp', descending: true)
        .limit(20)
        .get();
    if (snapshot.size > 0) {
      snapshot.docs.forEach((element) {
        Map<String, dynamic> data = element.data();
        chatList.add(ChatModel.fromSnapshot(data, element));
      });
    }
    return chatList;
  }
}
