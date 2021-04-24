import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

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
    productId = doc.id;
    documentSnapshot = doc;
    userPostId = info['userPostId'] != null ? info['userPostId'] : '';
    userPostName = info['userPostName'] != null ? info['userPostName'] : '';
    productQuantity =
        info['productQuantity'] != null ? info['productQuantity'] : 0;
    productDescritpion =
        info['productDescription'] != null ? info['productDescription'] : '';
    data = info['data'] != null
        ? DateFormat('dd/MM/yyyy kk:mm')
            .format(DateTime.fromMillisecondsSinceEpoch(info['data']))
        : '';
    productName = info['productName'] != null ? info['productName'] : '';
    status = info['status'] != null ? info['status'] : 0;
    custoHoras = info['custoHoras'] != null ? info['custoHoras'].toDouble() : 0;
    images = info['imagens'] != null ? List<String>.from(info['imagens']) : [];
  }

  factory ProdutoModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ProdutoModel(
        userPostId: map['userPostId'],
        userPostName: map['userPostName'],
        productId: map['productId'],
        productName: map['productName'],
        productDescritpion: map['productDescription'],
        productQuantity: map['productQuantity'],
        custoHoras: map['custoHoras'],
        status: map['status'],
        data: map['data'],
        images: map['images']);
  }
}
