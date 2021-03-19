import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class ChatModel {
  String key;
  String fromId;
  int type;
  String content;
  String url;
  bool visualizado;
  String timestamp;
  QueryDocumentSnapshot documentSnapshot;
  ChatModel({
    this.key,
    this.fromId,
    this.type,
    this.content,
    this.url,
    this.visualizado = false,
    this.timestamp,
    this.documentSnapshot,
  });

  ChatModel copyWith({
    String key,
    String fromId,
    int type,
    String content,
    String url,
    bool visualizado,
    String timestamp,
  }) {
    return ChatModel(
      key: key ?? this.key,
      fromId: fromId ?? this.fromId,
      type: type ?? this.type,
      content: content ?? this.content,
      url: url ?? this.url,
      visualizado: visualizado ?? this.visualizado,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'fromId': fromId,
      'type': type,
      'content': content,
      'url': url,
      'visualizado': visualizado,
      'timestamp': timestamp,
    };
  }

  ChatModel.fromSnapshot(Map<String, dynamic> data, QueryDocumentSnapshot doc) {
    key = doc.id;
    documentSnapshot = doc;
    fromId = data['fromId'] != null ? data['fromId'] : '';
    type = data['type'] != null ? data['type'] : '';
    content = data['content'] != null ? data['content'] : '';
    url = data['url'] != null ? data['url'] : '';
    visualizado = data['visualizado'] != null ? data['visualizado'] : '';
    timestamp = data['timestamp'] != null ? data['timestamp'] : '';
  }

  factory ChatModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ChatModel(
      key: map['key'],
      fromId: map['fromId'],
      type: map['type'],
      content: map['content'],
      url: map['url'],
      visualizado: map['visualizado'],
      timestamp: map['timestamp'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatModel.fromJson(String source) =>
      ChatModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Chat(key: $key, fromId: $fromId, type: $type, content: $content, url: $url, visualizado: $visualizado, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ChatModel &&
        o.key == key &&
        o.fromId == fromId &&
        o.type == type &&
        o.content == content &&
        o.url == url &&
        o.visualizado == visualizado &&
        o.timestamp == timestamp;
  }

  @override
  int get hashCode {
    return key.hashCode ^
        fromId.hashCode ^
        type.hashCode ^
        content.hashCode ^
        url.hashCode ^
        visualizado.hashCode ^
        timestamp.hashCode;
  }
}
