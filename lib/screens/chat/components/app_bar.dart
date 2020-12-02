import 'package:banco_do_tempo_app/screens/core/profile_image.dart';
import 'package:flutter/material.dart';

import '../../../blocs/chat/chat_bloc.dart';
import '../../core/colors.dart';
import '../../core/return_button.dart';
import 'app_bar_action.dart';
import 'profile_description.dart';

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  final ChatBloc chatBloc;
  final String nome;
  final String descricao;

  ChatAppBar({this.chatBloc, this.nome, this.descricao});

  @override
  Size get preferredSize => const Size.fromHeight(70);

  void onCloseEvent() {
    chatBloc.close();
  }

  void onReportEvent() {
    chatBloc.add(ExchangeEvent());
  }

  void onExchangeEvent() {
    chatBloc.add(ReportEvent());
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: chatAppBarColor,
      flexibleSpace: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      ReturnButton(
                        onPressEvent: onCloseEvent,
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      ProfileImage(
                          image:
                              "https://i.pinimg.com/originals/fa/34/07/fa3407bbfc876fd7e1019238c5b6984f.jpg"),
                      SizedBox(
                        width: 12,
                      ),
                      ChatProfileDescription(
                        nome: nome,
                        descricao: descricao,
                      ),
                      SizedBox(
                        width: 12,
                      ),
                    ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    ChatAppBarAction(
                        onPressEvent: onReportEvent, icon: Icons.warning),
                    SizedBox(
                      width: 5,
                    ),
                    ChatAppBarAction(
                        onPressEvent: onExchangeEvent,
                        icon: Icons.multiple_stop_sharp)
                  ],
                )
              ]),
        ),
      ),
    );
  }
}
