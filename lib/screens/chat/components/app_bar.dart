import 'package:banco_do_tempo_app/core/models/user_model.dart';
import 'package:banco_do_tempo_app/resources/fotos/FotosPerfil.dart';
import 'package:banco_do_tempo_app/screens/core/loading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../blocs/chat/chat_bloc.dart';
import '../../core/app_bars/app_bar_action.dart';
import '../../core/colors.dart';
import '../../core/profile_image.dart';
import '../../core/buttons/return_button.dart';
import 'exchange_dialog.dart';
import 'profile_description.dart';
import 'report_dialog.dart';

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  final ChatBloc chatBloc;

  ChatAppBar({this.chatBloc});

  UserModel _foto(DocumentSnapshot snapshot) {
    return UserModel(
      foto: snapshot["foto"],
    );
  }

  Stream<UserModel> get _fotos {
    return FirebaseFirestore.instance
        .collection("users")
        .doc(chatBloc.exchangeModel.userPostId)
        .snapshots()
        .map(_foto);
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UserModel>(
        stream: _fotos,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final foto = snapshot.data;
            return AppBar(
              elevation: 0,
              automaticallyImplyLeading: false,
              backgroundColor: chatAppBarColor,
              flexibleSpace: SafeArea(
                child: Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ReturnButton(),
                              SizedBox(
                                width: 2,
                              ),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(PageRouteBuilder(
                                        barrierDismissible: true,
                                        opaque: false,
                                        pageBuilder: (_, __, ___) =>
                                            FullscreenImage(foto: foto.foto)));
                                  },
                                  child: ProfileImage(
                                      radius: 20, image: foto.foto)),
                              SizedBox(
                                width: 12,
                              ),
                              ChatProfileDescription(
                                  nome: chatBloc.exchangeModel.userConsumerId ==
                                          chatBloc.user.uid
                                      ? chatBloc.exchangeModel.userPostName
                                      : chatBloc.exchangeModel.userConsumerName,
                                  descricao:
                                      chatBloc.exchangeModel.productName),
                              SizedBox(
                                width: 12,
                              ),
                            ]),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            AppBarAction(
                                onPressEvent: () {
                                  buildReportDialog(context, chatBloc);
                                },
                                icon: Icons.warning),
                            SizedBox(
                              width: 5,
                            ),
                            chatBloc.exchangeModel.userPostId ==
                                    chatBloc.user.uid
                                ? AppBarAction(
                                    onPressEvent: () {
                                      buildExchangeDialog(context, chatBloc);
                                    },
                                    icon: Icons.multiple_stop_sharp)
                                : Container()
                          ],
                        )
                      ]),
                ),
              ),
            );
          }
          return Loading();
        });
  }
}
