import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageCarousel extends StatelessWidget {
  final List<String> imageList;

  const ImageCarousel({Key key, @required this.imageList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: CarouselSlider(
        options: CarouselOptions(
            height: 250, autoPlay: true, enlargeCenterPage: true),
        items: imageList.map((i) {
          return Builder(builder: (BuildContext context) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                i,
                fit: BoxFit.fitHeight,
                filterQuality: FilterQuality.high,
              ),
            );
          });
        }).toList(),
      ),
    );
  }
}
