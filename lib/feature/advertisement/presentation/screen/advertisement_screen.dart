import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mzad_damascus/core/helper/app_image_helper.dart';
import 'package:mzad_damascus/core/helper/language_helper.dart';
import 'package:mzad_damascus/core/resource/cubit_status_manager.dart';
import 'package:mzad_damascus/core/widget/container/decorated_container.dart';
import 'package:mzad_damascus/core/widget/container/shimmer_container.dart';
import 'package:mzad_damascus/core/widget/drop_down/NameAndId.dart';
import 'package:mzad_damascus/core/widget/drop_down/title_drop_down_form_field.dart';
import 'package:mzad_damascus/core/widget/form_field/title_app_form_filed.dart';
import 'package:mzad_damascus/core/widget/snack_bar/note_message.dart';
import 'package:mzad_damascus/feature/advertisement/presentation/cubit/add_advertisement_cubit/add_advertisement_cubit.dart';
import 'package:mzad_damascus/feature/advertisement/presentation/cubit/add_advertisement_cubit/add_advertisement_state.dart';
import 'package:mzad_damascus/feature/advertisement/presentation/cubit/get_cities_cubit/get_category_attributes_cubit.dart';
import 'package:mzad_damascus/feature/advertisement/presentation/cubit/get_cities_cubit/get_category_attributes_state.dart';
import 'package:mzad_damascus/feature/advertisement/presentation/screen/category_attribute_form_screen.dart';
import 'package:mzad_damascus/router/router.dart';
import '../../../../core/resource/color_manager.dart';
import '../../../../core/resource/font_manager.dart';
import '../../../../core/resource/icon_manager.dart';
import '../../../../core/resource/size_manager.dart';
import '../../../../core/widget/bottom_sheet/wheel_date_picker.dart';
import '../../../../core/widget/container/dialog_container.dart';
import '../../../../core/widget/text/app_text_widget.dart';
import '../../domain/entity/response/get_cities_response_entity.dart';
import '../widget/advertisement_app_bar.dart';
import '../widget/advertisement_next_button.dart';

class AdvertisementScreen extends StatefulWidget {
  const AdvertisementScreen({super.key});

  @override
  State<AdvertisementScreen> createState() => _AdvertisementScreenState();
}

class _AdvertisementScreenState extends State<AdvertisementScreen> {
  List<File> advFiles = [];
  Map data = {};
  GlobalKey<FormState> formKey = GlobalKey();
  DateTime? dateTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: BlocConsumer<AddAdvertisementCubit, AddAdvertisementState>(
        listener: (context, state) {
          if (state.status == CubitStatus.error) {
            NoteMessage.showErrorSnackBar(context: context, text: state.error);
          }
          if (state.status == CubitStatus.success) {
            Navigator.of(context).pushNamedAndRemoveUntil(
              RouteNamedScreens.mainBottomAppBar,
                  (route) => false,
            );
          }
        },
        builder: (context, state) {
          if (state.status == CubitStatus.loading) {
            return const CircularProgressIndicator();
          }
          return AdvertisementNextButton(
            buttonText: "addAdvertisement".tr(), // Localized text
            onTap: () async {
              if (formKey.currentState!.validate() && advFiles.isNotEmpty) {
                context.read<AddAdvertisementCubit>().addAdvertisement(
                  context: context,
                  entity: AdvertisementModel.entity!,
                  files: advFiles,
                );
              } else {
                NoteMessage.showErrorSnackBar(
                  context: context,
                  text: "enterRequiredFields".tr(), // Localized text
                );
              }
            },
          );
        },
      ),
      body: DialogContainer(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                const AdvertisementAppBar(completePercent: 1),
                SizedBox(height: AppHeightManager.h2point5),
                Wrap(
                  children: [
                    DecoratedContainer(
                      borderRadius: BorderRadius.circular(AppRadiusManager.r15),
                      color: AppColorManager.lightGreyOpacity6,
                      width: AppWidthManager.w20,
                      height: AppWidthManager.w20,
                      margin: EdgeInsets.only(
                        right: LanguageHelper.checkIfLTR(context: context) ? AppWidthManager.w3Point8 : 0,
                        left: !LanguageHelper.checkIfLTR(context: context) ? AppWidthManager.w3Point8 : 0,
                        bottom: AppHeightManager.h1point8,
                      ),
                      child: IconButton(
                        splashColor: AppColorManager.transparent,
                        highlightColor: AppColorManager.transparent,
                        onPressed: () async {
                          File? advFile = await AppImageHelper.pickImageFrom(source: ImageSource.gallery);
                          if (advFile != null) {
                            setState(() {
                              advFiles.add(advFile);
                            });
                          }
                        },
                        icon: const Icon(size: 30, Icons.add, color: AppColorManager.textGrey),
                      ),
                    ),
                    Visibility(
                      visible: advFiles.isNotEmpty,
                      child: Wrap(
                        children: List.generate(
                          advFiles.length,
                              (index) {
                            return DecoratedContainer(
                              borderRadius: BorderRadius.circular(AppRadiusManager.r15),
                              color: AppColorManager.lightGreyOpacity6,
                              width: AppWidthManager.w20,
                              height: AppWidthManager.w20,
                              margin: EdgeInsets.only(
                                right: LanguageHelper.checkIfLTR(context: context) ? AppWidthManager.w3Point8 : 0,
                                left: !LanguageHelper.checkIfLTR(context: context) ? AppWidthManager.w3Point8 : 0,
                                bottom: AppHeightManager.h1point8,
                              ),
                              image: DecorationImage(
                                image: FileImage(advFiles[index]),
                                fit: BoxFit.cover,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: AppHeightManager.h2point5),
                BlocConsumer<GetCitiesCubit, GetCitiesState>(
                  listener: (context, state) {
                    if (state.status == CubitStatus.error) {
                      NoteMessage.showErrorSnackBar(context: context, text: state.error);
                    }
                  },
                  builder: (context, state) {
                    if (state.status == CubitStatus.loading) {
                      return ShimmerContainer(width: AppWidthManager.w100, height: AppHeightManager.h6);
                    }
                    List<NameAndId> citiesOptions = [];
                    List<City> cities = state.entity.data ?? [];
                    cities.forEach((city) {
                      citiesOptions.add(NameAndId(
                        name: LanguageHelper.checkIfLTR(context: context) ? city.enName ?? "" : city.arName ?? "",
                        id: city.cityId.toString(),
                      ));
                    });
                    return TitleDropDownFormFieldWidget(
                      validator: (city) {
                        if ((city?.name ?? "").isEmpty) {
                          return "required".tr(); // Localized text
                        }
                      },
                      onChanged: (selectedCity) {
                        AdvertisementModel.entity?.cityId = num.parse(selectedCity?.id ?? "0");
                      },
                      hint: 'city'.tr(), // Localized text
                      title: 'city'.tr(), // Localized text
                      options: citiesOptions,
                    );
                  },
                ),
                SizedBox(height: AppHeightManager.h1point8),
                TitleAppFormFiled(
                  hint: "title".tr(), // Localized text
                  title: "title".tr(), // Localized text
                  onChanged: (value) {
                    AdvertisementModel.entity?.name = value;
                    return null;
                  },
                  validator: (value) {
                    if ((value ?? "").isEmpty) {
                      return "required".tr(); // Localized text
                    }
                    return null;
                  },
                ),
                SizedBox(height: AppHeightManager.h1point8),
                TitleAppFormFiled(
                  hint: "description".tr(), // Localized text
                  title: "description".tr(), // Localized text
                  onChanged: (value) {
                    AdvertisementModel.entity?.description = value;
                    return null;
                  },
                  validator: (value) {
                    if ((value ?? "").isEmpty) {
                      return "required".tr(); // Localized text
                    }
                    return null;
                  },
                ),
                SizedBox(height: AppHeightManager.h1point8),
                TitleAppFormFiled(
                  textInputType: TextInputType.number,
                  hint: "price".tr(), // Localized text
                  title: "price".tr(), // Localized text
                  onChanged: (value) {
                    AdvertisementModel.entity?.startingPrice = num.parse(value ?? "0");
                    return null;
                  },
                  validator: (value) {
                    return null;
                  },
                ),
                SizedBox(height: AppHeightManager.h9),
              ],
            ),
          ),
        ),
      ),
    );
  }
}