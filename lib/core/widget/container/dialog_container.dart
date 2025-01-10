import 'package:flutter/material.dart';

import '../../resource/color_manager.dart';
import '../../resource/size_manager.dart';
import '../../resource/theme_manager.dart';

//A Decorated Container With Default Shadow Effect
class DialogContainer extends StatelessWidget {
  const DialogContainer({
    super.key,
    this.color,
    this.margin,
    this.padding,
    this.width,
    this.height,
    this.child,
    this.border,
    this.alignment,
    this.shape,
    this.boxShadow,
    this.image,
    this.borderRadius,
    this.isGradient,
  });
  final Color? color;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final double? height;
  final Widget? child;
  final BoxBorder? border;
  final AlignmentGeometry? alignment;
  final BoxShape? shape;
  final List<BoxShadow>? boxShadow;
  final DecorationImage? image;
  final BorderRadiusGeometry? borderRadius;
  final bool? isGradient;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppHeightManager.h100,
      width: AppWidthManager.w100,
      margin: EdgeInsets.only(
        top: AppHeightManager.h9,
      ),
      padding: EdgeInsets.symmetric(
          horizontal: AppWidthManager.w3Point8,
          vertical: AppHeightManager.h2point5),
      decoration: BoxDecoration(
        color: AppColorManager.white,
        boxShadow: ThemeManager.dialogShadow,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppRadiusManager.r20),
          topRight: Radius.circular(AppRadiusManager.r20),
        ),
      ),
      child: child,
    );
  }
}
