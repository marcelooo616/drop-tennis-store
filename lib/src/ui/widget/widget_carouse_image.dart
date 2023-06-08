import 'package:flutter/material.dart';

class CardCarouselImage extends StatelessWidget {
  String? titulo;



  CardCarouselImage({this.titulo});

  @override
  Widget build(BuildContext context) {
    return  Card(
      color: const Color(0xFF85FFBD),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 4,
      child: Container(
        width: 500,
        height: 200,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(titulo!),fit: BoxFit.fill),
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
    );/* Container(
      width: 500,
      height: 200,
      decoration: BoxDecoration(
          color: AppColors.backgroundDark,
          border: Border.all(),
          borderRadius: BorderRadius.circular(5.5)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 20),
            child: Text(
              titulo!,
              style: TextStyle(
                color: AppColors.backgroundDarkGreen,
                fontWeight: FontWeight.w400,
                fontSize: 15,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                Icons.wb_incandescent,
                color: AppColors.backgroundDarkGreen,
              )
            ],
          )
        ],
      ),
    );*/


  }
}