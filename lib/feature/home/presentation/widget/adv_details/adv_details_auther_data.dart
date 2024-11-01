import 'package:flutter/cupertino.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/get_adv_details_response_entity.dart';

import '../../../../../core/resource/constant_manager.dart';
import '../../../../../core/resource/font_manager.dart';
import '../../../../../core/resource/size_manager.dart';
import '../../../../../core/widget/image/main_image_widget.dart';
import '../../../../../core/widget/text/app_text_widget.dart';

class AdvDetailsAutherData extends StatelessWidget {
  final AdvDetails? advDetails;
  const AdvDetailsAutherData({super.key,required this.advDetails});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Container(
          height: AppWidthManager.w15,
          width: AppWidthManager.w15,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: const BoxDecoration(shape: BoxShape.circle),
          child: MainImageWidget(
            imageUrl: AppConstantManager.imageBaseUrl +
                (advDetails?.author?.photo ?? ""),
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
                fontWeight: FontWeight.w600,
                fontSize: FontSizeManager.fs15,
                text: advDetails?.author?.name ?? ""),
            AppTextWidget(
                maxLines: 2,
                fontWeight: FontWeight.w600,
                fontSize: FontSizeManager.fs15,
                text: advDetails?.author?.phone ?? ""),
          ],
        )
      ],
    );
  }
}
