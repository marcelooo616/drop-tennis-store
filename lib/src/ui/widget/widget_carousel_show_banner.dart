import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:untitled/src/ui/widget/widget_carouse_image.dart';

class CarouselShowBanner extends StatelessWidget {

  double carouselOptionsWidth;
  double carouselOptionsheith;


  CarouselShowBanner({ required this.carouselOptionsWidth, required this.carouselOptionsheith});

  final List<dynamic> items = [
    "assets/images/banner.gif",
    "assets/images/banner(1).gif",
    "assets/images/banner(2).gif",
  ];


  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(top: 30, bottom: 30),
      child: CarouselSlider(
          items: items
              .map<Widget>((element) => CardCarouselImage(
            titulo: element,
          )).toList(),
          options: CarouselOptions(
            height: carouselOptionsheith,
            viewportFraction: carouselOptionsWidth,
            aspectRatio: 2.0,
            enlargeCenterPage: true,
            enableInfiniteScroll: true,
            initialPage: 2,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 10),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            onPageChanged: (index, reason) {
              // Ação a ser executada quando a página é alterada
            },
            scrollDirection: Axis.horizontal,
          )),
    );
  }
}
