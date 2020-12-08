import 'package:banco_do_tempo_app/screens/my_posts/core/PostCard.dart';
import 'package:flutter/material.dart';

class MyPosts extends StatefulWidget {
  @override
  _MyPostsState createState() => _MyPostsState();
}

class _MyPostsState extends State<MyPosts> {
  final List<Map<String, dynamic>> _mockupPosts = [
    {
      'title': 'Prato Italiano',
      'subtitle': 'cozinha italiana',
      'imageUrl':
          'https://www.nicepng.com/png/detail/54-546030_food-top-view-png-jpg-black-and-white.png',
      'amount': 5,
      'timeAmount': 2
    },
    {
      'title': 'Aulas de guitarra',
      'subtitle': 'Instrumentos musicais',
      'imageUrl':
          'https://www.uberchord.com/wp-content/uploads/2017/03/guitar-1855798_1920.jpg',
      'amount': 3,
      'timeAmount': 8,
    },
    {
      'title': 'Aulas de programação',
      'subtitle': 'Tecnologia',
      'imageUrl':
          'https://ourcodeworld.com/public-media/articles/articleocw-5d07e6b3790af.jpg',
      'amount': 2,
      'timeAmount': 2
    },
    {
      'title': 'Aulas de fotografia',
      'subtitle': 'Fotografia',
      'imageUrl':
          'https://cdn.mos.cms.futurecdn.net/gvQ9NhQP8wbbM32jXy4V3j.jpg',
      'amount': 2,
      'timeAmount': 1
    },
    {
      'title': 'Lorem Ipsum',
      'subtitle': 'Lorem ipsum dolor sid',
      'imageUrl':
          'https://s2.glbimg.com/j3GJOR4Kwytj67-zCy7xJDEr6fA=/0x0:695x521/695x521/s.glbimg.com/po/tt2/f/original/2014/04/11/bliss.jpg',
      'amount': 2,
      'timeAmount': 2
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meus Cadastros"),
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
              renderActionButtons: false,
            );
          }),
    );
  }
}
