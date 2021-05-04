import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/chat/chat_bloc.dart';
import '../../core/models/exchange_model.dart';
import '../../core/models/user_model.dart';
import '../core/loading.dart';
import '../core/ui.dart';
import 'components/app_bar.dart';
import 'components/input_area.dart';
import 'components/message_list.dart';

class Chat extends StatelessWidget {
  final User user;
  final UserModel userModel;

  const Chat({Key key, @required this.user, @required this.userModel})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ExchangeModel exchangesModel =
        ModalRoute.of(context).settings.arguments;
    return BlocProvider(
      create: (context) => ChatBloc(
          user: user, exchangeModel: exchangesModel, userModel: userModel)
        ..add(ChatStartedEvent()),
      child: ChatPage(),
    );
  }
}

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final ScrollController listScrollController = ScrollController();
  ChatBloc chatBloc;

  @override
  void dispose() {
    chatBloc.close();
    listScrollController.dispose();
    super.dispose();
  }

  void initState() {
    super.initState();
    listScrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (listScrollController.offset >=
            listScrollController.position.minScrollExtent &&
        !listScrollController.position.outOfRange) {
      chatBloc.add(GetMoreMessagesEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    chatBloc = BlocProvider.of<ChatBloc>(context);
    return Scaffold(
      appBar: ChatAppBar(chatBloc: chatBloc),
      body: BlocListener<ChatBloc, ChatState>(
        listener: (contextListener, state) {
          if (state is WarningState) {
            buildSnackBarUi(context, state.message);
          }
        },
        child: BlocBuilder<ChatBloc, ChatState>(builder: (context, state) {
          if (state is LoadingState) {
            return Loading();
          } else {
            return Column(
              children: [
                Expanded(
                    child: ChatMessageList(
                  listScrollController: listScrollController,
                  listMessages: chatBloc.chatList,
                  userId: chatBloc.user.uid,
                  chatBloc: chatBloc,
                )),
                ChatInputArea(
                  chatBloc: chatBloc,
                )
              ],
            );
          }
        }),
      ),
    );
  }
}
