import 'package:flutter/material.dart';
import 'package:banco_do_tempo_app/screens/services/components/item_card.dart';

class Cards extends StatefulWidget {
  @override
  _CardState createState() => _CardState();
}

class _CardState extends State<Cards> {
  final List<Map<String, dynamic>> _mockupPosts = [
    {
      'hour': 'Prato Italiano',
      'service': 'cozinha italiana',
      'amount': '5',
      'imgUrl': 'https://img.icons8.com/ios/452/service.png',
    },
    {
      'hour': 'Prato Italiano',
      'service': 'cozinha italiana',
      'amount': '5',
      'imgUrl': 'https://img.icons8.com/ios/452/service.png',
    },
    {
      'hour': 'Prato Italiano',
      'service': 'cozinha italiana',
      'amount': '5',
      'imgUrl': 'https://img.icons8.com/ios/452/service.png',
    },
    {
      'hour': 'Prato Italiano',
      'service': 'cozinha italiana',
      'amount': '5',
      'imgUrl': 'https://img.icons8.com/ios/452/service.png',
    },
    {
      'hour': 'Prato Italiano',
      'service': 'cozinha italiana',
      'amount': '5',
      'imgUrl': 'https://img.icons8.com/ios/452/service.png',
    },
    {
      'hour': 'Prato Italiano',
      'service': 'cozinha italiana',
      'amount': '5',
      'imgUrl': 'https://img.icons8.com/ios/452/service.png',
    },
    {
      'hour': 'Prato Italiano',
      'service': 'cozinha italiana',
      'amount': '5',
      'imgUrl': 'https://img.icons8.com/ios/452/service.png',
    },
    {
      'hour': 'Prato Italiano',
      'service': 'cozinha italiana',
      'amount': '5',
      'imgUrl': 'https://img.icons8.com/ios/452/service.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 20.0, mainAxisSpacing: 20.0),
      itemCount: (_mockupPosts.length <= 20) ? _mockupPosts.length : 20,
      itemBuilder: (BuildContext context, int index) {
        return ItemCard(
            hour: _mockupPosts[index]["hour"],
            service: _mockupPosts[index]["service"],
            amount: _mockupPosts[index]["amount"],
            imgUrl: _mockupPosts[index]["imgUrl"]);
      },
    );
  }
}
