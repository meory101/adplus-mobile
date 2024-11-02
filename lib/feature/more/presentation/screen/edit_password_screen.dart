import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzad_damascus/core/resource/color_manager.dart';
import 'package:mzad_damascus/core/resource/cubit_status_manager.dart';
import 'package:mzad_damascus/core/resource/size_manager.dart';
import 'package:mzad_damascus/core/widget/app_bar/main_app_bar.dart';
import 'package:mzad_damascus/core/widget/button/main_app_button.dart';
import 'package:mzad_damascus/core/widget/form_field/app_form_field.dart';
import 'package:mzad_damascus/core/widget/snack_bar/note_message.dart';
import 'package:mzad_damascus/core/widget/text/app_text_widget.dart';
import 'package:mzad_damascus/feature/home/presentation/widget/adv_details/comments_section.dart';
import 'package:mzad_damascus/feature/more/domain/entity/request/edit_password_request_entity.dart';
import 'package:mzad_damascus/feature/more/domain/entity/request/update_profile_username_request_entity.dart';
import 'package:mzad_damascus/feature/more/presentation/cubit/edit_password_cubit/edit_password_cubit.dart';
import 'package:mzad_damascus/feature/more/presentation/cubit/edit_password_cubit/edit_password_state.dart';
import 'package:mzad_damascus/feature/more/presentation/cubit/update_username_cubit/update_username_cubit.dart';
import 'package:mzad_damascus/feature/more/presentation/cubit/update_username_cubit/update_username_state.dart';
import 'package:mzad_damascus/feature/more/presentation/screen/verfiy_username_screen.dart';
import 'package:mzad_damascus/router/router.dart';

import '../../../../core/widget/form_field/title_app_form_filed.dart';
import '../../../../core/injection/injection_container.dart' as di;

class EditPasswordScreen extends StatefulWidget {
  const EditPasswordScreen({Key? key}) : super(key: key);

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
      appBar: MainAppBar(title: "Edit Password"),
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
                  SizedBox(height: AppHeightManager.h1point8),
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
                  Padding(
                    padding: const EdgeInsets.all(25),
                    child: BlocConsumer<EditPasswordCubit, EditPasswordState>(
                      listener: (context, state) {
                        if (state.status == CubitStatus.success) {
                          NoteMessage.showSuccessSnackBar(
                              context: context, text: 'Passwor change');
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
                            print(
                                "sssssssssssssssssssssssssssssssssssssssssssssssssss");
                            print(entity.password);
                            if ((formKey.currentState?.validate() ?? false)) {
                              print('kkkkk');
                              context.read<EditPasswordCubit>().editpassword(
                                    context: context,
                                    entity: entity,
                                  );
                            }
                          },
                          borderRadius: BorderRadius.circular(10),
                          color: AppColorManager.mainColor,
                          height: AppHeightManager.h5,
                          width: AppWidthManager.w30,
                          child: Center(
                            child: AppTextWidget(
                              text: "Save New Password",
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

  void checkPasswordsMatch() {
    setState(() {
      passwordsMatch = entity.password == entity.passwordConfirmation;
    });
  }
}
