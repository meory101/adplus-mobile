import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzad_damascus/core/resource/color_manager.dart';
import 'package:mzad_damascus/core/resource/cubit_status_manager.dart';
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
      appBar: MainAppBar(title: "Edit UserName"),
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
                    title: "Username (required)",
                    hint: "Name",
                    onChanged: (value) {
                      entity.username = value ?? "";
                      return null;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your username';
                      }

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
                              text: "Failed to update username");
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
                          width: AppWidthManager.w25,
                          child: Center(
                            child: AppTextWidget(
                              text: "Save Username",
                              color: AppColorManager.background,
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
