import 'package:flutter/material.dart';

import 'item_card.dart';

class Cards extends StatefulWidget {
  @override
  _CardState createState() => _CardState();
}

class _CardState extends State<Cards> {
  final List<Map<String, dynamic>> _mockupPosts = [
    {
      'title': 'Bolo de chocolate',
      'hour': '1',
      'amount': '5',
      'imgUrl':
          'https://conteudo.imguol.com.br/c/entretenimento/12/2020/07/08/bolo-piscina-de-chocolate-com-brigadeiro-1594218857273_v2_900x506.jpg.webp',
    },
    {
      'title': 'Bolo de chocolate',
      'hour': '1',
      'amount': '5',
      'imgUrl':
          'https://conteudo.imguol.com.br/c/entretenimento/12/2020/07/08/bolo-piscina-de-chocolate-com-brigadeiro-1594218857273_v2_900x506.jpg.webp',
    },
    {
      'title': 'Bolo de chocolate',
      'hour': '1',
      'amount': '5',
      'imgUrl':
          'https://conteudo.imguol.com.br/c/entretenimento/12/2020/07/08/bolo-piscina-de-chocolate-com-brigadeiro-1594218857273_v2_900x506.jpg.webp',
    },
    {
      'title': 'Bolo de chocolate',
      'hour': '1',
      'amount': '5',
      'imgUrl':
          'https://conteudo.imguol.com.br/c/entretenimento/12/2020/07/08/bolo-piscina-de-chocolate-com-brigadeiro-1594218857273_v2_900x506.jpg.webp',
    },
    {
      'title': 'Bolo de chocolate',
      'hour': '1',
      'amount': '5',
      'imgUrl':
          'https://conteudo.imguol.com.br/c/entretenimento/12/2020/07/08/bolo-piscina-de-chocolate-com-brigadeiro-1594218857273_v2_900x506.jpg.webp',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 10.0, mainAxisSpacing: 10.0),
      itemCount: (_mockupPosts.length <= 20) ? _mockupPosts.length : 20,
      itemBuilder: (BuildContext context, int index) {
        return ItemCard(
            title: _mockupPosts[index]["title"],
            hour: _mockupPosts[index]["hour"],
            amount: _mockupPosts[index]["amount"],
            imgUrl: _mockupPosts[index]["imgUrl"]);
      },
    );
  }
}
