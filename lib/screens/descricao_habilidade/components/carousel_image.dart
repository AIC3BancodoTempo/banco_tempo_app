import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageCarousel extends StatelessWidget {
  final String carouselImgs1;
  final String carouselImgs2;

  const ImageCarousel(
      {Key key, @required this.carouselImgs1, @required this.carouselImgs2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> slist = [carouselImgs1, carouselImgs2];
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
}
