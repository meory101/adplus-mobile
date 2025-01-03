import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzad_damascus/core/helper/validation_helper.dart';
import 'package:mzad_damascus/core/resource/color_manager.dart';
import 'package:mzad_damascus/core/resource/cubit_status_manager.dart';
import 'package:mzad_damascus/core/resource/font_manager.dart';
import 'package:mzad_damascus/core/resource/size_manager.dart';
import 'package:mzad_damascus/core/widget/app_bar/main_app_bar.dart';
import 'package:mzad_damascus/core/widget/button/main_app_button.dart';
import 'package:mzad_damascus/core/widget/snack_bar/note_message.dart';
import 'package:mzad_damascus/core/widget/text/app_text_widget.dart';
import 'package:mzad_damascus/feature/more/domain/entity/request/update_profile_username_request_entity.dart';
import 'package:mzad_damascus/feature/more/presentation/cubit/update_username_cubit/update_username_cubit.dart';
import 'package:mzad_damascus/feature/more/presentation/cubit/update_username_cubit/update_username_state.dart';
import 'package:mzad_damascus/feature/more/presentation/screen/verfiy_username_screen.dart';
import 'package:mzad_damascus/router/router.dart';
import '../../../../core/helper/phone_number_hepler.dart';
import '../../../../core/widget/form_field/title_app_form_filed.dart';
import '../../../../core/injection/injection_container.dart' as di;

class EditUsernameScreen extends StatefulWidget {
  const EditUsernameScreen({Key? key}) : super(key: key);

  @override
  _EditUsernameScreenState createState() => _EditUsernameScreenState();
}

class _EditUsernameScreenState extends State<EditUsernameScreen> {
  final TextEditingController usernameController = TextEditingController();
  UpdateUsernameRequestEntity entity = UpdateUsernameRequestEntity();
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: "editUsername".tr()), // Localized title
      body: SingleChildScrollView(
        child: BlocProvider(
          create: (context) => di.sl<UpdateUsernameCubit>(),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  TitleAppFormFiled(
                    title: "usernameRequired".tr(), // Localized title
                    hint: "nameHint".tr(), // Localized hint
                    onChanged: (value) {
                      entity.username = value;
                      return null;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "usernameRequired".tr();
                      }

                      bool isEmail = value.trim().isEmail();
                      bool isPhone = value.trim().isPhoneNumber();
                      if(isPhone==true){
                        entity.username =PhoneNumberHelper.formatPhoneNumberWithCountyCode(value);
                        print(entity.username);
                      }
                      if (!isEmail && !isPhone) {
                        return "usernameInvalid".tr();
                      }
                      return null;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25),
                    child:
                    BlocConsumer<UpdateUsernameCubit, UpdateUsernameState>(
                      listener: (context, state) {
                        if (state.status == CubitStatus.success) {
                          Navigator.of(context).pushNamed(
                              RouteNamedScreens.verfiyusername,
                              arguments: VerfiyusernameArgs(
                                  username: entity.username));
                        }
                        if (state.status == CubitStatus.error) {
                          NoteMessage.showErrorSnackBar(
                              context: context,
                              text: state.error); // Localized error message
                        }
                      },
                      builder: (context, state) {
                        if (state.status == CubitStatus.loading) {
                          return const CircularProgressIndicator();
                        }
                        return MainAppButton(
                          onTap: () {
                            if ((formKey.currentState?.validate() ?? false)) {
                              context
                                  .read<UpdateUsernameCubit>()
                                  .updateusername(
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
                              text: "saveUsername".tr(), // Localized button text
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
}