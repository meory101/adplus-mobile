import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/get_adv_details_response_entity.dart';
import 'package:mzad_damascus/feature/home/presentation/screen/auhter_profile_screen.dart';
import 'package:mzad_damascus/router/router.dart';
import '../../../../../core/resource/constant_manager.dart';
import '../../../../../core/resource/font_manager.dart';
import '../../../../../core/resource/size_manager.dart';
import '../../../../../core/widget/image/main_image_widget.dart';
import '../../../../../core/widget/text/app_text_widget.dart';
import 'dart:ui' as ui;

class AdvDetailsAutherData extends StatelessWidget {
  final AdvDetails? advDetails;

  const AdvDetailsAutherData({super.key, required this.advDetails});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(RouteNamedScreens.authorProfile,
                arguments: AuthorProfileArgs(
                    userName: advDetails?.author?.username ?? ""));
          },
          child: Container(
            height: AppWidthManager.w15,
            width: AppWidthManager.w15,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child: MainImageWidget(
              imageUrl: AppConstantManager.imageBaseUrl +
                  (advDetails?.author?.photo ?? ""),
            ),
          ),
        ),
        SizedBox(
          width: AppWidthManager.w2,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTextWidget(
                maxLines: 2,
                fontWeight: FontWeight.w700,
                fontSize: FontSizeManager.fs16,
                text: advDetails?.author?.name ?? ""),
            Directionality(
              textDirection: ui.TextDirection.ltr,
              child: Row(
                children: [
                  AppTextWidget(
                      maxLines: 2,
                      fontWeight: FontWeight.w600,
                      fontSize: FontSizeManager.fs15,
                      text: '${advDetails?.author?.followersCount ?? 0}'),
                  SizedBox(
                    width: AppWidthManager.w1,
                  ),
                  AppTextWidget(
                      fontWeight: FontWeight.w600,
                      fontSize: FontSizeManager.fs15,
                      text: 'follower'.tr()),
                ],
              ),
            ),
            Directionality(
              textDirection: ui.TextDirection.ltr,
              child: AppTextWidget(
                  maxLines: 2,
                  fontWeight: FontWeight.w600,
                  fontSize: FontSizeManager.fs15,
                  text: advDetails?.author?.phone ?? ""),
            ),
          ],
        )
      ],
    );
  }
}
