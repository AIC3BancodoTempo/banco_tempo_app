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

  @override
  Size get preferredSize => const Size.fromHeight(70);

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
              ReturnButton(),
              SizedBox(
                width: 2,
              ),
              ProfileImage(radius: 20, image: "assets/images/profile.png"),
              SizedBox(
                width: 12,
              ),
              ChatProfileDescription(
                  nome:
                      chatBloc.exchangeModel.userConsumerId == chatBloc.user.uid
                          ? chatBloc.exchangeModel.userPostName
                          : chatBloc.exchangeModel.userConsumerName,
                  descricao: chatBloc.exchangeModel.productName),
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
                chatBloc.exchangeModel.userPostId == chatBloc.user.uid
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
}
