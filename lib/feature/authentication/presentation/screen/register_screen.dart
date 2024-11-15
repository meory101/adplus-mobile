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
import 'package:mzad_damascus/feature/authentication/domain/entity/request/register_request_entity.dart';
import 'package:mzad_damascus/feature/authentication/presentation/cubit/register_cubit/register_cubit.dart';
import 'package:mzad_damascus/feature/authentication/presentation/cubit/register_cubit/register_state.dart';
import 'package:mzad_damascus/feature/authentication/presentation/screen/verfication_code.dart';
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
  bool passwordsMatch = false;

  RegisterRequestEntity entity = RegisterRequestEntity();
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
                  text: "createNewAccount".tr(),
                  color: AppColorManager.textAppColor,
                  fontSize: FontSizeManager.fs20,
                  fontWeight: FontWeight.w700,
                ),
                SizedBox(height: AppHeightManager.h5),
                AppTextFormField(
                  textInputType: TextInputType.name,
                  hintText: "fullNameHint".tr(),
                  hintStyle: const TextStyle(color: AppColorManager.textGrey),
                  onChanged: (value) {
                    entity.name = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "fullNameRequired".tr();
                    }
                    return null;
                  },
                ),
                SizedBox(height: AppHeightManager.h1point8),
                AppTextFormField(
                  textInputType: TextInputType.text,
                  hintText: "usernameHint".tr(),
                  hintStyle: const TextStyle(color: AppColorManager.textGrey),
                  onChanged: (value) {
                    entity.username = value;
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
                  textInputType: TextInputType.number,
                  hintText: "phoneNumberHint".tr(),
                  hintStyle: const TextStyle(color: AppColorManager.textGrey),
                  onChanged: (value) {
                    entity.whatsapp = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "phoneNumberRequired".tr();
                    }
                    bool isPhone = RegExp(r'^[0-9]{10,15}$').hasMatch(value);
                    if (!isPhone) {
                      return "invalidPhoneNumber".tr();
                    }
                    return null;
                  },
                ),
                SizedBox(height: AppHeightManager.h1point8),
                AppTextFormField(
                  maxLines: 1,
                  hintText: "passwordHint".tr(),
                  hintStyle: const TextStyle(color: AppColorManager.textGrey),
                  onChanged: (value) {
                    entity.password = value;
                    checkPasswordsMatch();
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "passwordRequired".tr();
                    }
                    return null;
                  },
                  suffixIcon: IconButton(
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
                  hintText: "confirmPasswordHint".tr(),
                  hintStyle: const TextStyle(color: AppColorManager.textGrey),
                  onChanged: (value) {
                    entity.passwordConfirmation = value;
                    checkPasswordsMatch();
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "confirmPasswordRequired".tr();
                    }
                    if (entity.password != value) {
                      return "passwordsDoNotMatch".tr();
                    }
                    return null;
                  },
                  suffixIcon: IconButton(
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
                SizedBox(height: AppHeightManager.h1point8),
                passwordsMatch
                    ? Text(
                  "passwordsMatch".tr(),
                  style: TextStyle(color: Colors.green),
                )
                    : Text(
                  "passwordsDoNotMatch".tr(),
                  style: TextStyle(color: Colors.red),
                ),
                SizedBox(height: AppHeightManager.h3),
                BlocConsumer<RegisterCubit, RegisterState>(
                  listener: (context, state) {
                    if (state.status == CubitStatus.success) {
                      Navigator.of(context).pushNamed(
                        RouteNamedScreens.verfication,
                        arguments: VerificationCodeArgs(
                          password: entity.password,
                          username: entity.username,
                        ),
                      );
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
                        if (formKey.currentState?.validate() ?? false && passwordsMatch) {
                          context
                              .read<RegisterCubit>()
                              .register(entity: entity, context: context);
                        }
                      },
                      height: AppHeightManager.h6,
                      color: AppColorManager.mainColor,
                      alignment: Alignment.center,
                      child: AppTextWidget(
                        text: "createAccount".tr(),
                        color: Colors.white,
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
                      text: "alreadyHaveAccount".tr(),
                      color: AppColorManager.textAppColor,
                      fontSize: FontSizeManager.fs15,
                    ),
                    SizedBox(width: AppWidthManager.w1),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .pushReplacementNamed(RouteNamedScreens.login);
                      },
                      child: AppTextWidget(
                        text: "login".tr(),
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

  void checkPasswordsMatch() {
    setState(() {
      passwordsMatch = entity.password == entity.passwordConfirmation;
    });
  }
}