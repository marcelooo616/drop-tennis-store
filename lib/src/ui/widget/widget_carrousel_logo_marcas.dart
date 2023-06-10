import 'package:flutter/material.dart';
import 'package:untitled/src/ui/widget/widget_logo_circular.dart';

class CarouselLogoMarcas extends StatelessWidget {
  double? sizeOrientationBuilder;


  CarouselLogoMarcas({this.sizeOrientationBuilder});

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.only(top: 30, bottom: 20),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            LogoCircular(image: 'assets/images/pngwing.com.png', sizeOrientationBuilder: sizeOrientationBuilder),
            LogoCircular(image: 'assets/images/pngwing.com (1).png', sizeOrientationBuilder: sizeOrientationBuilder),
            LogoCircular(image: 'assets/images/pngwing.com (2).png', sizeOrientationBuilder: sizeOrientationBuilder),
            LogoCircular(image: 'assets/images/pngwing.com (3).png', sizeOrientationBuilder: sizeOrientationBuilder),
            LogoCircular(image: 'assets/images/pngwing.com (4).png', sizeOrientationBuilder: sizeOrientationBuilder),
            LogoCircular(image: 'assets/images/pngwing.com (5).png', sizeOrientationBuilder: sizeOrientationBuilder),
            LogoCircular(image: 'assets/images/pngwing.com (6).png', sizeOrientationBuilder: sizeOrientationBuilder),
            LogoCircular(image: 'assets/images/pngwing.com (7).png', sizeOrientationBuilder: sizeOrientationBuilder),
            LogoCircular(image: 'assets/images/pngwing.com (8).png', sizeOrientationBuilder: sizeOrientationBuilder),
          ],
        ),
      ),
    );
  }
}
