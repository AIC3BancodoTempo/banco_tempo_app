import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/chat/chat_bloc.dart';
import '../core/loading.dart';
import 'components/app_bar.dart';
import 'components/input_area.dart';
import 'components/message_list.dart';

class Chat extends StatelessWidget {
  final User user;

  const Chat({Key key, @required this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatBloc(user: user)..add(ChatStartedEvent()),
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
  Widget build(BuildContext context) {
    chatBloc = BlocProvider.of<ChatBloc>(context);
    return Scaffold(
      appBar: ChatAppBar(chatBloc: chatBloc, descricao: 'Yoga', nome: 'Sofia'),
      body: BlocListener<ChatBloc, ChatState>(
        listener: (contextListener, state) {},
        child: BlocBuilder<ChatBloc, ChatState>(builder: (context, state) {
          if (state is LoadingState) {
            return Loading();
          } else {
            return Column(
              children: <Widget>[
                Expanded(
                    child: ChatMessageList(
                  listScrollController: listScrollController,
                  listMessages: chatBloc.chatList,
                  userId: chatBloc.user.uid,
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
