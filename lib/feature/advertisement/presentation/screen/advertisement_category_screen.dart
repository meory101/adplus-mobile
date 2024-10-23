import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../core/resource/color_manager.dart';
import '../../../../core/resource/font_manager.dart';
import '../../../../core/resource/size_manager.dart';
import '../../../../core/widget/container/decorated_container.dart';
import '../../../../core/widget/text/app_text_widget.dart';
import '../../../../router/router.dart';
import '../widget/advertisement_app_bar.dart';
import '../widget/advertisement_next_button.dart';
import '../widget/categories_options_list_view.dart';

class AdvertisementCategoryScreen extends StatefulWidget {
  const AdvertisementCategoryScreen({super.key});

  @override
  State<AdvertisementCategoryScreen> createState() =>
      _AdvertisementCategoryScreenState();
}

class _AdvertisementCategoryScreenState
    extends State<AdvertisementCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: AdvertisementNextButton(
        onTap: () {
          Navigator.of(context)
              .pushNamed(RouteNamedScreens.advertisementCategory);
        },
      ),
      body: DecoratedContainer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              const AdvertisementAppBar(
                completePercent: 3,
              ),
              SizedBox(
                height: AppHeightManager.h2point5,
              ),
              AppTextWidget(
                  text: "Choose Category",
                  fontSize: FontSizeManager.fs16,
                  color: AppColorManager.textAppColor,
                  fontWeight: FontWeight.w600),
              SizedBox(
                height: AppHeightManager.h1point8,
              ),
              const CategoriesOptionsListView(),
              SizedBox(
                height: AppHeightManager.h6,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
