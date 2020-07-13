import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class ImageCarousel extends StatelessWidget {

  final carousel = Carousel(
      boxFit: BoxFit.cover,
          images: [
            AssetImage('assets/sl1.jpg'),
            AssetImage('assets/sl2.jpg'),
            AssetImage('assets/sl3.jpg'),
            AssetImage('assets/sl4.jpg'),
            AssetImage('assets/sl5.jpg'),
          ],
          animationCurve: Curves.fastOutSlowIn,
          animationDuration: Duration(milliseconds: 2000),
  );
  final banner = Center( child: Container(
    width: double.infinity,
    decoration: BoxDecoration(      
      color: Colors.white60,
      //borderRadius: BorderRadius.all(radius)
      
    ),
    padding: EdgeInsets.all(18.0),
    child:Text("Your health is in your hand", textAlign: TextAlign.center, style: TextStyle(
      fontSize: 23.0,
      fontFamily: 'modak',
      
    ),),));
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Stack(
            children: <Widget>[
              carousel,
              banner,
            ],
          
        ),
      ),
    );
  }

}
