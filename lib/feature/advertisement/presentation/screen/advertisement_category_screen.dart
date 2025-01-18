import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mzad_damascus/core/widget/snack_bar/note_message.dart';
import 'package:mzad_damascus/feature/advertisement/presentation/screen/category_attribute_form_screen.dart';
import '../../../../core/resource/color_manager.dart';
import '../../../../core/resource/font_manager.dart';
import '../../../../core/resource/size_manager.dart';
import '../../../../core/widget/container/dialog_container.dart';
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
  num selectedCategoryId = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: AdvertisementNextButton(
        onTap: () {
          if (selectedCategoryId == -1) {
            NoteMessage.showErrorSnackBar(
                context: context, text: "please select category");
            return;
          }

          Navigator.of(context).pushNamed(
              RouteNamedScreens.categoryAttributeForm,
              arguments:
                  CategoryAttributeFormArgs(categoryId: selectedCategoryId));
        },
      ),
      body: DialogContainer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              const AdvertisementAppBar(
          steps: "1/3"
,
          completePercent: (1/3),
              ),
              SizedBox(
                height: AppHeightManager.h2point5,
              ),
              AppTextWidget(
                  text: "chooseCategory".tr(),
                  fontSize: FontSizeManager.fs16,
                  color: AppColorManager.textAppColor,
                  fontWeight: FontWeight.w600),
              SizedBox(
                height: AppHeightManager.h1point8,
              ),
              CategoriesOptionsListView(
                selectCategoryCallBak: (categoryId) {
                  setState(() {
                    selectedCategoryId = categoryId;
                  });
                },
              ),
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
