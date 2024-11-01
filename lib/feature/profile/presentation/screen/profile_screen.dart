import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mzad_damascus/core/resource/color_manager.dart';
import 'package:mzad_damascus/core/resource/constant_manager.dart';
import 'package:mzad_damascus/core/resource/cubit_status_manager.dart';
import 'package:mzad_damascus/core/resource/font_manager.dart';
import 'package:mzad_damascus/core/resource/icon_manager.dart';
import 'package:mzad_damascus/core/storage/shared/shared_pref.dart';

import 'package:mzad_damascus/core/widget/text/app_text_widget.dart';
import 'package:mzad_damascus/feature/profile/presentation/cubit/get_profile_cubit/get_profile_info_cubit.dart';
import 'package:mzad_damascus/feature/profile/presentation/widget/profile_info_card.dart';
import 'package:mzad_damascus/router/router.dart';
import '../../../../core/resource/size_manager.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selectedIndex = 0;

  void _onMenuItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    initProfileScreen();
    super.initState();
  }

  initProfileScreen() {
    context.read<GetProfileInfoCubit>().getProfileInfo(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        surfaceTintColor: AppColorManager.background,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppTextWidget(
                text: 'profile',
                fontSize: FontSizeManager.fs17,
                color: AppColorManager.textAppColor,
                fontWeight: FontWeight.w700),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const ProfileInfoCard(),
            Divider(
              color: AppColorManager.borderGrey,
              thickness: 1.0,
              indent: AppWidthManager.w3Point8,
              endIndent: AppWidthManager.w3Point8,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                border: Border.all(
                  color: Colors.grey[300]!,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              margin: EdgeInsets.all(16.0),
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SizedBox(height: AppHeightManager.h4),
                  AnimatedSwitcher(
                    duration: Duration(milliseconds: 300),
                    child: _buildContent(_selectedIndex),
                  ),
                  SizedBox(height: AppHeightManager.h4),
                  _buildBottomMenu(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomMenu() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildBottomMenuItem(AppIconManager.favorites, 'المفضلة', 0),
        _buildBottomMenuItem(AppIconManager.comments, 'التعليقات', 1),
        _buildBottomMenuItem(AppIconManager.likes, 'الإعجابات', 2),
        _buildBottomMenuItem(AppIconManager.activity, 'النشطة', 3),
      ],
    );
  }

  Widget _buildBottomMenuItem(String icon, String label, int index) {
    return GestureDetector(
      onTap: () => _onMenuItemTap(index),
      child: Column(
        children: [
          SvgPicture.asset(
              color: _selectedIndex == index ? Colors.blue : Colors.grey, icon),
          AppTextWidget(
            text: label,
            fontSize: FontSizeManager.fs14,
            color: _selectedIndex == index ? Colors.blue : Colors.grey,
          ),
        ],
      ),
    );
  }

  Widget _buildContent(int index) {
    switch (index) {
      case 0:
        return _buildFavoritesContent();
      case 1:
        return _buildCommentsContent();
      case 2:
        return _buildLikesContent();
      case 3:
        return _buildActivityContent();
      default:
        return _buildFavoritesContent();
    }
  }

  Widget _buildFavoritesContent() {
    return Column(
      key: ValueKey<int>(0),
      children: [
        AppTextWidget(
          text: "هذا هو المحتوى الخاص بالمفضلة",
          fontSize: FontSizeManager.fs16,
          color: AppColorManager.textAppColor,
        ),
      ],
    );
  }

  Widget _buildCommentsContent() {
    return Column(
      key: ValueKey<int>(1),
      children: [
        AppTextWidget(
          text: "هذا هو المحتوى الخاص بالتعليقات",
          fontSize: FontSizeManager.fs16,
          color: AppColorManager.textAppColor,
        ),
      ],
    );
  }

  Widget _buildLikesContent() {
    return Column(
      key: ValueKey<int>(2),
      children: [
        AppTextWidget(
          text: "هذا هو المحتوى الخاص بالإعجابات",
          fontSize: FontSizeManager.fs16,
          color: AppColorManager.textAppColor,
        ),
      ],
    );
  }

  Widget _buildActivityContent() {
    return Column(
      key: ValueKey<int>(3),
      children: [
        AppTextWidget(
          text: "هذا هو المحتوى الخاص بالنشاطات",
          fontSize: FontSizeManager.fs16,
          color: AppColorManager.textAppColor,
        ),
      ],
    );
  }
}
