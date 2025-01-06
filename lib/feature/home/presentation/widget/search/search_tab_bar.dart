import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mzad_damascus/core/helper/language_helper.dart';

import '../../../../../core/resource/color_manager.dart';
import '../../../../../core/resource/font_manager.dart';
import '../../../../../core/resource/size_manager.dart';

class SearchTabBar extends StatefulWidget {
  final Function(int) onTapChanged;

  const SearchTabBar({super.key, required this.onTapChanged});

  @override
  State<SearchTabBar> createState() => _SearchTabBarState();
}

class _SearchTabBarState extends State<SearchTabBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: selectedIndex,
      child: Column(
        children: [
          SizedBox(
            height: AppHeightManager.h2point2,
          ),
          Container(
            decoration: BoxDecoration(
              color: AppColorManager.lightGreyOpacity6,
              borderRadius: BorderRadius.circular(AppRadiusManager.r15),
            ),
            child: TabBar(
                indicator: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColorManager.mainColor,
                      AppColorManager.mainColor.withOpacity(0.5),
                    ],
                    begin: LanguageHelper.checkIfLTR(context: context)
                        ? Alignment.topRight
                        : Alignment.centerLeft,
                    end: LanguageHelper.checkIfLTR(context: context)
                        ? Alignment.centerLeft
                        : Alignment.centerRight,
                  ),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(AppRadiusManager.r15),
                ),
                dividerColor: AppColorManager.transparent,
                indicatorColor: Colors.transparent,
                onTap: (value) {
                  selectedIndex = value;
                  widget.onTapChanged(selectedIndex);
                  setState(() {});
                },
                indicatorSize: TabBarIndicatorSize.tab,
                overlayColor:
                    const WidgetStatePropertyAll(AppColorManager.transparent),
                unselectedLabelColor: AppColorManager.mainColor,
                unselectedLabelStyle: TextStyle(
                    color: AppColorManager.transparent,
                    fontFamily: FontFamilyManager.cairo,
                    fontSize: FontSizeManager.fs15,
                    fontWeight: FontWeight.w600),
                labelStyle: TextStyle(
                    color: AppColorManager.white,
                    fontFamily: FontFamilyManager.cairo,
                    fontSize: FontSizeManager.fs15,
                    fontWeight: FontWeight.w600),
                tabs: [
                  Tab(
                    text: "advertisements".tr(),
                  ),
                  Tab(
                    text: "users".tr(),
                  ),

                ]),
          ),
          SizedBox(
            height: AppHeightManager.h2point2,
          ),
        ],
      ),
    );
  }
}
