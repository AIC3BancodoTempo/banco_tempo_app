import 'package:flutter/material.dart';

import '../core/appBar.dart';
import '../core/main_button.dart';
import 'components/advertiser_description.dart';
import 'components/carousel_image.dart';
import 'components/chips.dart';
import 'components/description_under_title.dart';
import 'components/main_description_title.dart';
import 'components/title_in_description.dart';
import 'components/vertical_horizontal_space.dart';

class MyDescriptionPage extends StatefulWidget {
  MyDescriptionPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyDescriptionPageState createState() => _MyDescriptionPageState();
}

class _MyDescriptionPageState extends State<MyDescriptionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar('Serviços/Habilidades'),
      body: ListView(
        children: <Widget>[
          image_carousel(
              'https://images.unsplash.com/photo-1535585209827-a15fcdbc4c2d?ixid=MXwxMjA3fDB8MHxzZWFyY2h8Mnx8aGFpciUyMHByb2R1Y3R8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&w=1000&q=80',
              'https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimg1.cookinglight.timeinc.net%2Fsites%2Fdefault%2Ffiles%2Fstyles%2F4_3_horizontal_-_1200x900%2Fpublic%2F1542062283%2Fchocolate-and-cream-layer-cake-1812-cover.jpg%3Fitok%3DR_xDiShk'),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(25),
              child: Column(
                children: <Widget>[
                  title(),
                  spaceVertical(20),
                  description_title(),
                  description(),
                  spaceVertical(20),
                  chips(),
                  spaceVertical(20),
                  anunciante(),
                  spaceVertical(20),
                  mainButton("TENHO INTERESSE", Icons.chat),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
