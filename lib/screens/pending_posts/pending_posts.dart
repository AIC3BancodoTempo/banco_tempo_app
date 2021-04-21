import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/pending_posts/pending_post_bloc.dart';
import '../core/loading.dart';
import 'components.dart/pending_item_card.dart';

class PendingPost extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PendingPostBloc()..add(PendingPostStartedEvent()),
      child: PendingPostPage(),
    );
  }
}

class PendingPostPage extends StatefulWidget {
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
    pendingPostBloc = BlocProvider.of<PendingPostBloc>(context);
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
      body: BlocBuilder<PendingPostBloc, PendingPostState>(
          builder: (context, state) {
        if (state is LoadingPendingPostState) {
          return Loading();
        } else {
          return ListView.builder(
              controller: controller,
              itemCount: pendingPostBloc.habilityList.length,
              itemBuilder: (BuildContext context, int index) {
                return PendingItemCard(
                  product: pendingPostBloc.habilityList[index],
                  acceptPressed: (value) {
                    pendingPostBloc.add(AcceptPendingPostEvent(docId: value));
                  },
                  rejectPressed: (value) {
                    pendingPostBloc.add(RejectPendingPostEvent(docId: value));
                  },
                );
              });
        }
      }),
    );
  }
}
