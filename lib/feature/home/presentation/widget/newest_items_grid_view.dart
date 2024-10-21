import 'package:flutter/cupertino.dart';

import '../../../../core/resource/color_manager.dart';
import '../../../../core/resource/font_manager.dart';
import '../../../../core/resource/size_manager.dart';
import '../../../../core/widget/text/app_text_widget.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';

/// Eng.Nour Othman(meory)*

class NewestItemsGridView extends StatelessWidget {
  const NewestItemsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextWidget(
            text: "newestItems",
            fontSize: FontSizeManager.fs16,
            color: AppColorManager.textAppColor,
            fontWeight: FontWeight.w700),
        SizedBox(
          height: AppHeightManager.h1point8,
        ),
        DynamicHeightGridView(
          crossAxisSpacing: AppWidthManager.w3Point8,
          mainAxisSpacing: AppWidthManager.w3Point8,
          crossAxisCount: 2,
          builder: (context, index) {
            return const Text('dd');
          },
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 6,
        ),
        SizedBox(
          height: AppHeightManager.h1point8,
        ),
      ],
    );
  }
}
