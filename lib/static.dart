import 'package:flutter/material.dart';

const Color primaryColor = Colors.blue;
const Color subPrimaryColor = Color.fromARGB(255, 227, 228, 228);
const Color scaffoldBackgroundColor = Colors.white;
const Color secondaryHeaderColor = Color.fromARGB(255, 20, 20, 20);



class CommonMediaQuery {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double blockSizeHorizontal;
  static late double blockSizeVertical;

  static void initialize(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
  }
}