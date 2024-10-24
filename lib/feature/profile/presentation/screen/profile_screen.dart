import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mzad_damascus/core/resource/color_manager.dart';
import 'package:mzad_damascus/core/resource/font_manager.dart';
import 'package:mzad_damascus/core/resource/icon_manager.dart';
import 'package:mzad_damascus/core/widget/app_bar/main_app_bar.dart';
import 'package:mzad_damascus/core/widget/button/main_app_button.dart';
import 'package:mzad_damascus/core/widget/text/app_text_widget.dart';
import '../../../../core/resource/size_manager.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorManager.background,
      appBar: MainAppBar(
        title: 'Profile screen',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColorManager.textGrey,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              margin: EdgeInsets.all(16.0),
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SizedBox(height: AppHeightManager.h02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          CircleAvatar(
                            radius: AppRadiusManager.r30,
                            backgroundImage:
                                AssetImage('assets/images/placeholder.png'),
                          ),
                          AppTextWidget(
                            text: '+97471686245',
                            fontSize: FontSizeManager.fs16,
                            color: AppColorManager.textGrey,
                          ),
                          SizedBox(height: AppHeightManager.h2),
                          AppTextWidget(
                            text: 'لايوجد وصف متاح',
                            fontSize: FontSizeManager.fs16,
                            color: AppColorManager.textGrey,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColorManager.textGrey,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 16.0),
                              child: Row(
                                children: [Text("Edit"), Icon(Icons.edit)],
                              ),
                            ),
                          ),
                          SizedBox(width: AppWidthManager.w3),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColorManager.textGrey,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 16.0),
                              child: Row(
                                children: [Text("Share"), Icon(Icons.share)],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: AppHeightManager.h4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildInfoColumn('0', 'followers'),
                      _buildInfoColumn('1', 'Following'),
                      _buildInfoColumn('0/470', 'Posted Ads '),
                      _buildInfoColumn('7 days', 'post Ads time '),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: MainAppButton(
                      onTap: () {},
                      height: AppHeightManager.h6,
                      color: AppColorManager.mainColor,
                      alignment: Alignment.center,
                      child: AppTextWidget(
                        text: "Look around",
                        color: AppColorManager.white,
                        fontSize: FontSizeManager.fs16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.grey[400],
              thickness: 1.0,
              indent: 16.0,
              endIndent: 16.0,
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

  Widget _buildInfoColumn(String value, String label) {
    return Column(
      children: [
        AppTextWidget(
          text: value,
          fontSize: FontSizeManager.fs18,
          fontWeight: FontWeight.bold,
          color: AppColorManager.textAppColor,
        ),
        AppTextWidget(
          text: label,
          fontSize: FontSizeManager.fs14,
          color: AppColorManager.textGrey,
        ),
      ],
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
