import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mzad_damascus/core/resource/color_manager.dart';
import 'package:mzad_damascus/core/resource/font_manager.dart';
import 'package:mzad_damascus/core/resource/icon_manager.dart';
import 'package:mzad_damascus/core/widget/button/main_app_button.dart';
import 'package:mzad_damascus/core/widget/form_field/app_form_field.dart';
import 'package:mzad_damascus/core/widget/text/app_text_widget.dart';
import '../../../../core/resource/image_manager.dart';
import '../../../../core/resource/size_manager.dart';
import '../../../../router/router.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool passwordVisible = false;
  bool confirmPasswordVisible = false;
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.only(
              top: AppHeightManager.h20,
              left: AppWidthManager.w5,
              right: AppWidthManager.w5
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: AppHeightManager.h2),
              AppTextWidget(
                text: "Create a New Account",
                color: AppColorManager.textAppColor,
                fontSize: FontSizeManager.fs20,
                fontWeight: FontWeight.w700,
              ),
              SizedBox(height: AppHeightManager.h5),
              AppTextFormField(
                textInputType: TextInputType.name,
                hintText: "Full Name",
                hintStyle: const TextStyle(color: AppColorManager.textGrey),
                prefixIcon: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppWidthManager.w3Point8),
                  child: SvgPicture.asset(
                    AppIconManager.person,
                    colorFilter: const ColorFilter.mode(
                        AppColorManager.textGrey, BlendMode.srcIn),
                  ),
                ),
                onChanged: (value) {},
                validator: (value) {
                  return null;
                },
              ),
              SizedBox(height: AppHeightManager.h1point8),
              AppTextFormField(
                textInputType: TextInputType.emailAddress,
                hintText: "Email Address",
                hintStyle: const TextStyle(color: AppColorManager.textGrey),
                prefixIcon: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppWidthManager.w3Point8),
                  child: SvgPicture.asset(
                    AppIconManager.email,
                    colorFilter: const ColorFilter.mode(
                        AppColorManager.textGrey, BlendMode.srcIn),
                  ),
                ),
                onChanged: (value) {},
                validator: (value) {
                  return null;
                },
              ),
              SizedBox(height: AppHeightManager.h1point8),
              AppTextFormField(
                maxLines: 1,
                textInputType: TextInputType.number,
                hintText: "Phone Number",
                hintStyle: const TextStyle(color: AppColorManager.textGrey),
                prefixIcon: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppWidthManager.w3Point8),
                  child: SvgPicture.asset(
                    AppIconManager.phone,
                    colorFilter: const ColorFilter.mode(
                        AppColorManager.textGrey, BlendMode.srcIn),
                  ),
                ),
                onChanged: (value) {},
                validator: (value) {
                  return null;
                },

                obscureText: !passwordVisible,
              ),
              SizedBox(height: AppHeightManager.h1point8),
              AppTextFormField(

                maxLines: 1,
                textInputType: TextInputType.visiblePassword,
                hintText: "Password",
                hintStyle: const TextStyle(color: AppColorManager.textGrey),
                prefixIcon: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppWidthManager.w3Point8),
                  child: SvgPicture.asset(
                    AppIconManager.lock,
                    colorFilter: const ColorFilter.mode(
                        AppColorManager.textGrey, BlendMode.srcIn),
                  ),
                ),
                onChanged: (value) {},
                validator: (value) {
                  return null;
                },
                suffixIcon: IconButton(
                  splashColor: AppColorManager.transparent,
                  highlightColor:AppColorManager.transparent ,
                  icon: Icon(

                    passwordVisible ? Icons.visibility : Icons.visibility_off,
                    color: AppColorManager.textGrey,
                  ),
                  onPressed: () {
                    setState(() {
                      passwordVisible = !passwordVisible;
                    });
                  },
                ),
                obscureText: !passwordVisible,
              ),
              SizedBox(height: AppHeightManager.h1point8),
              AppTextFormField(
                maxLines: 1,
                textInputType: TextInputType.visiblePassword,
                hintText: "Confirm Password",
                hintStyle: const TextStyle(color: AppColorManager.textGrey),
                prefixIcon: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppWidthManager.w3Point8),
                  child: SvgPicture.asset(
                    AppIconManager.lock,
                    colorFilter: const ColorFilter.mode(
                        AppColorManager.textGrey, BlendMode.srcIn),
                  ),
                ),
                onChanged: (value) {},
                validator: (value) {
                  return null;
                },
                suffixIcon: IconButton(
                  splashColor: AppColorManager.transparent,
                  highlightColor:AppColorManager.transparent ,
                  icon: Icon(
                    confirmPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: AppColorManager.textGrey,
                  ),
                  onPressed: () {
                    setState(() {
                      confirmPasswordVisible = !confirmPasswordVisible;
                    });
                  },
                ),
                obscureText: !confirmPasswordVisible,
              ),
              SizedBox(height: AppHeightManager.h3),
              MainAppButton(
                onTap: () {},
                height: AppHeightManager.h6,
                color: AppColorManager.mainColor,
                alignment: Alignment.center,
                child: AppTextWidget(
                  text: "Create Account",
                  color: Colors.white,
                  fontSize: FontSizeManager.fs16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: AppHeightManager.h4),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppTextWidget(
                    text: "Already have an account?",
                    color: AppColorManager.textAppColor,
                    fontSize: FontSizeManager.fs15,
                    fontWeight: FontWeight.w600,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(width: AppWidthManager.w1),
                  InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(RouteNamedScreens.advertisementLanguage);;
                    },
                    child: AppTextWidget(
                      text: "Login",
                      color: AppColorManager.mainColor,
                      fontSize: FontSizeManager.fs15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
