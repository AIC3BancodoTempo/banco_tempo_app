import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:image_picker/image_picker.dart';

Widget buildAppBar(insertText) {
  return AppBar(
    leading: IconButton(
      icon: Icon(Icons.arrow_back, color: Colors.white),
      onPressed: () {},
    ),
    centerTitle: true,
    backgroundColor: Color(0xFFA95EFA),
    title: Text(
      insertText,
    ),
  );
}

Widget image_carousel(carouselImgs1, carouselImgs2) {
  List<String> slist = [carouselImgs1, carouselImgs2];
  return Padding(
    padding: EdgeInsets.only(top: 20),
    child: CarouselSlider(
      options:
          CarouselOptions(height: 290, autoPlay: true, enlargeCenterPage: true),
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

Widget descriptionText(insertTitleHere) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Container(
      child: Padding(
        padding: EdgeInsets.all(25),
        child: Text(insertTitleHere,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontFamily: 'DMSans',
                fontStyle: FontStyle.normal,
                fontSize: 23)),
      ),
    ),
  );
}

Widget insertInputs(insertLabel) {
  final myFocusNode = new FocusNode();
  return Align(
    alignment: Alignment.center,
    child: Container(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(33.0, 10.0, 33.0, 2.0),
        child: TextFormField(
          decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                color: Colors.deepPurple,
              )),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                color: Colors.deepPurpleAccent,
              )),
              labelText: insertLabel,
              labelStyle: TextStyle(
                  color:
                      myFocusNode.hasFocus ? Colors.black38 : Colors.black45),
              hintText: 'Resposta',
              suffix: Icon(
                Icons.check,
                color: Colors.deepPurpleAccent,
                size: 15.0,
              )),
          validator: (value) {
            if (value.isEmpty) {
              return 'Você esqueceu de responder';
            }
            return null;
          },
        ),
      ),
    ),
  );
}

Widget photoInclude() {
  return Wrap(
    spacing: 100.0,
    children: <Widget>[
      new Text('Anexe uma Foto',
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontFamily: 'DM Sans',
              fontStyle: FontStyle.normal,
              fontSize: 16)),
      new FloatingActionButton(
          heroTag: "btn",
          backgroundColor: Color(0xFFBA7AFF),
          child: Icon(Icons.add),
          onPressed: () {}),
    ],
  );
}
