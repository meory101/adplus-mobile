import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mzad_damascus/core/model/currency.dart';
import 'package:mzad_damascus/core/resource/enum_manager.dart';
import 'package:mzad_damascus/core/widget/app_bar/main_app_bar.dart';
import 'package:mzad_damascus/feature/advertisement/domain/entity/request/add_advertisement_request_entity.dart';
import 'package:mzad_damascus/feature/advertisement/presentation/cubit/currency/currency_cubit.dart';
import 'package:mzad_damascus/feature/advertisement/presentation/cubit/currency/currency_state.dart';
import 'package:mzad_damascus/feature/advertisement/presentation/cubit/update_adv_cubit/update_advertisement_cubit.dart';
import 'package:mzad_damascus/feature/advertisement/presentation/cubit/update_adv_cubit/update_advertisement_state.dart';
import '../../../../core/helper/app_image_helper.dart';
import '../../../../core/helper/language_helper.dart';
import '../../../../core/resource/color_manager.dart';
import '../../../../core/resource/constant_manager.dart';
import '../../../../core/resource/cubit_status_manager.dart';
import '../../../../core/resource/size_manager.dart';
import '../../../../core/widget/container/decorated_container.dart';
import '../../../../core/widget/container/shimmer_container.dart';
import '../../../../core/widget/drop_down/NameAndId.dart';
import '../../../../core/widget/drop_down/title_drop_down_form_field.dart';
import '../../../../core/widget/form_field/title_app_form_filed.dart';
import '../../../../core/widget/image/main_image_widget.dart';
import '../../../../core/widget/snack_bar/note_message.dart';
import '../../../advertisement/domain/entity/response/get_cities_response_entity.dart';
import '../../../advertisement/presentation/cubit/get_cities_cubit/get_category_attributes_cubit.dart';
import '../../../advertisement/presentation/cubit/get_cities_cubit/get_category_attributes_state.dart';
import '../../../advertisement/presentation/screen/category_attribute_form_screen.dart';
import '../../../advertisement/presentation/widget/advertisement_next_button.dart';
import '../../../home/domain/entity/response/advs_by_attribute_response_entity.dart';

class UpdateAdvScreen extends StatefulWidget {
  final UpdateAdvArgs args;

  const UpdateAdvScreen({super.key, required this.args});

  @override
  State<UpdateAdvScreen> createState() => _UpdateAdvScreenState();
}

class _UpdateAdvScreenState extends State<UpdateAdvScreen> {
  List<File> advFiles = [];
  Map data = {};
  GlobalKey<FormState> formKey = GlobalKey();
  DateTime? dateTime;
  AddAdvertisementRequestEntity entity = AddAdvertisementRequestEntity();

  @override
  void initState() {
    entity.itemId = widget.args.data.itemId;
    entity.keywords = widget.args.data.keywords;
    entity.attributes = widget.args.data.attributes;
    entity.categoryId = widget.args.data.categoryId;
    entity.name = widget.args.data.name;
    entity.description = widget.args.data.description;
    entity.startingPrice = widget.args.data.startingPrice;
    entity.biddingStatus = widget.args.data.biddingStatus;
    entity.cityId = widget.args.data.cityId;
    entity.currencyId = widget.args.data.currency?.currencyId;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet:
          BlocConsumer<UpdateAdvertisementCubit, UpdateAdvertisementState>(
        listener: (context, state) {
          if (state.status == CubitStatus.error) {
            NoteMessage.showErrorSnackBar(context: context, text: state.error);
          }
          if (state.status == CubitStatus.success) {
            Navigator.of(context).pop();
          }
        },
        builder: (context, state) {
          if (state.status == CubitStatus.loading) {
            return const CircularProgressIndicator();
          }
          return AdvertisementNextButton(
              buttonText: "save".tr(), // Localized text
              onTap: () async {
                // if (formKey.currentState!.validate() && advFiles.isNotEmpty) {
                context.read<UpdateAdvertisementCubit>().updateAdvertisement(
                      context: context,
                      entity: entity,
                      files: advFiles,
                      // );
                      // } else {
                      //   NoteMessage.showErrorSnackBar(
                      //     context: context,
                      //     text: "enterRequiredFields".tr(), // Localized text
                    );
              });
        },
      ),
      appBar: MainAppBar(title: ""),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: AppWidthManager.w3Point8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [

                  CarouselSlider(
                    options: CarouselOptions(
                      onPageChanged: (index, reason) {
                        setState(() {});
                      },
                      aspectRatio: AppWidthManager.w92 / AppHeightManager.h20,
                      enableInfiniteScroll: true,
                      autoPlay: true,
                      viewportFraction: 1,
                    ),
                    items: List.generate(
                      widget.args.data.photos?.length ?? 0,
                      (index) {
                        return Container(
                          width: AppWidthManager.w92,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(AppRadiusManager.r10)),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: MainImageWidget(
                            imageUrl: AppConstantManager.imageBaseUrl +
                                (widget.args.data.photos?[index].photo ?? ""),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: AppHeightManager.h2,
                  ),
                  Wrap(
                    children: [
                      DecoratedContainer(
                        borderRadius:
                            BorderRadius.circular(AppRadiusManager.r15),
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
                          bottom: AppHeightManager.h1point8,
                        ),
                        child: IconButton(
                          splashColor: AppColorManager.transparent,
                          highlightColor: AppColorManager.transparent,
                          onPressed: () async {
                            File? advFile = await AppImageHelper.pickImageFrom(
                                source: ImageSource.gallery);
                            if (advFile != null) {
                              setState(() {
                                advFiles.add(advFile);
                              });
                            }
                          },
                          icon: const Icon(
                              size: 30,
                              Icons.add,
                              color: AppColorManager.textGrey),
                        ),
                      ),
                      Visibility(
                        visible: advFiles.isNotEmpty,
                        child: Wrap(
                          children: List.generate(
                            advFiles.length,
                            (index) {
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
                        NoteMessage.showErrorSnackBar(
                            context: context, text: state.error);
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
                      String? initValue;
                      for (var city in cities) {
                        if (city.cityId == entity.cityId) {
                          initValue =
                              LanguageHelper.checkIfLTR(context: context)
                                  ? city.enName ?? ""
                                  : city.arName ?? "";
                        }
                        citiesOptions.add(NameAndId(
                          name: LanguageHelper.checkIfLTR(context: context)
                              ? city.enName ?? ""
                              : city.arName ?? "",
                          id: city.cityId.toString(),
                        ));
                      }
                      return TitleDropDownFormFieldWidget(
                        hintColor: AppColorManager.textAppColor,

                        validator: (city) {
                          if ((city?.name ?? "").isEmpty) {
                            return "required".tr(); // Localized text
                          }
                          return null;
                        },
                        onChanged: (selectedCity) {
                          entity.cityId = num.parse(selectedCity?.id ?? "0");
                        },
                        hint: initValue ?? 'city'.tr(),

                        // Localized text
                        title: 'city'.tr(),
                        // Localized text
                        options: citiesOptions,
                      );
                    },
                  ),
                  SizedBox(height: AppHeightManager.h1point8),
                  BlocConsumer<CurrencyCubit, CurrencyState>(
                    listener: (context, state) {
                      if (state.status == CubitStatus.error) {
                        NoteMessage.showErrorSnackBar(
                            context: context, text: state.error);
                      }
                    },
                    builder: (context, state) {
                      if (state.status == CubitStatus.loading) {
                        return ShimmerContainer(
                            width: AppWidthManager.w100,
                            height: AppHeightManager.h6);
                      }
                      List<NameAndId> currenciesOptions = [];
                      List<Currency> cities = state.entity.data ?? [];
                      String? initValue;
                      for (var currency in cities) {
                        if (currency.currencyId == entity.currencyId) {
                          initValue =
                          LanguageHelper.checkIfLTR(context: context)
                              ? currency.enName ?? ""
                              : currency.arName ?? "";
                        }
                        currenciesOptions.add(NameAndId(
                          name: LanguageHelper.checkIfLTR(context: context)
                              ? currency.enName ?? ""
                              : currency.arName ?? "",
                          id: currency.currencyId.toString(),
                        ));
                      }
                      return TitleDropDownFormFieldWidget(
                        hintColor: AppColorManager.textAppColor,

                        validator: (city) {
                          if ((city?.name ?? "").isEmpty) {
                            return "required".tr(); // Localized text
                          }
                          return null;
                        },
                        onChanged: (selectedCity) {
                          entity.cityId = num.parse(selectedCity?.id ?? "0");
                        },
                        hint: initValue ?? 'currency'.tr(),

                        // Localized text
                        title: 'currency'.tr(),
                        // Localized text
                        options: currenciesOptions,
                      );
                    },
                  ),
                  SizedBox(height: AppHeightManager.h1point8),
                  TitleAppFormFiled(
                    initValue: entity.name,
                    hint: "title".tr(),
                    // Localized text
                    title: "title".tr(),
                    // Localized text
                    onChanged: (value) {
                      entity.name = value;
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
                    initValue: entity.description,
                    hint: "description".tr(),
                    // Localized text
                    title: "description".tr(),
                    // Localized text
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
                    initValue: (entity.startingPrice ?? "").toString(),
                    textInputType: TextInputType.number,
                    hint: "price".tr(),
                    title: "price".tr(),
                    onChanged: (value) {
                      entity.startingPrice = num.parse(value ?? "0");
                      return null;
                    },
                    validator: (value) {
                      return null;
                    },
                  ),
                  SizedBox(height: AppHeightManager.h1point8),
                  TitleDropDownFormFieldWidget(
                    hintColor: AppColorManager.textAppColor,

                    options: [
                      NameAndId(name:EnumManager.biddingStatus[1]??"", id:"1" ),
                      NameAndId(name: EnumManager.biddingStatus[0]??"", id:"0" ),
                    ],
                    hint: (entity.biddingStatus !=null)
                        ? EnumManager.biddingStatus[entity.biddingStatus]??""
                        : "status".tr(),
                    title: "status".tr(),
                    onChanged: (value) {
                      entity.biddingStatus = num.parse(value?.id ??"");
                      return null;
                    },
                    validator: (value) {
                      return null;
                    },
                  ),
                  SizedBox(height: AppHeightManager.h10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class UpdateAdvArgs {
  AdData data;

  UpdateAdvArgs({required this.data});
}
