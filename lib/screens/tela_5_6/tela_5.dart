import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Product page',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Montserrat'),
      home: MyHomePage(title: 'Flutter Product page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String selected = "blue";
  bool favourite = false;

  List<String> slist = [
    'https://images.unsplash.com/photo-1535585209827-a15fcdbc4c2d?ixid=MXwxMjA3fDB8MHxzZWFyY2h8Mnx8aGFpciUyMHByb2R1Y3R8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&w=1000&q=80',
    'https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimg1.cookinglight.timeinc.net%2Fsites%2Fdefault%2Ffiles%2Fstyles%2F4_3_horizontal_-_1200x900%2Fpublic%2F1542062283%2Fchocolate-and-cream-layer-cake-1812-cover.jpg%3Fitok%3DR_xDiShk'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFFA95EFA),
        title: Text(
          'Serviços/Habilidades',
        ),
      ),
      //The whole application area
      body: ListView(
        children: <Widget>[
          image_carousel(),
          //spaceVertical(10),
          //Center Items
          Expanded(
            child: sections(),
          ),
          //Bottom Button
        ],
      ),
    );
  }

  Widget image_carousel() {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: CarouselSlider(
        options: CarouselOptions(
            height: 290, autoPlay: true, enlargeCenterPage: true),
        items: slist.map((i) {
          return Builder(builder: (BuildContext context) {
            return Column(children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.network(i)),
            ]);
          });
        }).toList(),
      ),
    );
  }

  ///************ SECTIONS  *************************************************/
  Widget sections() {
    return Container(
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
          product_button_message(),
        ],
      ),
    );
  }

  Widget title() {
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            "Bolo + Hidratante",
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2F2F3E)),
          ),
          Text(
            "1 Hora",
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFFA95EFA),
            ),
          ),
        ],
      ),
    );
  }

  Widget description_title() {
    return Row(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Título do Texto",
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2F2F3E)),
          ),
        )
      ],
    );
  }

  Widget description() {
    return Text(
      "A style icon gets some love from one of today's top "
      "trendsetters. Pharrell Williams puts his creative spin on these "
      "shoes, which have all the clean, classicdetails of the beloved Stan Smith.",
      textAlign: TextAlign.justify,
      style: TextStyle(height: 1.5, color: Color(0xFF6F8398)),
    );
  }

  Widget chips() {
    return Wrap(
      spacing: 100.0,
      children: [
        new Chip(
          label: Text('1 Unidade'),
        ),
        new Chip(
          label: Text('1 Hora'),
        ),
      ],
    );
  }

  Widget anunciante() {
    return Row(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Anunciante: Joãozinho",
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2F2F3E)),
          ),
        )
      ],
    );
  }

  Widget product_button_message() {
    return ButtonTheme(
      height: 50,
      minWidth: 300,
      child: RaisedButton(
        color: Color(0xFFA95EFA),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Text(
          "TENHO INTERESSE",
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {},
      ),
    );
  }

  /***** End */

  ///************** BOTTOM BUTTON ********************************************/

  /***** End */

  ///************** UTILITY WIDGET ********************************************/
  Widget spaceVertical(double size) {
    return SizedBox(
      height: size,
    );
  }

  Widget spaceHorizontal(double size) {
    return SizedBox(
      width: size,
    );
  }
  /***** End */
}

class ColorTicker extends StatelessWidget {
  final Color color;
  final bool selected;
  final VoidCallback selectedCallback;
  ColorTicker({this.color, this.selected, this.selectedCallback});

  @override
  Widget build(BuildContext context) {
    print(selected);
    return GestureDetector(
        onTap: () {
          selectedCallback();
        },
        child: Container(
          padding: EdgeInsets.all(7),
          margin: EdgeInsets.all(5),
          width: 30,
          height: 30,
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: color.withOpacity(0.7)),
          child:
              selected ? Image.asset("assets/images/checker.png") : Container(),
        ));
  }
}
