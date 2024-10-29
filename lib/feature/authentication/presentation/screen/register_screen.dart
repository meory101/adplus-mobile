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
  bool passwordsMatch = false; // للتحقق من مطابقة كلمة المرور

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
                  text: "Create a New Account",
                  color: AppColorManager.textAppColor,
                  fontSize: FontSizeManager.fs20,
                  fontWeight: FontWeight.w700,
                ),
                SizedBox(height: AppHeightManager.h5),
                // حقل الاسم الكامل
                AppTextFormField(
                  textInputType: TextInputType.name,
                  hintText: "Full Name",
                  hintStyle: const TextStyle(color: AppColorManager.textGrey),
                  onChanged: (value) {
                    entity.name = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your full name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: AppHeightManager.h1point8),
                // حقل البريد الإلكتروني
                AppTextFormField(
                  textInputType: TextInputType.text,
                  hintText: "Username (Email or Phone)",
                  hintStyle: const TextStyle(color: AppColorManager.textGrey),
                  onChanged: (value) {
                    entity.username = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your username';
                    }
                    // التحقق إذا كان إما بريد إلكتروني أو رقم هاتف
                    bool isEmail = RegExp(
                            r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$')
                        .hasMatch(value);
                    bool isPhone = RegExp(r'^[0-9]{10,15}$').hasMatch(value);

                    if (!isEmail && !isPhone) {
                      return 'Username must be a valid phone number or email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: AppHeightManager.h1point8),
                // حقل رقم الهاتف
                AppTextFormField(
                  textInputType: TextInputType.number,
                  hintText: "Phone Number",
                  hintStyle: const TextStyle(color: AppColorManager.textGrey),
                  onChanged: (value) {
                    entity.whatsapp = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    bool isPhone = RegExp(r'^[0-9]{10,15}$').hasMatch(value);
                    if (!isPhone) {
                      return 'Invalid phone number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: AppHeightManager.h1point8),
                // حقل كلمة المرور
                AppTextFormField(
                  maxLines: 1,
                  hintText: "Password",
                  hintStyle: const TextStyle(color: AppColorManager.textGrey),
                  onChanged: (value) {
                    entity.password = value;
                    checkPasswordsMatch();
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
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
                // حقل تأكيد كلمة المرور
                AppTextFormField(
                  maxLines: 1,
                  hintText: "Confirm Password",
                  hintStyle: const TextStyle(color: AppColorManager.textGrey),
                  onChanged: (value) {
                    entity.passwordConfirmation = value;
                    checkPasswordsMatch();
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    }
                    if (entity.password != value) {
                      return 'Passwords do not match';
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
                        'Passwords match',
                        style: TextStyle(color: Colors.green),
                      )
                    : Text(
                        'Passwords do not match',
                        style: TextStyle(color: Colors.red),
                      ),
                SizedBox(height: AppHeightManager.h3),
                BlocConsumer<RegisterCubit, RegisterState>(
                  listener: (context, state) {
                    if (state.status == CubitStatus.success) {
                      Navigator.of(context)
                          .pushNamed(RouteNamedScreens.verfication);
                    }
                    if (state.status == CubitStatus.error) {
                      NoteMessage.showErrorSnackBar(
                          context: context, text: "Registration failed.");
                    }
                  },
                  builder: (context, state) {
                    if (state.status == CubitStatus.loading) {
                      return const CircularProgressIndicator();
                    }
                    return MainAppButton(
                      onTap: () {
                        if (formKey.currentState?.validate() ??
                            false && passwordsMatch) {
                          context
                              .read<RegisterCubit>()
                              .register(entity: entity, context: context);
                        }
                      },
                      height: AppHeightManager.h6,
                      color: AppColorManager.mainColor,
                      alignment: Alignment.center,
                      child: AppTextWidget(
                        text: "Create Account",
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
                      text: "Already have an account?",
                      color: AppColorManager.textAppColor,
                      fontSize: FontSizeManager.fs15,
                    ),
                    SizedBox(width: AppWidthManager.w1),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(RouteNamedScreens.login);
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
      ),
    );
  }

  void checkPasswordsMatch() {
    setState(() {
      passwordsMatch = entity.password == entity.passwordConfirmation;
    });
  }
}
