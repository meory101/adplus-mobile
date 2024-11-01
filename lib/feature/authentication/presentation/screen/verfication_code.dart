import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:mzad_damascus/core/resource/color_manager.dart';
import 'package:mzad_damascus/core/resource/cubit_status_manager.dart';
import 'package:mzad_damascus/core/resource/font_manager.dart';
import 'package:mzad_damascus/core/resource/size_manager.dart';
import 'package:mzad_damascus/core/widget/app_bar/main_app_bar.dart';
import 'package:mzad_damascus/core/widget/button/main_app_button.dart';
import 'package:mzad_damascus/core/widget/snack_bar/note_message.dart';
import 'package:mzad_damascus/core/widget/text/app_text_widget.dart';
import 'package:mzad_damascus/feature/authentication/domain/entity/request/verfication_request.dart';
import 'package:mzad_damascus/feature/authentication/presentation/cubit/verfication_cubit/verfication_cubit.dart';
import 'package:mzad_damascus/feature/authentication/presentation/cubit/verfication_cubit/verfication_state.dart';
import 'package:mzad_damascus/router/router.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

class VerificationScreen extends StatefulWidget {
  final VerificationCodeArgs args;
  const VerificationScreen({Key? key, required this.args}) : super(key: key);

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
      appBar: MainAppBar(
        title: 'Verification Code',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Enter the 6-digit code sent to your Email',
              style: TextStyle(color: Colors.blue, fontSize: 15),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: PinCodeTextField(
                pinBoxBorderWidth: 1,
                pinBoxWidth: AppWidthManager.w12,
                pinBoxHeight: AppHeightManager.h6,
                maxLength: 6,
                controller: codeController,
                keyboardType: TextInputType.number,
                onDone: (value) {
                  entity.authCode = value;

                },
              ),
            ),
            SizedBox(height: 20),
            BlocConsumer<VerficationCubit, VerficationState>(
              listener: (context, state) {
                if (state.status == CubitStatus.success) {
                  Navigator.of(context)
                      .pushNamed(RouteNamedScreens.mainBottomAppBar);
                }
                if (state.status == CubitStatus.error) {
                  NoteMessage.showErrorSnackBar(
                      context: context,
                      text: "Verification failed. Please try again.");
                }
              },
              builder: (context, state) {
                if (state.status == CubitStatus.loading) {
                  return const CircularProgressIndicator();
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
                          text: "Please enter a valid 6-digit code.");
                    }
                  },
                  height: AppHeightManager.h6,
                  color: AppColorManager.mainColor,
                  alignment: Alignment.center,
                  child: AppTextWidget(
                    text: "Verify Account",
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
    );
  }
}

class VerificationCodeArgs {
  String? username;
  String? password;
  VerificationCodeArgs({required this.password, required this.username});
}
