import 'package:flutter/material.dart';

import '../../core/models/service_model.dart';
import '../../core/models/exchange_model.dart';

void navigateToChatScreen(BuildContext context, ExchangeModel exchangeModel) {
  Navigator.of(context).pushNamed('/chat', arguments: exchangeModel);
}

void navigateToServiceDescriptionScreen(
    BuildContext context, ServiceModel serviceModel) {
  Navigator.of(context)
      .pushNamed('/serviceDescription', arguments: serviceModel);
}

void navigateToProfileScreen(BuildContext context) {
  Navigator.of(context).pushNamed('/profile');
}

void navigateToSkillHabilit(BuildContext context) {
  Navigator.of(context).pushNamed('/addService');
}

void navigateToCurrentExchanges(BuildContext context) {
  Navigator.of(context).pushNamed('/exchangeInProgress');
}

void navigateToMyPosts(BuildContext context) {
  Navigator.of(context).pushNamed('/myPosts');
}

void navigateToPendingPosts(BuildContext context) {
  Navigator.of(context).pushNamed('/pendingPosts');
}

void navigateToUsersPage(BuildContext context) {
  Navigator.of(context).pushNamed('/tela_usuarios');
}

void navigateToLogHours(BuildContext context) {
  Navigator.of(context).pushNamed(
    '/log_horas',
  );
}
