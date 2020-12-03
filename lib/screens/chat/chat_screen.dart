import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/chat/chat_bloc.dart';
import '../core/loading.dart';
import 'components/app_bar.dart';
import 'components/input_area.dart';
import 'components/message_list.dart';

class Chat extends StatelessWidget {
  //Chat({});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatBloc()..add(ChatStartedEvent()),
      child: ChatPage(),
    );
  }
}

class ChatPage extends StatelessWidget {
  ChatBloc chatBloc;

  //ChatPage({});

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
          } else if (state is ShowMessageState) {
            return Column(
              children: <Widget>[
                Expanded(child: ChatMessageList()),
                ChatInputArea(
                  chatBloc: chatBloc,
                )
              ],
            );
          } else
            return Container();
        }),
      ),
    );
  }
}
