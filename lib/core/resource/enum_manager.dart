import 'package:flutter/cupertino.dart';
import 'package:mzad_damascus/core/resource/color_manager.dart';

abstract class EnumManager {
  // static int textCode = 1;
  // static int numberCode = 2;
  // static int dateCode = 3;
  // static int booleanCode = 4;
  // static int listCode = 5;

  static Map<num, String> advsStateCode = {
    -1: rejected,
    0: active,
    1: underreview
  };

  static Map<num, Color> advsStateColor = {
    -1: AppColorManager.red,
    0: AppColorManager.green,
    1: AppColorManager.mainColor
  };

  static String rejected = "rejected";
  static String active = "active";
  static String underreview = "underreview";

  static String text = "text";
  static String number = "number";
  static String date = "date";
  static String boolean = "boolean";
  static String list = "list";

  static String likeReaction = 'like';

  static int homeBannerSource = 0;
  static int insidePageBannerSource = 1;

  static Map<String, TextInputType> attributeTextInputType = {
    text: TextInputType.text,
    number: TextInputType.number,
    number: TextInputType.datetime,
    boolean: TextInputType.text,
    list: TextInputType.text,
    "": TextInputType.text
  };

  static String advTypeCode = "نوع الإعلان";
}
