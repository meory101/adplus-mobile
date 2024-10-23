
import 'package:flutter/cupertino.dart';
import 'package:mzad_damascus/core/resource/icon_manager.dart';

abstract class EnumManager {

static Map<num,TextInputType> categoryAttributeFormInputType= {
   28 : TextInputType.datetime,
 };
static Map<num,String> categoryAttributeFormIcon= {
   28 : AppIconManager.calendar,
  -1 : AppIconManager.done
 };

}

