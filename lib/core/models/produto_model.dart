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
      Map<String, dynamic> info, QueryDocumentSnapshot doc) {
    productId = info['productId'] != null ? info['productId'] : '';
    userPostId = info['user_post'] != null ? info['user_post'] : '';
    userPostName = info['user_name_post'] != null ? info['user_name_post'] : '';
    productQuantity =
        info['quantidade'] != null ? info['quantidade'].toString() : 0;
    productDescritpion = info['descricao'] != null ? info['descricao'] : '';
    data = info['data'] != null ? info['data'] : '';
    productName = info['nome'] != null ? info['nome'] : '';
    status = info['status'] != null ? info['status'] : 0;
    custoHoras =
        info['valor_em_horas'] != null ? info['valor_em_horas'].toDouble() : 0;
    images =
        info['valor_em_horas'] != null ? List<String>.from(info['imagem']) : [];
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
