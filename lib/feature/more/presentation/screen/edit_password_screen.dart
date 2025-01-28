import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzad_damascus/core/helper/validation_helper.dart';
import 'package:mzad_damascus/core/resource/color_manager.dart';
import 'package:mzad_damascus/core/resource/cubit_status_manager.dart';
import 'package:mzad_damascus/core/resource/size_manager.dart';
import 'package:mzad_damascus/core/widget/app_bar/main_app_bar.dart';
import 'package:mzad_damascus/core/widget/button/main_app_button.dart';
import 'package:mzad_damascus/core/widget/form_field/app_form_field.dart';
import 'package:mzad_damascus/core/widget/snack_bar/note_message.dart';
import 'package:mzad_damascus/core/widget/text/app_text_widget.dart';
import 'package:mzad_damascus/feature/more/domain/entity/request/edit_password_request_entity.dart';
import 'package:mzad_damascus/feature/more/presentation/cubit/edit_password_cubit/edit_password_cubit.dart';
import 'package:mzad_damascus/feature/more/presentation/cubit/edit_password_cubit/edit_password_state.dart';
import 'package:mzad_damascus/router/router.dart';
import '../../../../core/resource/font_manager.dart';
import '../../../../core/injection/injection_container.dart' as di;

class EditPasswordScreen extends StatefulWidget {
  const EditPasswordScreen({super.key});

  @override
  _EditPasswordScreenState createState() => _EditPasswordScreenState();
}

class _EditPasswordScreenState extends State<EditPasswordScreen> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordconfController = TextEditingController();

  EditPasswordRequestEntity entity = EditPasswordRequestEntity();
  bool passwordVisible = false;
  bool confirmPasswordVisible = false;
  bool passwordsMatch = false;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: "editPassword".tr()), // Localized title
      body: SingleChildScrollView(
        child: BlocProvider(
          create: (context) => di.sl<EditPasswordCubit>(),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  SizedBox(height: AppHeightManager.h1point8),
                  AppTextFormField(
                    maxLines: 1,
                    hintText: "passwordHint".tr(), // Localized hint
                    hintStyle: const TextStyle(color: AppColorManager.textGrey),
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
                    hintText: "confirmPasswordHint".tr(), // Localized hint
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
                        }return null;

                    },
                    suffixIcon: IconButton(
                      icon: Icon(
                        confirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
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
                    'passwordsMatch'.tr(), // Localized match message
                    style: TextStyle(color: Colors.green),
                  )
                      : Text(
                    'passwordsDoNotMatch'.    tr(), // Localized mismatch message
                    style: TextStyle(color: Colors.red),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25),
                    child: BlocConsumer<EditPasswordCubit, EditPasswordState>(
                      listener: (context, state) {
                        if (state.status == CubitStatus.success) {
                          NoteMessage.showSuccessSnackBar(
                              context: context, text: 'passwordChangeSuccess'.tr()); // Localized success message
                          Navigator.of(context).pushNamed(
                            RouteNamedScreens.mainBottomAppBar,
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
                            if ((formKey.currentState?.validate() ?? false)) {
                              context.read<EditPasswordCubit>().editpassword(
                                context: context,
                                entity: entity,
                              );
                            }
                          },
                          borderRadius: BorderRadius.circular(10),
                          color: AppColorManager.mainColor,
                          height: AppHeightManager.h5,
                          width: AppWidthManager.w100,
                          child: Center(
                            child: AppTextWidget(
                              text: "saveNewPassword".tr(), // Localized button text
                              color: AppColorManager.white,
                              fontSize: FontSizeManager.fs16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        );
                      },
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