import 'package:flutter/material.dart';

import '../../core/models/troca_model.dart';

void navigateToChatScreen(BuildContext context, TrocaModel trocaModel) {
  Navigator.of(context).pushNamed('/chat', arguments: trocaModel);
}

void navigateToExchangeDetailsScreen(BuildContext context) {
  Navigator.of(context).pushNamed('/descricaoHabilidades');
}

void navigateToProfileScreen(BuildContext context) {
  Navigator.of(context).pushNamed('/profile');
}

void navigateToSkillHabilit(BuildContext context) {
  Navigator.of(context).pushNamed('/cadastroHabilidades');
}

void navigateToCurrentExchanges(BuildContext context) {
  Navigator.of(context).pushNamed('/trocasAndamento');
}

void navigateToMyPosts(BuildContext context) {
  Navigator.of(context).pushNamed('/myPosts');
}

void navigateToPendingPosts(BuildContext context) {
  Navigator.of(context).pushNamed('/pendingPosts');
}
