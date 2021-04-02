import 'package:flutter/material.dart';

import '../../../blocs/chat/chat_bloc.dart';
import '../../core/app_bars/app_bar_action.dart';
import '../../core/colors.dart';
import '../../core/profile_image.dart';
import '../../core/return_button.dart';
import 'exchange_dialog.dart';
import 'profile_description.dart';
import 'report_dialog.dart';

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  final ChatBloc chatBloc;

  ChatAppBar({this.chatBloc});

  @override
  Size get preferredSize => const Size.fromHeight(70);

  void onCloseEvent() {
    chatBloc.close();
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
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              ReturnButton(
                onPressEvent: onCloseEvent,
              ),
              SizedBox(
                width: 2,
              ),
              ProfileImage(
                  radius: 20,
                  image:
                      "https://i.pinimg.com/originals/fa/34/07/fa3407bbfc876fd7e1019238c5b6984f.jpg"),
              SizedBox(
                width: 12,
              ),
              ChatProfileDescription(
                  nome: chatBloc.trocaModel.userConsumerId == chatBloc.user.uid
                      ? chatBloc.trocaModel.userPostName
                      : chatBloc.trocaModel.userConsumerName,
                  descricao: chatBloc.trocaModel.productName),
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
                AppBarAction(
                    onPressEvent: () {
                      buildExchangeDialog(context, chatBloc);
                    },
                    icon: Icons.multiple_stop_sharp)
              ],
            )
          ]),
        ),
      ),
    );
  }
}
