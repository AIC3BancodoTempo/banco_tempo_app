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
  QueryDocumentSnapshot documentSnapshot;
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
      this.custoHoras,
      this.documentSnapshot});

  ProdutoModel copyWith({
    String userPostId,
    String userPostName,
    String productId,
    String productName,
    String productDescritpion,
    int productQuantity,
    double custoHoras,
    int status,
    String data,
    List<String> images,
  }) {
    return ProdutoModel(
        userPostId: userPostId ?? this.userPostId,
        userPostName: userPostName ?? this.userPostName,
        productId: productId ?? this.productId,
        productName: productName ?? this.productName,
        productDescritpion: productDescritpion ?? this.productDescritpion,
        productQuantity: productQuantity ?? this.productQuantity,
        custoHoras: custoHoras ?? this.custoHoras,
        status: status ?? this.status,
        data: data ?? this.data,
        images: images ?? this.images);
  }

  ProdutoModel.fromSnapshot(
      Map<String, dynamic> data, QueryDocumentSnapshot doc) {
    Map<String, dynamic> data = documentSnapshot.data();
    productId = documentSnapshot.id;
    userPostId = data['user_post'] != null ? data['user_post'] : '';
    userPostName = data['user_name_post'] != null ? data['user_name_post'] : '';
    productQuantity =
        data['quantidade'] != null ? data['quantidade'].toString() : 0;
    productDescritpion = data['descricao'] != null ? data['descricao'] : '';
    data = data['data'] != null ? data['data'] : '';
    productName = data['nome'] != null ? data['nome'] : '';
    status = data['status'] != null ? data['status'] : 0;
    custoHoras =
        data['valor_em_horas'] != null ? data['valor_em_horas'].toDouble() : 0;
    images =
        data['valor_em_horas'] != null ? List<String>.from(data['imagem']) : [];
  }

  factory ProdutoModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ProdutoModel(
        userPostId: map['userPostId'],
        userPostName: map['userPostName'],
        productId: map['productId'],
        productName: map['productName'],
        productDescritpion: map['productDescritpion'],
        productQuantity: map['productQuantity'],
        custoHoras: map['custoHoras'],
        status: map['status'],
        data: map['data'],
        images: map['images']);
  }
}
