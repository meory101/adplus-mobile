import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzad_damascus/core/helper/validation_helper.dart';
import 'package:mzad_damascus/core/resource/color_manager.dart';
import 'package:mzad_damascus/core/resource/cubit_status_manager.dart';
import 'package:mzad_damascus/core/resource/font_manager.dart';
import 'package:mzad_damascus/core/resource/image_manager.dart';
import 'package:mzad_damascus/core/widget/button/main_app_button.dart';
import 'package:mzad_damascus/core/widget/container/decorated_container.dart';
import 'package:mzad_damascus/core/widget/form_field/app_form_field.dart';
import 'package:mzad_damascus/core/widget/image/main_image_widget.dart';
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
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          height: AppHeightManager.h100,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage(AppImageManager.mzad))),
          child: Padding(
            padding: EdgeInsets.only(
                top: AppHeightManager.h3,
                left: AppWidthManager.w5,
                right: AppWidthManager.w5),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: AppHeightManager.h1,
                  ),
                  ClipOval(
                    child: SizedBox(
                      height: AppHeightManager.h12,
                      width: AppHeightManager.h12,
                      child: MainImageWidget(imagePath: AppImageManager.icon),
                    ),
                  ),
                  SizedBox(
                    height: AppHeightManager.h02,
                  ),
                  DecoratedContainer(
                    boxShadow: [
                      BoxShadow(
                          blurRadius: AppHeightManager.h5,
                          color: AppColorManager.grey.withValues(alpha: 0.6))
                    ],
                    borderRadius: BorderRadius.circular(AppRadiusManager.r10),
                    width: AppWidthManager.w95,
                    color: AppColorManager.white,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: AppHeightManager.h4,
                          ),
                          AppTextWidget(
                            text: "createNewAccount".tr(),
                            color: AppColorManager.textAppColor,
                            fontSize: FontSizeManager.fs20,
                            fontWeight: FontWeight.w700,
                          ),
                          SizedBox(
                            height: AppHeightManager.h3,
                          ),
                          SizedBox(
                            width: AppWidthManager.w80,
                            child: AppTextFormField(
                              fillColor: AppColorManager.lightGreyOpacity6,
                              textInputType: TextInputType.name,
                              hintText: "fullNameHint".tr(),
                              hintStyle: const TextStyle(
                                  color: AppColorManager.textGrey),
                              onChanged: (value) {
                                entity.name = value;
                                return null;
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "fullNameRequired".tr();
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(height: AppHeightManager.h1point8),
                          SizedBox(
                            width: AppWidthManager.w80,
                            child: AppTextFormField(
                              fillColor: AppColorManager.lightGreyOpacity6,
                              textInputType: TextInputType.text,
                              hintText: "usernameHint".tr(),
                              hintStyle: const TextStyle(
                                  color: AppColorManager.textGrey),
                              onChanged: (value) {
                                entity.username = value;
                                return null;
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "usernameRequired".tr();
                                }

                                bool isEmail = value.isEmail();
                                bool isPhone = value.isPhoneNumber();
                                if (isPhone == true) {
                                  String? newValue = value;
                                  if (value[0] == "0") {
                                    newValue = value.substring(1);
                                  }
                                  entity.username = '+963$newValue';
                                }
                                if (!isEmail && !isPhone) {
                                  return "usernameInvalid".tr();
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(height: AppHeightManager.h1point8),
                          SizedBox(
                            width: AppWidthManager.w80,
                            child: AppTextFormField(
                              fillColor: AppColorManager.lightGreyOpacity6,
                              textInputType: TextInputType.number,
                              hintText: "phoneNumberHint".tr(),
                              hintStyle: const TextStyle(
                                  color: AppColorManager.textGrey),
                              onChanged: (value) {
                                String? newValue = value;
                                if (value?[0] == "0") {
                                  newValue = value?.substring(1);
                                }
                                entity.phone = '+963$newValue';
                                return null;
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "phoneNumberRequired".tr();
                                }

                                if (!value.isPhoneNumber()) {
                                  return "invalidPhoneNumber".tr();
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(height: AppHeightManager.h1point8),
                          SizedBox(
                            width: AppWidthManager.w80,
                            child: AppTextFormField(
                              fillColor: AppColorManager.lightGreyOpacity6,
                              textInputType: TextInputType.number,
                              hintText: "whatsapp".tr(),
                              hintStyle: const TextStyle(
                                  color: AppColorManager.textGrey),
                              onChanged: (value) {
                                String? newValue = value;
                                if (value?[0] == "0") {
                                  newValue = value?.substring(1);
                                }
                                entity.whatsapp = '+963$newValue';
                                return null;
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "whatsAppRequired".tr();
                                }
                                if (!value.isPhoneNumber()) {
                                  return "invalidPhoneNumber".tr();
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(height: AppHeightManager.h1point8),
                          SizedBox(
                            width: AppWidthManager.w80,
                            child: AppTextFormField(
                              fillColor: AppColorManager.lightGreyOpacity6,
                              maxLines: 1,
                              hintText: "passwordHint".tr(),
                              hintStyle: const TextStyle(
                                  color: AppColorManager.textGrey),
                              onChanged: (value) {
                                entity.password = value;
                                checkPasswordsMatch();
                                return null;
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "passwordRequired".tr();
                                }
                                if (!value.isValidPassword()) {
                                  return "invalidPassword".tr();
                                }
                                return null;
                              },
                              suffixIcon: IconButton(
                                icon: Icon(
                                  passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
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
                          ),
                          SizedBox(height: AppHeightManager.h1point8),
                          SizedBox(
                            width: AppWidthManager.w80,
                            child: AppTextFormField(
                              fillColor: AppColorManager.lightGreyOpacity6,
                              maxLines: 1,
                              hintText: "confirmPasswordHint".tr(),
                              hintStyle: const TextStyle(
                                  color: AppColorManager.textGrey),
                              onChanged: (value) {
                                entity.passwordConfirmation = value;
                                checkPasswordsMatch();
                                return null;
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
                                    confirmPasswordVisible =
                                    !confirmPasswordVisible;
                                  });
                                },
                              ),
                              obscureText: !confirmPasswordVisible,
                            ),
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
                          SizedBox(height: AppHeightManager.h1),
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
                                  if (formKey.currentState?.validate() ??
                                      false) {

                                    // print(entity.toJson());
                                    // return;
                                    context.read<RegisterCubit>().register(
                                        entity: entity, context: context);
                                  }
                                },
                                width: AppWidthManager.w80,
                                height: AppHeightManager.h6,
                                color: AppColorManager.orange,
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
                          SizedBox(
                            height: AppHeightManager.h1,
                          ),
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
                                  Navigator.of(context).pushReplacementNamed(
                                      RouteNamedScreens.login);
                                },
                                child: AppTextWidget(
                                  text: "login".tr(),
                                  color: AppColorManager.orange,
                                  fontSize: FontSizeManager.fs15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: AppHeightManager.h5,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
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