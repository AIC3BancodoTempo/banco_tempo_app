import 'package:banco_do_tempo_app/core/models/produto_model.dart';
import 'package:banco_do_tempo_app/screens/pending_posts/components.dart/pending_item_card.dart';
import 'package:flutter/material.dart';

class PendingCard extends StatelessWidget {
  const PendingCard({
    Key key,
    @required this.mockupPosts,
    this.scrollController,
  }) : super(key: key);

  final List<ProdutoModel> mockupPosts;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        controller: scrollController,
        itemCount: mockupPosts.length,
        itemBuilder: (BuildContext context, int index) {
          return PendingItemCard(product: mockupPosts[index]);
        });
  }
}
