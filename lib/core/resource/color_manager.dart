import 'package:flutter/material.dart';

abstract class AppColorManager {
  static const Color transparent = Colors.transparent;
  static const Color white = Colors.white;
  static const Color shadow = Color.fromARGB(28, 130, 130, 130);

  static const Color black = Colors.black;
  static const Color mainColor = Color(0xff21409A);
  static const Color subColor = Color(0xffF7941D);
  static const borderGrey = Color(0xFFEBEBEB);
  static const Color dotGrey = Color(0xffE5E5EA);
  static const Color textGrey = Color(0xffAEAFB2);
  static const Color grey = Color(0xff8e8e93);
  static const Color gold = Color(0xffB59410);
  static const Color textAppColor = Color(0xff171717);
  static const Color background = AppColorManager.white;
  static const Color shimmerHighlightColor = Color(0xffd9d9d9);
  static const Color shimmerBaseColor = Color(0xffe0e0e0);
  static Color redOpacity15 = const Color(0xffff3b30).withOpacity(0.15);
  static Color greenOpacity15 = const Color(0xff34c759).withOpacity(0.15);
  static  Color red = Colors.red.withOpacity(0.8);
  static Color lightGreyOpacity6 = const Color(0xffe5e5ea).withOpacity(0.6);
  static const Color green = Color(0xff34c759);
  static const Color pinkAccent = Colors.pink;
  static const Color lightBlue = Colors.lightBlue;
  static const Color purple = Colors.purple;
  static const Color deepPurpleAccent = Colors.deepPurpleAccent;
  static const Color amber = Colors.amber;
  static const Color darkRed = Color.fromARGB(100, 255, 10, 20);
  static const Color orange = Color(0xffff9500);

}
