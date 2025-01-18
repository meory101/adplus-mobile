// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mzad_damascus/core/resource/size_manager.dart';
import 'package:shimmer/shimmer.dart';

import '../../resource/color_manager.dart';
import '../../resource/image_manager.dart';

class MainImageWidget extends StatelessWidget {
  const MainImageWidget({
    super.key,
    this.imageUrl = '',
    this.imagePath,
    this.placeholderUrl,
    this.fit,
    this.width,
    this.height,
    this.shape,
    this.borderRadius,
    this.filterQuality = FilterQuality.high, // قيمة افتراضية
  });

  final String imageUrl;
  final String? imagePath;
  final String? placeholderUrl;
  final BoxFit? fit;
  final double? width;
  final double? height;
  final FilterQuality filterQuality; // تم ضبط القيمة الافتراضية هنا
  final BoxShape? shape;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return imageUrl.isNotEmpty
        ? CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: fit ?? BoxFit.cover,
      filterQuality: filterQuality, // تم استخدام القيمة هنا
      errorWidget: (context, url, error) => Image.asset(
        AppImageManager.placeholder,
        width: width,
        height: height,
        fit: fit ?? BoxFit.cover,
      ),
      progressIndicatorBuilder: (context, url, progress) {
        return MainProgressImageWidget(
          width: width,
          height: height,
        );
      },
    )
        : imagePath != null
        ? Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: borderRadius ??
            BorderRadius.all(
              Radius.circular(
                AppRadiusManager.r15,
              ),
            ),
        image: DecorationImage(
          image: Image.asset(
            imagePath!,
            width: width,
            height: height,
          ).image,
          fit: fit ?? BoxFit.cover,
        ),
      ),
    )
        : MainProgressImageWidget(
      width: width,
      height: height,
    );
  }
}

class MainProgressImageWidget extends StatelessWidget {
  const MainProgressImageWidget({super.key, this.width, this.height});

  final double? width, height;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColorManager.shimmerBaseColor,
      highlightColor: AppColorManager.shimmerHighlightColor,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: AppColorManager.shimmerBaseColor,
          borderRadius: BorderRadius.all(
            Radius.circular(AppRadiusManager.r3),
          ),
        ),
      ),
    );
  }
}