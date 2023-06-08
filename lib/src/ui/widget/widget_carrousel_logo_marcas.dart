import 'package:flutter/material.dart';
import 'package:untitled/src/ui/widget/widget_logo_circular.dart';

class CarouselLogoMarcas extends StatelessWidget {
  const CarouselLogoMarcas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.only(top: 30, bottom: 20),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            LogoCircular(image: 'assets/images/pngwing.com.png'),
            LogoCircular(image: 'assets/images/pngwing.com (1).png'),
            LogoCircular(image: 'assets/images/pngwing.com (2).png'),
            LogoCircular(image: 'assets/images/pngwing.com (3).png'),
            LogoCircular(image: 'assets/images/pngwing.com (4).png'),
            LogoCircular(image: 'assets/images/pngwing.com (5).png'),
            LogoCircular(image: 'assets/images/pngwing.com (6).png'),
            LogoCircular(image: 'assets/images/pngwing.com (7).png'),
            LogoCircular(image: 'assets/images/pngwing.com (8).png'),
          ],
        ),
      ),
    );
  }
}
