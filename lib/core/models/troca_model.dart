import 'package:cloud_firestore/cloud_firestore.dart';

class TrocaModel {
  String key;
  String userPostId;
  String userPostName;
  String userConsumerId;
  String userConsumerName;
  String productId;
  String productName;
  int status;
  int amount;
  double cost;
  String salaId;

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
      this.cost,
      this.salaId});

  TrocaModel.fromSnapshot(QueryDocumentSnapshot documentSnapshot) {
    Map<String, dynamic> data = documentSnapshot.data();
    key = documentSnapshot.id;
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
    cost = data['cost'] != null ? data['cost'].toDouble() : 0;
    salaId = data['salaId'] != null ? data['salaId'] : '';
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
      'cost': cost,
      'salaId': salaId,
    };
  }
}
