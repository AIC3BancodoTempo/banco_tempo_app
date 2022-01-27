import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class ServiceModel {
  String userPostId;
  String typeProduct;
  bool isEvent;
  String idEvent;
  String userPostName;
  String productId;
  String productName;
  String productDescription;
  int productQuantity;
  double custoHoras;
  int status;
  bool isSearch;
  String data;
  List<String> images;
  DocumentSnapshot documentSnapshot;
  ServiceModel(
      {this.userPostId,
      this.typeProduct,
      this.isEvent = false,
      this.idEvent,
      this.userPostName,
      this.data,
      this.productQuantity,
      this.productId,
      this.productName,
      this.productDescription,
      this.status,
      this.images,
      this.isSearch = false,
      this.custoHoras,
      this.documentSnapshot});

  ServiceModel copyWith({
    String userPostId,
    String typeProduct,
    String idEvent,
    String userPostName,
    String productId,
    String productName,
    String productDescription,
    int productQuantity,
    double custoHoras,
    int status,
    String data,
    List<String> images,
  }) {
    return ServiceModel(
        userPostId: userPostId ?? this.userPostId,
        typeProduct: typeProduct ?? this.typeProduct,
        isEvent: isEvent ?? this.isEvent,
        idEvent: idEvent ?? this.idEvent,
        userPostName: userPostName ?? this.userPostName,
        productId: productId ?? this.productId,
        productName: productName ?? this.productName,
        productDescription: productDescription ?? this.productDescription,
        productQuantity: productQuantity ?? this.productQuantity,
        custoHoras: custoHoras ?? this.custoHoras,
        status: status ?? this.status,
        data: data ?? this.data,
        isSearch: isSearch ?? this.isSearch,
        images: images ?? this.images);
  }

  ServiceModel.fromSnapshot(Map<String, dynamic> info, DocumentSnapshot doc) {
    productId = doc.id;
    documentSnapshot = doc;
    userPostId = info['userPostId'] != null ? info['userPostId'] : '';
    typeProduct = info['typeProduct'] != null ? info['typeProduct'] : '';
    isEvent = info['isEvent'] != null ? info['isEvent'] : false;
    idEvent = info['idEvent'] != null ? info['idEvent'] : '';
    userPostName = info['userPostName'] != null ? info['userPostName'] : '';
    productQuantity =
        info['productQuantity'] != null ? info['productQuantity'] : 0;
    productDescription =
        info['productDescription'] != null ? info['productDescription'] : '';
    data = info['data'] != null
        ? DateFormat('dd/MM/yyyy kk:mm')
            .format(DateTime.fromMillisecondsSinceEpoch(info['data']))
        : '';
    productName = info['productName'] != null ? info['productName'] : '';
    status = info['status'] != null ? info['status'] : 0;
    isSearch = info['isSearch'] != null ? info['isSearch'] : false;
    custoHoras = info['custoHoras'] != null ? info['custoHoras'].toDouble() : 0;
    images = info['imagens'] != null ? List<String>.from(info['imagens']) : [];
  }

  factory ServiceModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ServiceModel(
        userPostId: map['userPostId'],
        typeProduct: map['typeProduct'],
        isEvent: map['isEvent'],
        idEvent: map['idEvent'],
        userPostName: map['userPostName'],
        productId: map['productId'],
        productName: map['productName'],
        productDescription: map['productDescription'],
        productQuantity: map['productQuantity'],
        custoHoras: map['custoHoras'],
        status: map['status'],
        data: map['data'],
        isSearch: map['isSearch'],
        images: map['imagens']);
  }
  Map<String, dynamic> toMap() {
    return {
      'typeProduct': typeProduct,
      'isEvent': isEvent,
      'idEvent': idEvent,
      'custoHoras': custoHoras,
      'data': DateTime.now().millisecondsSinceEpoch,
      'imagens': images,
      'productDescription': productDescription,
      'productName': productName,
      'productQuantity': productQuantity,
      'status': status,
      'userPostId': userPostId,
      'userPostName': userPostName,
      'isSearch': isSearch,
    };
  }
}
