import 'package:cloud_firestore/cloud_firestore.dart';

class ProdutoModel {
  String userPostId;
  String userPostName;
  String productId;
  String productName;
  String productDescritpion;
  int productQuantity;
  double custoHoras;
  int status;
  String data;
  List<String> images;

  ProdutoModel(
      {this.userPostId,
      this.userPostName,
      this.data,
      this.productQuantity,
      this.productId,
      this.productName,
      this.productDescritpion,
      this.status,
      this.images,
      this.custoHoras});

  ProdutoModel.fromSnapshot(QueryDocumentSnapshot documentSnapshot) {
    Map<String, dynamic> data = documentSnapshot.data();
    productId = documentSnapshot.id;
    userPostId = data['user_post'] != null ? data['user_post'] : '';
    userPostName = data['user_name_post'] != null ? data['user_name_post'] : '';
    productQuantity = data['quantidade'] != null ? data['quantidade'] : '';
    productDescritpion = data['descricao'] != null ? data['descricao'] : '';
    data = data['data'] != null ? data['data'] : '';
    productName = data['nome'] != null ? data['nome'] : '';
    status = data['status'] != null ? data['status'] : 0;
    custoHoras = data['valor_em_horas'] != null ? data['valor_em_horas'] : 0;
    images =
        data['valor_em_horas'] != null ? List<String>.from(data['imagem']) : [];
  }
}
