import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzad_damascus/core/resource/color_manager.dart';
import 'package:mzad_damascus/core/resource/cubit_status_manager.dart';
import 'package:mzad_damascus/core/resource/font_manager.dart';
import 'package:mzad_damascus/core/resource/image_manager.dart';
import 'package:mzad_damascus/core/resource/size_manager.dart';
import 'package:mzad_damascus/core/widget/app_bar/main_app_bar.dart';
import 'package:mzad_damascus/core/widget/button/main_app_button.dart';
import 'package:mzad_damascus/core/widget/image/main_image_widget.dart';
import 'package:mzad_damascus/core/widget/snack_bar/note_message.dart';
import 'package:mzad_damascus/core/widget/text/app_text_widget.dart';
import 'package:mzad_damascus/feature/authentication/domain/entity/request/verfication_request.dart';
import 'package:mzad_damascus/feature/authentication/presentation/cubit/verfication_cubit/verfication_cubit.dart';
import 'package:mzad_damascus/feature/authentication/presentation/cubit/verfication_cubit/verfication_state.dart';
import 'package:mzad_damascus/router/router.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

class VerificationScreen extends StatefulWidget {
  final VerificationCodeArgs args;
  const VerificationScreen({super.key, required this.args});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final TextEditingController codeController = TextEditingController();
  VerificationRequestEntity entity = VerificationRequestEntity();

  @override
  void initState() {
    entity.username = widget.args.username;
    entity.password = widget.args.password;
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: AppHeightManager.h15,
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
                color: AppColorManager.textAppColor,
                fontSize: FontSizeManager.fs20,
                fontWeight: FontWeight.w700,
                text: 'verificationCode'.tr(),
              ),
              SizedBox(
                height: AppHeightManager.h10,
              ),
              AppTextWidget(
                  text: 'enterVerificationCode'.tr(),
                  color: Colors.orange,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  fontSize: FontSizeManager.fs15),
              Padding(
                padding: EdgeInsets.all(AppWidthManager.w3Point8),
                child: PinCodeTextField(
                  pinBoxBorderWidth: 2,
                  pinBoxWidth: AppWidthManager.w10,
                  pinBoxHeight: AppWidthManager.w10,
                  maxLength: 6,
                  pinBoxRadius: AppRadiusManager.r10,
                  defaultBorderColor: AppColorManager.grey,
                  controller: codeController,
                  keyboardType: TextInputType.number,
                  onDone: (value) {
                    if (value.isNotEmpty && value.length == 6) {
                      entity.authCode = value;
                      context
                          .read<VerficationCubit>()
                          .verifyCode(value, context: context, entity: entity);
                    } else {
                      NoteMessage.showErrorSnackBar(
                          context: context, text: "validCodeRequired".tr());
                    }
                  },
                ),
              ),
              SizedBox(height: AppHeightManager.h2),
              BlocConsumer<VerficationCubit, VerficationState>(
                listener: (context, state) {
                  if (state.status == CubitStatus.success) {
                    if (myRoute == RouteNamedScreens.mainBottomAppBar) {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        RouteNamedScreens.mainBottomAppBar,
                        (route) => false,
                      );
                      return;
                    }

                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  }
                  if (state.status == CubitStatus.error) {
                    NoteMessage.showErrorSnackBar(
                        context: context,
                        text: "verificationFailed"
                            .tr()); // Localized error message
                  }
                },
                builder: (context, state) {
                  if (state.status == CubitStatus.loading) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return MainAppButton(
                    onTap: () {
                      final code = codeController.text;
                      if (code.isNotEmpty && code.length == 6) {
                        context
                            .read<VerficationCubit>()
                            .verifyCode(code, context: context, entity: entity);
                      } else {
                        NoteMessage.showErrorSnackBar(
                            context: context,
                            text: "validCodeRequired".tr()); // Localized prompt
                      }
                    },
                    height: AppHeightManager.h6,
                    color: AppColorManager.orange,
                    alignment: Alignment.center,
                    child: AppTextWidget(
                      text: "verifyAccount".tr(), // Localized button text
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
    );
  }
}

class VerificationCodeArgs {
  String? username;
  String? password;
  VerificationCodeArgs({required this.password, required this.username});
}
