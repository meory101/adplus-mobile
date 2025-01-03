 
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 import 'package:mzad_damascus/core/resource/color_manager.dart';
import 'package:mzad_damascus/core/resource/cubit_status_manager.dart';
import 'package:mzad_damascus/core/resource/font_manager.dart';
import 'package:mzad_damascus/core/resource/size_manager.dart';
import 'package:mzad_damascus/core/widget/app_bar/main_app_bar.dart';
import 'package:mzad_damascus/core/widget/button/main_app_button.dart';
import 'package:mzad_damascus/core/widget/snack_bar/note_message.dart';
import 'package:mzad_damascus/core/widget/text/app_text_widget.dart';
import 'package:mzad_damascus/feature/more/domain/entity/request/verfiy_username_request_entity.dart';
import 'package:mzad_damascus/feature/more/presentation/cubit/verfiyusername_cubit/verfiy_username_cubit.dart';
import 'package:mzad_damascus/feature/more/presentation/cubit/verfiyusername_cubit/verfiy_username_state.dart';
import 'package:mzad_damascus/router/router.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

class VerfiyUsernameScreen extends StatefulWidget {
  final VerfiyusernameArgs args;
  const VerfiyUsernameScreen({Key? key, required this.args}) : super(key: key);

  @override
  State<VerfiyUsernameScreen> createState() => _VerfiyUsernameScreenState();
}

class _VerfiyUsernameScreenState extends State<VerfiyUsernameScreen> {
  final TextEditingController codeController = TextEditingController();
  VerifyUsernameRequestEntity entity = VerifyUsernameRequestEntity();
  @override
  void initState() {
    entity.username = widget.args.username;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: '',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'enterVerificationCode'.tr(),
              style: TextStyle(color: Colors.blue, fontSize: 15),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: PinCodeTextField(
                pinBoxBorderWidth: 1,
                pinBoxWidth: AppWidthManager.w9,
                pinBoxHeight: AppHeightManager.h6,
                maxLength: 6,
                controller: codeController,
                keyboardType: TextInputType.number,
                onDone: (value) {
                  entity.verificationCode = value;
                },
              ),
            ),
            SizedBox(height: 20),
            BlocConsumer<VerfiyUsernameCubit, VerfiyUsernameState>(
              listener: (context, state) {
                if (state.status == CubitStatus.success) {
                  Navigator.of(context)
                      .pushNamed(RouteNamedScreens.mainBottomAppBar);
                }
                if (state.status == CubitStatus.error) {
                  NoteMessage.showErrorSnackBar(
                      context: context,
                      text: state.error);
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
                          .read<VerfiyUsernameCubit>()
                          .verfiyusername(context: context, entity: entity);
                    } else {
                      NoteMessage.showErrorSnackBar(
                          context: context,
                          text: state.error);
                    }
                  },
                  height: AppHeightManager.h6,
                  color: AppColorManager.mainColor,
                  alignment: Alignment.center,
                  child: AppTextWidget(
                    text: "verify".tr(),
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

class VerfiyusernameArgs {
  String? username;
  VerfiyusernameArgs({required this.username});
}
