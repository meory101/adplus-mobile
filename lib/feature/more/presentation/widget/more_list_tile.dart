import 'package:flutter/material.dart';
import 'package:mzad_damascus/core/resource/color_manager.dart';
import 'package:mzad_damascus/core/resource/font_manager.dart';
import 'package:mzad_damascus/core/resource/size_manager.dart';
import 'package:mzad_damascus/core/widget/text/app_text_widget.dart';

class MoreListTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const MoreListTile({
    super.key,
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: AppRadiusManager.r20,
        backgroundColor: AppColorManager.subColor.withOpacity(0.1),
        child: Icon(icon, color: AppColorManager.subColor),
      ),
      title: AppTextWidget(
          text: label,
          fontWeight: FontWeight.w500,
          fontSize: FontSizeManager.fs16,
          maxLines: 2,
          color: AppColorManager.textAppColor),
      onTap: onTap,
    );
  }
}
