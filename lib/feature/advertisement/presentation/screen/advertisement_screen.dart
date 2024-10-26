import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mzad_damascus/core/helper/app_image_helper.dart';
import 'package:mzad_damascus/core/helper/language_helper.dart';
import 'package:mzad_damascus/core/resource/cubit_status_manager.dart';
import 'package:mzad_damascus/core/resource/image_manager.dart';
import 'package:mzad_damascus/core/widget/container/decorated_container.dart';
import 'package:mzad_damascus/core/widget/container/shimmer_container.dart';
import 'package:mzad_damascus/core/widget/drop_down/NameAndId.dart';
import 'package:mzad_damascus/core/widget/drop_down/title_drop_down_form_field.dart';
import 'package:mzad_damascus/core/widget/form_field/title_app_form_filed.dart';
import 'package:mzad_damascus/core/widget/snack_bar/note_message.dart';
import 'package:mzad_damascus/feature/advertisement/presentation/cubit/get_cities_cubit/get_category_attributes_cubit.dart';
import 'package:mzad_damascus/feature/advertisement/presentation/cubit/get_cities_cubit/get_category_attributes_state.dart';
import 'package:mzad_damascus/feature/advertisement/presentation/screen/category_attribute_form_screen.dart';

import '../../../../core/resource/color_manager.dart';
import '../../../../core/resource/font_manager.dart';
import '../../../../core/resource/size_manager.dart';
import '../../../../core/widget/container/dialog_container.dart';
import '../../../../core/widget/text/app_text_widget.dart';
import '../../../../router/router.dart';
import '../../domain/entity/response/get_cities_response_entity.dart';
import '../widget/advertisement_app_bar.dart';
import '../widget/advertisement_next_button.dart';

class AdvertisementScreen extends StatefulWidget {
  const AdvertisementScreen({super.key});

  @override
  State<AdvertisementScreen> createState() => _AdvertisementScreenState();
}

class _AdvertisementScreenState extends State<AdvertisementScreen> {
  @override
  void initState() {
    super.initState();
  }
  List<File> advFiles = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: AdvertisementNextButton(
        onTap: () {

          print(AdvertisementModel.entity?.name);
          print(AdvertisementModel.entity?.description);
          print(AdvertisementModel.entity?.startingPrice);
          print(AdvertisementModel.entity?.keywords);//
          print(AdvertisementModel.entity?.cityId);
          print(AdvertisementModel.entity?.minIncreasePrice);
          print(AdvertisementModel.entity?.bidingStartTime);
          print(AdvertisementModel.entity?.categoryId);//
          print(AdvertisementModel.entity?.attributes);//
          print('000000000000000000000');
        },
      ),
      body: DialogContainer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              const AdvertisementAppBar(
                completePercent: 0,
              ),
              SizedBox(
                height: AppHeightManager.h2point5,
              ),
              Wrap(
                children: [
                  DecoratedContainer(
                    borderRadius: BorderRadius.circular(AppRadiusManager.r15),
                    color: AppColorManager.lightGreyOpacity6,
                    width: AppWidthManager.w20,
                    height: AppWidthManager.w20,
                    margin: EdgeInsets.only(
                        right: LanguageHelper.checkIfLTR(context: context)
                            ? AppWidthManager.w3Point8
                            : 0,
                        left: !LanguageHelper.checkIfLTR(context: context)
                            ? AppWidthManager.w3Point8
                            : 0,
                        bottom: AppHeightManager.h1point8),
                    child: IconButton(
                      splashColor: AppColorManager.transparent,
                      highlightColor: AppColorManager.transparent,
                      onPressed: () async {
                        File? advFile = await AppImageHelper.pickImageFrom(
                            source: ImageSource.gallery);
                        if (advFile != null) {
                          setState(() {
                            print('weeeeeeeeeeeeeeee');
                            advFiles.add(advFile);
                          });
                        }
                      },
                      icon: const Icon(
                        size: 30,
                        Icons.add,
                        color: AppColorManager.textGrey,
                      ),
                    ),
                  ),
                  Visibility(
                      visible: advFiles.isNotEmpty,
                      child: Wrap(
                        children: List.generate(
                          advFiles.length,
                          (index) {
                            print('eeeeeeeeeeeeee');
                            return DecoratedContainer(
                              borderRadius:
                                  BorderRadius.circular(AppRadiusManager.r15),
                              color: AppColorManager.lightGreyOpacity6,
                              width: AppWidthManager.w20,
                              height: AppWidthManager.w20,
                              margin: EdgeInsets.only(
                                  right: LanguageHelper.checkIfLTR(
                                          context: context)
                                      ? AppWidthManager.w3Point8
                                      : 0,
                                  left: !LanguageHelper.checkIfLTR(
                                          context: context)
                                      ? AppWidthManager.w3Point8
                                      : 0,
                                  bottom: AppHeightManager.h1point8),
                              image: DecorationImage(
                                image: FileImage(
                                  advFiles[index],
                                ),
                                fit: BoxFit.cover,
                              ),
                            );
                          },
                        ),
                      ))
                ],
              ),
              SizedBox(
                height: AppHeightManager.h2point5,
              ),
              BlocConsumer<GetCitiesCubit, GetCitiesState>(
                listener: (context, state) {
                  if (state.status == CubitStatus.error) {
                    //TODO
                    NoteMessage.showErrorSnackBar(context: context, text: "");
                  }
                },
                builder: (context, state) {
                  if (state.status == CubitStatus.loading) {
                    return ShimmerContainer(
                        width: AppWidthManager.w100,
                        height: AppHeightManager.h6);
                  }
                  List<NameAndId> citiesOptions = [];
                  List<City> cities = state.entity.data ?? [];
                  cities.forEach(
                    (city) {
                      citiesOptions.add(NameAndId(
                          name: LanguageHelper.checkIfLTR(context: context)
                              ? city.enName ?? ""
                              : city.arName ?? "",
                          id: city.cityId.toString()));
                    },
                  );
                  return TitleDropDownFormFieldWidget(
                    onChanged: (selectedCity) {
                      AdvertisementModel.entity?.cityId = num.parse(selectedCity?.id??"0");
                    },
                      hint: 'city', title: 'city', options: citiesOptions);
                },
              ),
              SizedBox(
                height: AppHeightManager.h1point8,
              ),
              TitleAppFormFiled(
                hint: "title",
                title: "title",
                onChanged: (value) {
                 AdvertisementModel.entity?.name = value;

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
                hint: "description",
                title: "description",
                onChanged: (value) {
                  AdvertisementModel.entity?.description = value;
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
                textInputType: TextInputType.number,
                hint: "starting price",
                title: "starting price",
                onChanged: (value) {
                  AdvertisementModel.entity?.startingPrice = num.parse(value??"0");

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
                textInputType: TextInputType.number,
                hint: "min increase price",
                title: "min increase price",
                onChanged: (value) {
                  AdvertisementModel.entity?.minIncreasePrice = num.parse(value??"0");

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
                textInputType: TextInputType.datetime,
                hint: "start time",
                title: "start time",
                onChanged: (value) {
                  AdvertisementModel.entity?.bidingStartTime = value??"";

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
                height: AppHeightManager.h9,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
