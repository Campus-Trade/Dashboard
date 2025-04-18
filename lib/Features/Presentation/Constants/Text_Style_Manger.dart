import 'package:dashboard/Features/Presentation/Constants/Color_Manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TextStyleManger {
  TextStyleManger._();
  static TextStyle boldStyle14 = TextStyle(
    fontSize: 14,
    fontFamily: 'Roboto_Condensed',
    fontWeight: FontWeight.w700,
    color: ColorManager.secondaryColor,
  );
  static TextStyle mediumStyle14 = TextStyle(
    fontSize: 14,
    fontFamily: 'Roboto_Condensed',
    fontWeight: FontWeight.w500,
    color: Colors.grey,
  );
  static TextStyle regularStyle12 = TextStyle(
    fontSize: 12,
    fontFamily: 'Roboto_Condensed',
    fontWeight: FontWeight.w400,
    color: Colors.grey,
  );
  static TextStyle boldStyle20 = TextStyle(
    fontSize: 20,
    fontFamily: 'Roboto_Condensed',
    fontWeight: FontWeight.w700,
    color: ColorManager.blackColor,
  );
}
