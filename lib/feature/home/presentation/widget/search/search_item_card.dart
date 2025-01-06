import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/advs_by_attribute_response_entity.dart';

import '../../../../../core/resource/color_manager.dart';
import '../../../../../core/resource/constant_manager.dart';
import '../../../../../core/resource/enum_manager.dart';
import '../../../../../core/resource/font_manager.dart';
import '../../../../../core/resource/size_manager.dart';
import '../../../../../core/widget/button/main_app_button.dart';
import '../../../../../core/widget/image/main_image_widget.dart';
import '../../../../../core/widget/text/app_text_widget.dart';

class SearchItemCard extends StatelessWidget {
  final AdData advertisement;
  const SearchItemCard({super.key,required this.advertisement});

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        Column(
          children: [
            Container(
              height: AppHeightManager.h30,
              clipBehavior:
              Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                color: AppColorManager
                    .lightGreyOpacity6,
                borderRadius: BorderRadius.circular(
                    AppRadiusManager.r15),
              ),
              child: MainImageWidget(
                fit: BoxFit.cover,
                height: AppHeightManager.h30,
                imageUrl: AppConstantManager
                    .imageBaseUrl +
                    (advertisement
                        .photos?.first.photo ??
                        ""),
                borderRadius: BorderRadius.circular(
                    AppRadiusManager.r15),
              ),
            ),
            Column(
              crossAxisAlignment:
              CrossAxisAlignment.center,
              children: [
                SizedBox(
                    height: AppHeightManager.h08),
                AppTextWidget(
                  text: advertisement.name
                      .toString(),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  fontSize: FontSizeManager.fs15,
                  fontWeight: FontWeight.w600,
                ),
                AppTextWidget(
                  text: advertisement.startingPrice
                      .toString(),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  fontSize: FontSizeManager.fs14,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(
                    height:
                    AppHeightManager.h1point8),
              ],
            )
          ],
        ),
        Visibility(
          visible: advertisement.star ==
              EnumManager.star,
          child: MainAppButton(
            borderRadius: BorderRadius.circular(
                AppRadiusManager.r10),
            padding: EdgeInsets.symmetric(
              horizontal: AppWidthManager.w3Point8,
              vertical: AppHeightManager.h04,
            ),
            color: AppColorManager.gold,
            child: AppTextWidget(
              text: 'featured'.tr(),
              color: AppColorManager.white,
              fontSize: FontSizeManager.fs16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
