import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;

import '../../repositories/tokens/firestore_tokens.dart';

class MessagingRepository {
  FirebaseMessaging _messaging;
  MessagingRepository() {
    this._messaging = FirebaseMessaging.instance;
  }
  final TokenRepository _tokenRepository = TokenRepository();

  Future<String> getToken() async {
    return await _messaging.getToken();
  }

  Future<bool> setToken(String user, bool setNotification) async {
    if (setNotification) {
      String token = await getToken();

      if (token != null) {
        bool success = await _tokenRepository.setToken(user, token);
        if (success) {
          return true;
        }
      }
    } else {
      await _tokenRepository.setToken(user, '-');
    }
    return setNotification;
  }

  Future<bool> tokenState(String user) async {
    String token = await getToken();

    if (token != null) {
      String tokenUser = await _tokenRepository.getToken(user);
      if (token == tokenUser) {
        return true;
      } else if (tokenUser == '-') {
        return true;
      }
    }
    return false;
  }

  void sendMessage(String token, String from, String content) async {
    final String serverToken =
        'AAAA4r-Cshg:APA91bF9koGxBr7LRiNnJEm0QIQ-CLxbOM6gY2Ciexe3B7DTT0_-Ba7KkG1s2__VrzzA6qdGtB1oCqhNLvC8RU-l1jjWfszZhMdel74ytmKBhbSidPR17HkHG2SA3SDFgxvs11XsTd6_';
    http.Response response = await http.post(
      Uri.parse('https://fcm.googleapis.com/fcm/send'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'key=$serverToken',
      },
      body: jsonEncode(
        <String, dynamic>{
          'notification': <String, dynamic>{'body': from, 'title': content},
          'priority': 'high',
          'data': <String, dynamic>{
            'click_action': 'FLUTTER_NOTIFICATION_CLICK',
            'id': '1',
            'status': 'done'
          },
          'to': token,
        },
      ),
    );
  }
}
