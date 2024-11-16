import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:mzad_damascus/core/helper/language_helper.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/get_adv_details_response_entity.dart';

import '../../../../../core/resource/font_manager.dart';
import '../../../../../core/resource/size_manager.dart';
import '../../../../../core/widget/container/decorated_container.dart';
import '../../../../../core/widget/text/app_text_widget.dart';

class AdvDetailsAttributeGridView extends StatelessWidget {
  final AdvDetails?  advDetails;
  const AdvDetailsAttributeGridView({super.key,required this.advDetails});

  @override
  Widget build(BuildContext context) {
    return DynamicHeightGridView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        builder: (context, index) {
          return DecoratedContainer(
            padding: EdgeInsets.all(AppWidthManager.w3Point8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppTextWidget(
                    maxLines: 2,
                    fontWeight: FontWeight.w500,
                    fontSize: FontSizeManager.fs16,
                    text:
                    LanguageHelper.checkIfLTR(context: context)?
                    ( advDetails
                        ?.attributes?[index].attribute?.attributeNameEn ??
                        "") :( advDetails
                        ?.attributes?[index].attribute?.attributeName ??
                        "") ),

                AppTextWidget(
                    maxLines: 2,
                    fontWeight: FontWeight.w700,
                    fontSize: FontSizeManager.fs15,
                    text:
                    advDetails?.attributes?[index].value ?? ""

                ),
              ],
            ),
          );
        },
        itemCount: advDetails?.attributes?.length ?? 0,
        crossAxisCount: 3);
  }
}
