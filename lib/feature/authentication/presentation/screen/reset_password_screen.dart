import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzad_damascus/core/helper/validation_helper.dart';
import 'package:mzad_damascus/core/resource/color_manager.dart';
import 'package:mzad_damascus/core/resource/cubit_status_manager.dart';
import 'package:mzad_damascus/core/resource/font_manager.dart';
import 'package:mzad_damascus/core/resource/image_manager.dart';
import 'package:mzad_damascus/core/widget/button/main_app_button.dart';
import 'package:mzad_damascus/core/widget/form_field/app_form_field.dart';
import 'package:mzad_damascus/core/widget/image/main_image_widget.dart';
import 'package:mzad_damascus/core/widget/snack_bar/note_message.dart';
import 'package:mzad_damascus/core/widget/text/app_text_widget.dart';
import 'package:mzad_damascus/feature/authentication/domain/entity/request/reset_passwod_request_entity.dart';
import 'package:mzad_damascus/feature/authentication/presentation/cubit/reset_password_cubit/reset_password__cubit.dart';
import 'package:mzad_damascus/feature/authentication/presentation/cubit/reset_password_cubit/reset_password_state.dart';
import '../../../../core/resource/size_manager.dart';

class ResetPasswordScreen extends StatefulWidget {
  final ResetPasswordArgs? args;
  const ResetPasswordScreen({super.key, required this.args});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  bool passwordVisible = false;
  bool confirmPasswordVisible = false;
  bool passwordsMatch = false;

  PasswordResetRequestEntity entity = PasswordResetRequestEntity();
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  void initState() {
    entity.username = widget.args?.userName;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: AppHeightManager.h100,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage(AppImageManager.mzad))),
        child: Padding(
          padding: EdgeInsets.only(
              top: AppHeightManager.h1,
              left: AppWidthManager.w5,
              right: AppWidthManager.w5),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(
                  height: AppHeightManager.h8,
                ),
                ClipOval(
                  child: SizedBox(
                    height: AppHeightManager.h12,
                    width: AppHeightManager.h12,
                    child: MainImageWidget(imagePath: AppImageManager.icon),
                  ),
                ),
                SizedBox(
                  height: AppHeightManager.h2,
                ),
                AppTextWidget(
                  text: "resetPassword".tr(),
                  color: AppColorManager.textAppColor,
                  fontSize: FontSizeManager.fs20,
                  fontWeight: FontWeight.w700,
                ),
                SizedBox(height: AppHeightManager.h5),
                AppTextFormField(
                  textInputType: TextInputType.emailAddress,
                  hintText: "codeHint".tr(),
                  hintStyle: const TextStyle(color: AppColorManager.textGrey),
                  onChanged: (value) {
                    entity.code = value;
                    return null;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "codeRequired".tr();
                    }
                    if (value.length != 6) {
                      return "inValidCode".tr();
                    }
                    return null;
                  },
                ),
                SizedBox(height: AppHeightManager.h1point8),
                AppTextFormField(
                  maxLines: 1,
                  hintText: "newPasswordHint".tr(),
                  hintStyle: const TextStyle(color: AppColorManager.textGrey),
                  onChanged: (value) {
                    entity.password = value;
                    checkPasswordsMatch();
                    return null;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "newPasswordRequired".tr();
                    }
                    if (!value.isValidPassword()) {
                      return "invalidPassword".tr();
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
                  hintText: "confirmNewPasswordHint".tr(),
                  hintStyle: const TextStyle(color: AppColorManager.textGrey),
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
                BlocConsumer<ResetCubit, ResetPasswordState>(
                  listener: (context, state) {
                    if (state.status == CubitStatus.success) {
                      Navigator.of(context).pop();
                      NoteMessage.showSuccessSnackBar(
                        context: context,
                        text: "passwordResetSuccess".tr(),
                      );
                    }
                    if (state.status == CubitStatus.error) {
                      NoteMessage.showErrorSnackBar(
                        context: context,
                        text: state.error,
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state.status == CubitStatus.loading) {
                      return const CircularProgressIndicator();
                    }
                    return MainAppButton(
                      onTap: () {
                        if (formKey.currentState?.validate() ?? false) {
                          context
                              .read<ResetCubit>()
                              .resetPassword(entity: entity, context: context);
                        }
                      },
                      height: AppHeightManager.h6,
                      color: AppColorManager.orange,
                      alignment: Alignment.center,
                      child: AppTextWidget(
                        text: "resetPasswordButton".tr(),
                        color: Colors.white,
                        fontSize: FontSizeManager.fs16,
                        fontWeight: FontWeight.w600,
                      ),
                    );
                  },
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

class ResetPasswordArgs {
  String? userName;
  ResetPasswordArgs({required this.userName});
}
