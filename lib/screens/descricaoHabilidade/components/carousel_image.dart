import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

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
