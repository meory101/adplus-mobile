import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mzad_damascus/core/resource/color_manager.dart';
import 'package:mzad_damascus/core/resource/cubit_status_manager.dart';
import 'package:mzad_damascus/core/resource/font_manager.dart';
import 'package:mzad_damascus/core/resource/icon_manager.dart';
import 'package:mzad_damascus/core/widget/button/main_app_button.dart';
import 'package:mzad_damascus/core/widget/form_field/app_form_field.dart';
import 'package:mzad_damascus/core/widget/snack_bar/note_message.dart';
import 'package:mzad_damascus/core/widget/text/app_text_widget.dart';
import 'package:mzad_damascus/feature/authentication/domain/entity/request/login_request_entity.dart';
import 'package:mzad_damascus/feature/authentication/presentation/cubit/login_cubit/login_cubit.dart';
import 'package:mzad_damascus/feature/authentication/presentation/screen/reset_password_screen.dart';
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
  LoginRequestEntity entity = LoginRequestEntity();
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              top: AppHeightManager.h20,
              left: AppWidthManager.w5,
              right: AppWidthManager.w5),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                AppTextWidget(
                  text: "welcomeBack".tr(),
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
                      AppIconManager.person,
                      colorFilter: const ColorFilter.mode(
                          AppColorManager.textGrey, BlendMode.srcIn),
                    ),
                  ),
                  hintText: "name".tr(),
                  hintStyle: const TextStyle(color: AppColorManager.textGrey),
                  onChanged: (value) {
                    entity.username = value;
                    return null;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "usernameRequired".tr();
                    }

                    bool isEmail = RegExp(
                        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$')
                        .hasMatch(value);
                    bool isPhone = RegExp(r'^[0-9]{10,15}$').hasMatch(value);

                    if (!isEmail && !isPhone) {
                      return "usernameInvalid".tr();
                    }
                    return null;
                  },
                ),
                SizedBox(height: AppHeightManager.h1point8),
                AppTextFormField(
                  maxLines: 1,
                  textInputType: TextInputType.visiblePassword,
                  hintText: "passwordHint".tr(),
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
                  onChanged: (value) {
                    entity.password = value;
                    return null;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "passwordRequired".tr();
                    }
                    return null;
                  },
                  suffixIcon: IconButton(
                    splashColor: AppColorManager.transparent,
                    highlightColor: AppColorManager.transparent,
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
                    MainAppButton(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          RouteNamedScreens.forgetpassword,
                        );
                      },
                      child: AppTextWidget(
                        text: "forgotPassword".tr(),
                        color: AppColorManager.mainColor,
                        fontSize: FontSizeManager.fs15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: AppHeightManager.h4),
                BlocConsumer<LoginCubit, LoginState>(
                  listener: (context, state) {
                    if (state.status == CubitStatus.success) {
                      Navigator.of(context)
                          .pushNamedAndRemoveUntil(RouteNamedScreens.mainBottomAppBar, (route) => false);
                    }
                    if (state.status == CubitStatus.error) {
                      NoteMessage.showErrorSnackBar(
                          context: context, text: state.error);
                    }
                  },
                  builder: (context, state) {
                    if (state.status == CubitStatus.loading) {
                      return const CircularProgressIndicator();
                    }
                    return MainAppButton(
                      onTap: () {
                        if ((formKey.currentState?.validate()) ?? false) {
                          context
                              .read<LoginCubit>()
                              .login(context: context, entity: entity);
                        }
                      },
                      height: AppHeightManager.h6,
                      color: AppColorManager.mainColor,
                      alignment: Alignment.center,
                      child: AppTextWidget(
                        text: "login".tr(),
                        color: AppColorManager.white,
                        fontSize: FontSizeManager.fs16,
                        fontWeight: FontWeight.w600,
                      ),
                    );
                  },
                ),
                SizedBox(height: AppHeightManager.h4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppTextWidget(
                      text: "noAccount".tr(),
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
                        text: "createAccount".tr(),
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