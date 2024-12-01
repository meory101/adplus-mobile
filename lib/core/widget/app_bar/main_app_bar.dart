import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../helper/language_helper.dart';
import '../../resource/color_manager.dart';
import '../../resource/font_manager.dart';
import '../../resource/icon_manager.dart';
import '../../resource/size_manager.dart';
import '../text/app_text_widget.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({super.key, required this.title});

  final String title;

  @override
  Size get preferredSize => Size.fromHeight(AppHeightManager.h9);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: AppColorManager.white,
      automaticallyImplyLeading: false,
      title:
      Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: SvgPicture.asset(
              LanguageHelper.checkIfLTR(context: context)
                  ? AppIconManager.arrowLeft
                  : AppIconManager.arrowRight,
              colorFilter:
              const ColorFilter.mode(
                  AppColorManager.mainColor, BlendMode.srcIn),
            ),
          ),
          SizedBox(
            width: AppWidthManager.w2,
          ),
          AppTextWidget(
            text: title.isNotEmpty ? title : LanguageHelper.checkIfLTR(
                context: context) ? 'Mzad Damascus': 'مزاد دمشق',
            fontSize: FontSizeManager.fs18,
            color: AppColorManager.mainColor,
            fontWeight: FontWeight.w600,
            textAlign: TextAlign.center,
          ),
        ],
      ),
      elevation: 0,
    );
  }
}
