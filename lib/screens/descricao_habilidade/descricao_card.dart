import 'package:flutter/material.dart';

import '../core/main_button.dart';
import 'components/advertiser_description.dart';
import 'components/carousel_image.dart';
import 'components/chips.dart';
import 'components/fields.dart';
import 'components/main_description_title.dart';
import 'components/title_in_description.dart';

class AbilityDescriptionPage extends StatefulWidget {
  AbilityDescriptionPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyDescriptionPageState createState() => _MyDescriptionPageState();
}

class _MyDescriptionPageState extends State<AbilityDescriptionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {},
        ),
        centerTitle: true,
        backgroundColor: Color(0xFFA95EFA),
        title: Text(
          "Serviços/Habilidades",
        ),
      ),
      body: ListView(
        children: <Widget>[
          ImageCarousel(
            carouselImgs1:
                'https://images.unsplash.com/photo-1535585209827-a15fcdbc4c2d?ixid=MXwxMjA3fDB8MHxzZWFyY2h8Mnx8aGFpciUyMHByb2R1Y3R8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&w=1000&q=80',
            carouselImgs2:
                'https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimg1.cookinglight.timeinc.net%2Fsites%2Fdefault%2Ffiles%2Fstyles%2F4_3_horizontal_-_1200x900%2Fpublic%2F1542062283%2Fchocolate-and-cream-layer-cake-1812-cover.jpg%3Fitok%3DR_xDiShk',
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(25),
              child: Column(
                children: <Widget>[
                  MainTitle(),
                  spaceVertical(20),
                  DescriptionTitle(),
                  description(),
                  spaceVertical(20),
                  Chips(),
                  spaceVertical(20),
                  Anunciante(),
                  spaceVertical(20),
                  ButtonDescriptionAndAdd(
                    iconData: Icons.chat,
                    onpress: () {},
                    text: "TENHO INTERESSE",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
