import '../core/my_post_card.dart';
import 'package:flutter/material.dart';

class PendingPosts extends StatelessWidget {
  final List<Map<String, dynamic>> _mockupPosts = [
    {
      'title': 'Sofia Oliveira',
      'subtitle': 'Ensino de Programação',
      'imageUrl':
          'https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
      'amount': 1,
      'timeAmount': 1
    },
    {
      'title': 'Marta Kawasaki',
      'subtitle': 'Ensino de piano',
      'imageUrl':
          'https://images.pexels.com/photos/1382731/pexels-photo-1382731.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
      'amount': 2,
      'timeAmount': 4,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Divulgações pendentes"),
        centerTitle: true,
        actions: [IconButton(icon: Icon(Icons.search), onPressed: () {})],
      ),
      body: ListView.builder(
          itemCount: _mockupPosts.length,
          itemBuilder: (BuildContext context, int index) {
            return PostCard(
              title: _mockupPosts[index]["title"],
              subtitle: _mockupPosts[index]["subtitle"],
              imageUrl: _mockupPosts[index]["imageUrl"],
              amount: _mockupPosts[index]["amount"],
              timeAmount: _mockupPosts[index]["timeAmount"],
              renderActionButtons: true,
            );
          }),
    );
  }
}