import 'package:banco_do_tempo_app/core/models/produto_model.dart';
import 'package:flutter/material.dart';

import 'item_card.dart';

class Cards extends StatelessWidget {
  final List<ProdutoModel> mockupPosts;

  const Cards({Key key, this.mockupPosts}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 10.0, mainAxisSpacing: 10.0),
      itemCount: (mockupPosts.length <= 20) ? mockupPosts.length : 20,
      itemBuilder: (BuildContext context, int index) {
        return ItemCard(product: mockupPosts[index]);
      },
    );
  }
}
