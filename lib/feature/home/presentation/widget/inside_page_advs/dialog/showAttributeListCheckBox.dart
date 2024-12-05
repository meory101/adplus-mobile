import 'package:dartz/dartz_unsafe.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mzad_damascus/feature/home/domain/entity/request/advs_by_attribute_request_entity.dart';
import 'package:mzad_damascus/feature/home/presentation/screen/inside_page_category_advs_screen.dart';
import '../../../../../../core/helper/language_helper.dart';
import '../../../../../../core/resource/color_manager.dart';
import '../../../../../../core/resource/size_manager.dart';
import '../../../../../../core/widget/drop_down/NameAndId.dart';
import '../../../../../../core/widget/text/app_text_widget.dart';
import '../done_button.dart';

Map<num, List<String>> selectedAttributeMap = {};

void showAttributeListCheckBox(
    {required BuildContext context,
    required List<NameAndId> options,
    required Function() onDoneSelecting,
    required num? currentFilterItemId}) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      // selectedAttributeMap[currentFilterItemId ?? 0] = [];
      List<String> optionNames = [];
      return StatefulBuilder(builder: (context, setState) {
        return Visibility(
          visible: options.isNotEmpty,
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: AppHeightManager.h12),
                decoration: BoxDecoration(
                    color: AppColorManager.white,
                    borderRadius: BorderRadius.circular(AppRadiusManager.r10)),
                padding: EdgeInsets.symmetric(
                  horizontal: AppWidthManager.w3Point8,
                ),
                height: AppHeightManager.h40,
                width: AppWidthManager.w100,
                child: ListView.builder(
                  itemCount: options.length,
                  itemBuilder: (context, i) {
                    bool isSelected = false;
                    if (optionNames.length != options.length - 1 &&
                        options[i].name != 'all') {
                      optionNames.add(options[i].name);
                    }

                    if (options[i].name == 'all') {
                      isSelected =
                          selectedAttributeMap[currentFilterItemId]?.length ==
                              options.length - 1;
                    } else {
                      isSelected =
                          selectedAttributeMap[currentFilterItemId]?.contains(options[i].name)??false;
                    }

                    return InkWell(
                      child: Container(
                          margin:
                              EdgeInsets.only(top: AppHeightManager.h1point8),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(AppRadiusManager.r15),
                              color: isSelected
                                  ? AppColorManager.lightGreyOpacity6
                                  : AppColorManager.white),
                          padding: EdgeInsets.only(
                              left: LanguageHelper.checkIfLTR(context: context)
                                  ? AppWidthManager.w3
                                  : AppWidthManager.w1Point2,
                              right: LanguageHelper.checkIfLTR(context: context)
                                  ? AppWidthManager.w1Point2
                                  : AppWidthManager.w3,
                              top: AppHeightManager.h1,
                              bottom: AppHeightManager.h05),
                          height: AppHeightManager.h7,
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppTextWidget(
                                  text: options[i].name == "all"
                                      ? "all".tr()
                                      : options[i].name),
                              Checkbox(
                                checkColor: AppColorManager.mainColor,
                                fillColor: WidgetStatePropertyAll(
                                    AppColorManager.lightGreyOpacity6),
                                onChanged: (value) {
                                  bool isListFull =
                                      selectedAttributeMap[currentFilterItemId]
                                              ?.length ==
                                          options.length - 1;

                                  if (options[i].name == 'all') {
                                    if (isListFull == false) {
                                      selectedAttributeMap[
                                          currentFilterItemId ?? 0] = [];
                                      selectedAttributeMap[
                                              currentFilterItemId ?? 0]
                                          ?.addAll(optionNames);
                                    } else {
                                      selectedAttributeMap[
                                          currentFilterItemId ?? 0] = [];
                                    }
                                  } else {
                                    if ((selectedAttributeMap[
                                                currentFilterItemId ?? 0] ??
                                            [])
                                        .contains(options[i].name)) {
                                      selectedAttributeMap[
                                              currentFilterItemId ?? 0]
                                          ?.remove(options[i].name);
                                    } else {
                                      selectedAttributeMap[
                                              currentFilterItemId ?? 0]
                                          ?.add(options[i].name);
                                    }
                                  }
                                  setState(() {});
                                },
                                value: isSelected,
                                activeColor: AppColorManager.textAppColor,
                                visualDensity: const VisualDensity(
                                    horizontal: VisualDensity.minimumDensity,
                                    vertical: VisualDensity.minimumDensity),
                              )
                            ],
                          )),
                    );
                  },
                ),
              ),
              DoneButton()
            ],
          ),
        );
      });
    },
  ).then((value) {
    List<FilterAttribute> attributes = [];
    selectedAttributeMap.forEach((key, value) {
      if(value.isNotEmpty){
        attributes.add(FilterAttribute(
            value: value,
            attributeId: key
        ));
      }

    },);
    FilterRequest.entity.attributes = attributes;
    onDoneSelecting();
  });
}
