import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../resource/color_manager.dart';
import '../../resource/font_manager.dart';
import '../../resource/size_manager.dart';
import '../text/app_text_widget.dart';
import 'app_form_field.dart';


class TitleAppFormFiled extends StatelessWidget {
  const TitleAppFormFiled(
      {super.key,
        required this.hint,
        required this.title,
        required this.onChanged,
        required this.validator,
        this.initValue,
        this.style,
        this.suffixIcon,
        this.onIconTaped,
        this.maxLines,
        this.minLines,
        this.isRequired,
        this.readOnly,
        this.multiLines,
        this.textInputType,
        this.controller,
        this.formKey});

  final String title, hint;
  final String? Function(String?) onChanged;
  final String? Function(String?) validator;
  final String? suffixIcon, initValue;
  final bool? readOnly;
  final bool? multiLines;
  final TextStyle? style;
  final Function()? onIconTaped;
  final bool? isRequired;
  final int? maxLines;
  final int? minLines;
  final TextEditingController? controller;
  final GlobalKey<FormState>? formKey;
  final TextInputType? textInputType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextWidget(
          text: title,
          fontSize: FontSizeManager.fs16,
          fontWeight: FontWeight.w600,
        ),
        SizedBox(
          height: AppHeightManager.h1point5,
        ),
        SizedBox(
          child: AppTextFormField(
            formKey: formKey,
            controller: controller,

            style: style,
            readOnly: readOnly,
            suffixIcon: suffixIcon != null && onIconTaped != null
                ? InkWell(
              overlayColor: const MaterialStatePropertyAll(
                  AppColorManager.transparent),
              onTap: onIconTaped,
              child: Padding(
                padding: EdgeInsets.all(AppWidthManager.w2point5),
                child: SvgPicture.asset(
                  suffixIcon ?? "",
                ),
              ),
            )
                : null,
            initialValue: initValue,
            minLines: multiLines == true ? minLines ?? 5 : 1,
            maxLines: maxLines,
            validator: validator,
            onChanged: onChanged,
            textInputAction: TextInputAction.next,
            hintText: hint,
            textInputType: textInputType,
          ),
        ),
      ],
    );
  }
}
