import 'dart:async';

import 'package:banco_do_tempo_app/resources/chat/firestore_chat.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'chat_model.dart';

class TrocaModel {
  String key;
  String userPostId;
  String userPostName;
  String userConsumerId;
  String userConsumerName;
  String productId;
  String productName;
  String timestamp;
  int status;
  int amount;
  String salaId;
  ChatModel mensagem;
  DocumentSnapshot doc;
  StreamSubscription subscription;
  TrocaModel(
      {this.key,
      this.userPostId,
      this.userPostName,
      this.userConsumerId,
      this.userConsumerName,
      this.productId,
      this.productName,
      this.status,
      this.amount,
      this.salaId});

  TrocaModel.fromSnapshot(DocumentSnapshot documentSnapshot) {
    Map<String, dynamic> data = documentSnapshot.data();
    key = documentSnapshot.id;
    doc = documentSnapshot;
    userPostId = data['userPostId'] != null ? data['userPostId'] : '';
    userPostName = data['userPostName'] != null ? data['userPostName'] : '';
    userConsumerId =
        data['userConsumerId'] != null ? data['userConsumerId'] : '';
    userConsumerName =
        data['userConsumerName'] != null ? data['userConsumerName'] : '';
    productId = data['productId'] != null ? data['productId'] : '';
    productName = data['productName'] != null ? data['productName'] : '';
    status = data['status'] != null ? data['status'] : 0;
    amount = data['amount'] != null ? data['amount'] : 0;
    salaId = data['salaId'] != null ? data['salaId'] : '';
    timestamp = data['timestamp'] != null ? data['timestamp'] : '';
  }

  Map<String, dynamic> toMap() {
    return {
      'userPostId': userPostId,
      'userPostName': userPostName,
      'userConsumerId': userConsumerId,
      'userConsumerName': userConsumerName,
      'productId': productId,
      'productName': productName,
      'status': status,
      'amount': amount,
      'salaId': salaId,
      'timestamp': DateTime.now().millisecondsSinceEpoch.toString()
    };
  }

  Future<void> subscribe() async {
    final ChatRepository _chatRepository = ChatRepository();
    Stream<QuerySnapshot> messages =
        await _chatRepository.receiveOneMessage(salaId);
    subscription = messages.listen((event) {
      event.docs.forEach((element) {
        Map<String, dynamic> data = element.data();
        mensagem = ChatModel.fromSnapshot(data, element);
      });
    });
  }

  close() {
    if (subscription != null) subscription.cancel();
  }
}
