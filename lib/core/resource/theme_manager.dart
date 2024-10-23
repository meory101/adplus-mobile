import 'package:flutter/cupertino.dart';

import 'color_manager.dart';

abstract class ThemeManager {
 static List<BoxShadow>? cardShadow = const [
   BoxShadow(
     color: AppColorManager.shadow,
     spreadRadius: 3,
     offset: Offset(
       0,
       4,
     ),
     blurRadius: 4,
   )
  ];

 static List<BoxShadow>? dialogShadow = const [
   BoxShadow(
     color: AppColorManager.shadow,
     spreadRadius: 7,
     offset: Offset(
       0,
       -7,
     ),
     blurRadius: 7,
   )
 ];
}
