import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mzad_damascus/core/resource/color_manager.dart';
import 'package:mzad_damascus/core/resource/font_manager.dart';
import 'package:mzad_damascus/core/resource/icon_manager.dart';
import 'package:mzad_damascus/core/widget/button/main_app_button.dart';
import 'package:mzad_damascus/core/widget/form_field/app_form_field.dart';
import 'package:mzad_damascus/core/widget/text/app_text_widget.dart';
import '../../../../core/resource/size_manager.dart';
import '../../../../router/router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool checkedValue = false;
  bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: AppHeightManager.h100,
          width: AppWidthManager.w100,
          decoration: const BoxDecoration(
            color: AppColorManager.background,
          ),
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: AppWidthManager.w3Point8,
              vertical: AppHeightManager.h20,
            ),
            padding: EdgeInsets.all(AppWidthManager.w5),
            decoration: BoxDecoration(
              color: AppColorManager.white,
              borderRadius:
                  BorderRadius.all(Radius.circular(AppRadiusManager.r20)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              children: [
                AppTextWidget(
                  text: "Welcome Back",
                  fontSize: FontSizeManager.fs20,
                  fontWeight: FontWeight.bold,
                  color: AppColorManager.black,
                ),
                SizedBox(height: AppHeightManager.h3),
                AppTextFormField(
                  textInputType: TextInputType.emailAddress,
                  prefixIcon: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppWidthManager.w3Point8),
                    child: SvgPicture.asset(
                      AppIconManager.email,
                      colorFilter: const ColorFilter.mode(
                          AppColorManager.textGrey, BlendMode.srcIn),
                    ),
                  ),
                  hintText: "Email Address",
                  hintStyle: const TextStyle(color: AppColorManager.textGrey),
                  onChanged: (value) {},
                  validator: (value) {
                    return null;
                  },
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AppTextWidget(
                      text: "Forgot Password?",
                      color: AppColorManager.mainColor,
                      fontSize: FontSizeManager.fs15,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
                SizedBox(height: AppHeightManager.h4),
                MainAppButton(
                  onTap: () {},
                  height: AppHeightManager.h6,
                  color: AppColorManager.mainColor,
                  alignment: Alignment.center,
                  child: AppTextWidget(
                    text: "Login",
                    color: AppColorManager.white,
                    fontSize: FontSizeManager.fs16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: AppHeightManager.h2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        height: AppHeightManager.h05,
                        decoration: const BoxDecoration(
                          border: Border(
                            top: BorderSide(
                              color: AppColorManager.borderGrey,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: AppHeightManager.h04,
                        left: AppWidthManager.w2point5,
                        right: AppWidthManager.w2point5,
                      ),
                      child: AppTextWidget(
                        text: "or",
                        color: AppColorManager.textGrey,
                        fontSize: FontSizeManager.fs16,
                        fontWeight: FontWeight.w600,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: AppHeightManager.h05,
                        decoration: const BoxDecoration(
                          border: Border(
                            top: BorderSide(
                              color: AppColorManager.borderGrey,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: AppHeightManager.h2),
                MainAppButton(
                  onTap: () {},
                  height: AppHeightManager.h6,
                  color: AppColorManager.white,
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: AppWidthManager.w2),
                      AppTextWidget(
                        text: "Login with Google",
                        color: AppColorManager.mainColor,
                        fontSize: FontSizeManager.fs15,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: AppHeightManager.h4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppTextWidget(
                      text: "Don't have an account?",
                      color: AppColorManager.textAppColor,
                      fontSize: FontSizeManager.fs15,
                    ),
                    SizedBox(width: AppWidthManager.w1),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(RouteNamedScreens.register);
                      },
                      child: AppTextWidget(
                        text: "Create Account",
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
      ),
    );
  }
}
