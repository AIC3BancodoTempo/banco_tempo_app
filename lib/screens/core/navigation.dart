import 'package:flutter/material.dart';

import '../../core/models/troca_model.dart';

void navigateToChatScreen(BuildContext context, TrocaModel trocaModel) {
  Navigator.of(context).pushNamed('/chat', arguments: trocaModel);
}

void navigateToExchangeDetailsScreen(BuildContext context) {
  Navigator.of(context).pushNamed('/descricaoHabilidades');
}
