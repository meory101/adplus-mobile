import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mzad_damascus/core/resource/constant_manager.dart';
import 'package:mzad_damascus/core/resource/cubit_status_manager.dart';
import 'package:mzad_damascus/core/resource/font_manager.dart';
import 'package:mzad_damascus/core/widget/app_bar/main_app_bar.dart';
import 'package:mzad_damascus/core/widget/button/main_app_button.dart';
import 'package:mzad_damascus/core/widget/form_field/title_app_form_filed.dart';
import 'package:mzad_damascus/core/widget/image/main_image_widget.dart';
import 'package:mzad_damascus/core/widget/loading/app_circular_progress_widget.dart';
import 'package:mzad_damascus/core/widget/snack_bar/note_message.dart';
import 'package:mzad_damascus/core/widget/text/app_text_widget.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/request/update_profile_request_entity.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/response/get_profile_info_response_entity.dart';
import 'package:mzad_damascus/feature/profile/presentation/cubit/get_profile_cubit/get_profile_info_cubit.dart';
import 'package:mzad_damascus/feature/profile/presentation/cubit/update_profile_cubit/update_profile_cubit.dart';
import 'package:mzad_damascus/feature/profile/presentation/cubit/update_profile_image_cubit/update_profile_image_cubit.dart';
import 'package:mzad_damascus/router/router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/helper/app_image_helper.dart';
import '../../../../core/helper/language_helper.dart';
import '../../../../core/resource/color_manager.dart';
import '../../../../core/resource/image_manager.dart';
import '../../../../core/resource/size_manager.dart';
import '../../../../core/widget/form_field/app_form_field.dart';

class ProfileInfoModificationScreen extends StatefulWidget {
  final ProfileInfoModificationArgs args;

  const ProfileInfoModificationScreen({super.key, required this.args});

  @override
  State<ProfileInfoModificationScreen> createState() =>
      _ProfileInfoModificationScreenState();
}

class _ProfileInfoModificationScreenState
    extends State<ProfileInfoModificationScreen> {
  File? profileImage;
  UpdateProfileRequestEntity entity = UpdateProfileRequestEntity();

  GlobalKey<FormState> formKey = GlobalKey();
  @override
  void initState() {
    profileImage =null;
    entity.username = widget.args.profileInfo?.user?.username;
    entity.name = widget.args.profileInfo?.user?.name;
    entity.description = widget.args.profileInfo?.user?.description;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(title: "edit profile"),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppWidthManager.w3Point8),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Visibility(
                      visible: profileImage?.path == null,
                      replacement: Container(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        alignment: Alignment.center,
                        width: AppWidthManager.w25,
                        height: AppWidthManager.w25,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: AppColorManager.lightGreyOpacity6,
                                offset: const Offset(
                                  -2,
                                  2,
                                ),
                                blurRadius: 4,
                                spreadRadius: 4)
                          ],
                          color: AppColorManager.shimmerBaseColor,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: FileImage(
                              profileImage ?? File(""),
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      child: (widget.args.profileInfo?.user?.photo ?? '')
                              .isNotEmpty
                          ? Container(
                              clipBehavior: Clip.antiAliasWithSaveLayer,

                              // alignment: Alignment.center,
                              width: AppWidthManager.w25,
                              height: AppWidthManager.w25,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  LanguageHelper.checkIfLTR(context: context)
                                      ? BoxShadow(
                                          color:
                                              AppColorManager.lightGreyOpacity6,
                                          offset: const Offset(4, -2),
                                          blurRadius: 7,
                                          spreadRadius: 1,
                                        )
                                      : BoxShadow(
                                          color:
                                              AppColorManager.lightGreyOpacity6,
                                          offset: const Offset(-4, -2),
                                          blurRadius: 7,
                                          spreadRadius: 1,
                                        )
                                ],
                                shape: BoxShape.circle,
                              ),
                              child: MainImageWidget(
                                imageUrl: (AppConstantManager.imageBaseUrl +
                                    (widget.args.profileInfo?.user?.photo ??
                                        "")),
                              ))
                          : Container(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              alignment: Alignment.center,
                              width: AppWidthManager.w20,
                              height: AppWidthManager.w20,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: AppColorManager.lightGreyOpacity6,
                                      offset: const Offset(
                                        -2,
                                        2,
                                      ),
                                      blurRadius: 4,
                                      spreadRadius: 4)
                                ],
                                color: AppColorManager.shimmerBaseColor,
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage(
                                    AppImageManager.placeholder,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                    ),
                    Positioned(
                      bottom: AppHeightManager.h1,
                      left: AppWidthManager.w12,
                      right: 0,
                      child: InkWell(
                        overlayColor: const WidgetStatePropertyAll(
                            AppColorManager.transparent),
                        onTap: () async {
                          profileImage = await AppImageHelper.pickImageFrom(
                              source: ImageSource.gallery);
                          setState(() {});
                        },
                        child: Container(
                          padding: EdgeInsets.all(AppWidthManager.w1),
                          decoration: const BoxDecoration(
                              color: AppColorManager.textAppColor,
                              shape: BoxShape.circle),
                          child: Icon(
                            Icons.edit,
                            color: AppColorManager.white,
                            size: 14.px,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: AppHeightManager.h4,
                ),
                TitleAppFormFiled(
                  initValue: widget.args.profileInfo?.user?.name ?? "",
                  title: "name (required)",
                  hint: "name",
                  onChanged: (value) {
                    entity.name = value ?? "";
                    return null;
                  },
                  validator: (value) {
                    if ((value ?? "").isEmpty) {
                      return "required";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: AppHeightManager.h1point8,
                ),
                TitleAppFormFiled(
                  initValue: widget.args.profileInfo?.user?.description ?? "",
                  title: "Description ",
                  hint: "description",
                  onChanged: (value) {
                    entity.description = value ?? "";
                    return null;
                  },
                  validator: (value) {
                    if ((value ?? "").isEmpty) {
                      return "required";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: AppHeightManager.h1point8,
                ),
                SizedBox(
                  height: AppHeightManager.h4,
                ),
                BlocConsumer<UpdateProfileImageCubit, UpdateProfileImageState>(
                  listener: (context, state) {
                    if (state.status == CubitStatus.success) {
                      print('success hereeeeeeeeeeeeeeeeeeeeee');
                      Navigator.of(context).pop();
                    }
                    if (state.status == CubitStatus.error) {
                      NoteMessage.showErrorSnackBar(
                          context: context, text: state.error);
                    }
                  },
                  builder: (context, state) {
                    if(state.status ==CubitStatus.loading){
                      return const AppCircularProgressWidget();
                    }
                    return BlocConsumer<UpdateProfileCubit, UpdateProfileState>(
                      listener: (context, state) {
                        if (state.status == CubitStatus.error) {
                          NoteMessage.showErrorSnackBar(
                              context: context, text: state.error);
                        }
                        if (state.status == CubitStatus.success) {
                          if (profileImage != null) {
                            context
                                .read<UpdateProfileImageCubit>()
                                .updateProfile(
                                    context: context,
                                    profileImage: profileImage!);

                          }
                        else{
                            Navigator.of(context).pop();
                          }

                        }
                      },
                      builder: (context, state) {
                        if (state.status == CubitStatus.loading) {
                          return const CircularProgressIndicator();
                        }
                        return MainAppButton(
                          onTap: () {
                            if ((formKey.currentState?.validate() ?? false)) {
                              context.read<UpdateProfileCubit>().updateProfile(
                                  context: context, entity: entity);
                            }
                          },
                          alignment: Alignment.center,
                          width: AppWidthManager.w100,
                          height: AppHeightManager.h6,
                          color: AppColorManager.mainColor,
                          child: AppTextWidget(
                            text: "save",
                            fontSize: FontSizeManager.fs15,
                            fontWeight: FontWeight.w500,
                            color: AppColorManager.white,
                          ),
                        );
                      },
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileInfoModificationArgs {
  ProfileInfo? profileInfo;

  ProfileInfoModificationArgs({required this.profileInfo});
}
