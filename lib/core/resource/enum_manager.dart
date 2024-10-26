

import 'package:flutter/cupertino.dart';

abstract class EnumManager {

  // static int textCode = 1;
  // static int numberCode = 2;
  // static int dateCode = 3;
  // static int booleanCode = 4;
  // static int listCode = 5;


  static String text = "text";
  static String number = "number";
  static String date = "date";
  static String boolean = "boolean";
  static String list = "list";


  static Map<String,TextInputType> attributeTextInputType ={
    text : TextInputType.text,
    number : TextInputType.number,
    number : TextInputType.datetime,
    boolean : TextInputType.text,
    list : TextInputType.text,
    "" :  TextInputType.text
  };


  static String advTypeCode =  "نوع الإعلان";
}

