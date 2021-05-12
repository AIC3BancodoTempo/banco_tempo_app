import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../blocs/my_posts/my_posts_bloc.dart';
import '../core/colors.dart';
import '../core/loading.dart';
import 'components/my_post_card.dart';

class MyPosts extends StatelessWidget {
  final User user;

  const MyPosts({Key key, this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyPostsBloc(user: user)..add(MyPostsStartedEvent()),
      child: MyPostsPage(),
    );
  }
}

class MyPostsPage extends StatefulWidget {
  @override
  _MyPostsPageState createState() => _MyPostsPageState();
}

class _MyPostsPageState extends State<MyPostsPage> {
  MyPostsBloc myPostsBloc;
  final ScrollController controller = ScrollController();

  @override
  void dispose() {
    controller.dispose();
    myPostsBloc.close();
    super.dispose();
  }

  void initState() {
    super.initState();
    controller.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (controller.offset >= controller.position.maxScrollExtent &&
        !controller.position.outOfRange) {
      myPostsBloc.add(GetMorePostsEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    myPostsBloc = BlocProvider.of<MyPostsBloc>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text("Meus Cadastros"),
        centerTitle: true,
      ),
      body: BlocBuilder<MyPostsBloc, MyPostsState>(builder: (context, state) {
        if (state is LoadingMyPostsState) {
          return Loading();
        } else {
          return ListView.builder(
              controller: controller,
              itemCount: myPostsBloc.postsList.length,
              itemBuilder: (BuildContext context, int index) {
                return Slidable(
                  actionPane: SlidableDrawerActionPane(),
                  actionExtentRatio: 0.25,
                  child: PostCard(
                    product: myPostsBloc.postsList[index],
                  ),
                  actions: [
                    IconSlideAction(
                        caption: 'Apagar',
                        color: themeColor,
                        icon: Icons.delete,
                        onTap: () {
                          myPostsBloc.add(RemoveMyPostsEvent(
                              index: index,
                              key: myPostsBloc
                                  .getProductList()[index]
                                  .productId));
                        }),
                  ],
                );
              });
        }
      }),
    );
  }
}
