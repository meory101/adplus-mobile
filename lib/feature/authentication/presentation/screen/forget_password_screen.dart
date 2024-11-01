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
import 'package:mzad_damascus/feature/authentication/domain/entity/request/forget_password_request_entity.dart';
import 'package:mzad_damascus/feature/authentication/presentation/cubit/forget_password_cubit/forget_password_cubit.dart';
import 'package:mzad_damascus/feature/authentication/presentation/cubit/forget_password_cubit/forget_password_state.dart';
import 'package:mzad_damascus/feature/authentication/presentation/screen/reset_password_screen.dart';
import 'package:mzad_damascus/feature/authentication/presentation/screen/verfication_code.dart';
import 'package:mzad_damascus/router/router.dart';
import '../../../../core/resource/size_manager.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final ForgetPasswordRequestEntity entity = ForgetPasswordRequestEntity();
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              top: AppHeightManager.h40,
              left: AppWidthManager.w5,
              right: AppWidthManager.w5),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                AppTextWidget(
                  text: "Reset Your Password",
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
                  hintText: "Enter your email",
                  hintStyle: const TextStyle(color: AppColorManager.textGrey),
                  onChanged: (value) {
                    entity.username = value;
                    return null;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    bool isEmail = RegExp(
                            r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$')
                        .hasMatch(value);
                    if (!isEmail) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
                SizedBox(height: AppHeightManager.h4),
                BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
                  listener: (context, state) {
                    if (state.status == CubitStatus.success) {
                      Navigator.of(context).pushNamed(
                        RouteNamedScreens.resetpassword,
                      );
                    }
                    if (state.status == CubitStatus.error) {
                      NoteMessage.showErrorSnackBar(
                          context: context,
                          text: state.error ?? "Error occurred");
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
                              .read<ForgetPasswordCubit>()
                              .forgetPassword(context: context, entity: entity);
                        }
                      },
                      height: AppHeightManager.h6,
                      color: AppColorManager.mainColor,
                      alignment: Alignment.center,
                      child: AppTextWidget(
                        text: "Send Reset Link",
                        color: AppColorManager.white,
                        fontSize: FontSizeManager.fs16,
                        fontWeight: FontWeight.w600,
                      ),
                    );
                  },
                ),
                SizedBox(height: AppHeightManager.h4)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
