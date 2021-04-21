import 'package:banco_do_tempo_app/blocs/auth/auth_bloc.dart';

import 'package:banco_do_tempo_app/blocs/pending_posts/pending_post_bloc.dart';
import 'package:banco_do_tempo_app/screens/core/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components.dart/pending_card.dart';

class PendingPost extends StatelessWidget {
  @override
  final AuthBloc authBloc;

  PendingPost({Key key, this.authBloc}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PendingPostBloc()..add(PendingPostStartedEvent()),
      child: PendingPostPage(authBloc: authBloc),
    );
  }
}

class PendingPostPage extends StatefulWidget {
  final AuthBloc authBloc;
  @override
  const PendingPostPage({Key key, this.authBloc}) : super(key: key);
  @override
  _PendingPostPageState createState() => _PendingPostPageState();
}

class _PendingPostPageState extends State<PendingPostPage> {
  PendingPostBloc pendingPostBloc;
  final ScrollController controller = ScrollController();

  @override
  void dispose() {
    controller.dispose();
    pendingPostBloc.close();
    super.dispose();
  }

  void initState() {
    super.initState();
    controller.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (controller.offset >= controller.position.maxScrollExtent &&
        !controller.position.outOfRange) {
      pendingPostBloc.add(GetMorePendingPostsEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Divulgações pendentes"),
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        centerTitle: true,
      ),
      body: BlocListener<PendingPostBloc, PendingPostState>(
        listener: (contextListener, state) {},
        child: BlocBuilder<PendingPostBloc, PendingPostState>(
            builder: (context, state) {
          if (state is LoadingPendingPostState) {
            return Loading();
          } else {
            return PendingCard(
              scrollController: controller,
              mockupPosts: pendingPostBloc.habilityList,
            );
          }
        }),
      ),
    );
  }
}
