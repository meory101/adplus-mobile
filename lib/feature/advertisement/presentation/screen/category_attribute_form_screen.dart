import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzad_damascus/core/helper/language_helper.dart';
import 'package:mzad_damascus/core/resource/cubit_status_manager.dart';
import 'package:mzad_damascus/core/resource/enum_manager.dart';
import 'package:mzad_damascus/core/widget/drop_down/NameAndId.dart';
import 'package:mzad_damascus/core/widget/drop_down/title_drop_down_form_field.dart';
import 'package:mzad_damascus/core/widget/snack_bar/note_message.dart';
import 'package:mzad_damascus/feature/advertisement/domain/entity/request/add_advertisement_request_entity.dart';
import 'package:mzad_damascus/feature/advertisement/domain/entity/request/attribute_form_value.dart';
import 'package:mzad_damascus/feature/advertisement/domain/entity/request/get_category_attributes_request_entity.dart';
import 'package:mzad_damascus/feature/advertisement/domain/entity/response/get_category_attributes_response_entity.dart';
import 'package:mzad_damascus/feature/advertisement/presentation/cubit/get_category_attribute_cubit/get_category_attributes_cubit.dart';
import 'package:mzad_damascus/feature/advertisement/presentation/cubit/get_category_attribute_cubit/get_category_attributes_state.dart';
import '../../../../core/resource/size_manager.dart';
import '../../../../core/widget/container/dialog_container.dart';
import '../../../../core/widget/form_field/title_app_form_filed.dart';
import '../../../../core/widget/loading/shimmer/category_attribute_form_list_view_shimmer.dart';
import '../../../../router/router.dart';
import '../widget/advertisement_app_bar.dart';
import '../widget/advertisement_next_button.dart';

class CategoryAttributeFormScreen extends StatefulWidget {
  final CategoryAttributeFormArgs args;

  const CategoryAttributeFormScreen({super.key, required this.args});

  @override
  State<CategoryAttributeFormScreen> createState() =>
      _CategoryAttributeFormScreenState();
}

class _CategoryAttributeFormScreenState
    extends State<CategoryAttributeFormScreen> {
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  void initState() {
    getCategoryAttributes();
    super.initState();
  }

  List<AttributeFormValue> attributeFormValues = [];
  CategoryAttributes? currentAttribute;

  getCategoryAttributes() {
    AdvertisementModel.entity?.categoryId = widget.args.categoryId;
    context.read<GetCategoryAttributesCubit>().getCategoryAttributes(
        context: context,
        entity: GetCategoryAttributesRequestEntity(
            categoryId: widget.args.categoryId));
  }
  void setAttributeFormValue(String value, CategoryAttributes? attribute) {
    if (attribute == null) return;
    final existingValue = attributeFormValues.firstWhere(
          (formValue) => formValue.attributeId == attribute.attributeId,
      orElse: () => AttributeFormValue(value: '', attributeId: null),
    );

    if (existingValue.attributeId == null) {
      attributeFormValues.add(AttributeFormValue(
        value: value,
        attributeId: attribute.attributeId,
      ));
    } else {
      existingValue.value = value;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: AdvertisementNextButton(
        onTap: () {
          if ((formKey.currentState?.validate()) ?? false) {
            AdvertisementModel.entity?.attributes = attributeFormValues;
            Navigator.of(context)
            .pushNamed(RouteNamedScreens.advertisement);
            return;
          }
          NoteMessage.showErrorSnackBar(
              context: context, text: "please enter fields");
        },
      ),
      body: DialogContainer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisSize: MainAxisSize.max,
            children: [
              const AdvertisementAppBar(
                completePercent: (2 / 3),
              ),
              SizedBox(
                height: AppHeightManager.h2point5,
              ),
              BlocConsumer<GetCategoryAttributesCubit,
                  GetCategoryAttributesState>(
                listener: (context, state) {
                  if (state.status == CubitStatus.error) {
                    NoteMessage.showErrorSnackBar(
                        context: context, text:  state.error);
                  }
                },
                builder: (context, state) {
                  if (state.status == CubitStatus.loading) {
                    return const CategoryAttributeFormListViewShimmer();
                  }
                  List<CategoryAttributes> attributes =
                      state.entity.data?.attributes ?? [];

                  return Form(
                    key: formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                        attributes.length,
                        (index) {
                          CategoryAttributes?   currentAttribute =
                              state.entity.data?.attributes?[index];

                          List<NameAndId> attributeListElements = [];

                          if (currentAttribute
                                  ?.attributeType?.name ==
                              EnumManager.list) {
                            currentAttribute?.attributeTypeList?.forEach(
                              (attributeListElement) {
                                attributeListElements.add(
                                  NameAndId(
                                    name:
                                    LanguageHelper.checkIfLTR(context: context)?
                                    attributeListElement.optionEn ?? "":
                                    attributeListElement.option?? "",
                                    id: attributeListElement.typeListId
                                        .toString(),
                                  ),
                                );
                              },
                            );
                          }

                          return Column(
                            children: [
                              Visibility(
                                visible: currentAttribute
                                        ?.attributeType?.name ==
                                    EnumManager.list,
                                replacement: TitleAppFormFiled(
                                  title
                                      :
                                  LanguageHelper.checkIfLTR(context: context)?
                                  currentAttribute?.attributeNameEn ?? "":
                                  currentAttribute?.attributeName ?? "",
                                  textInputType: EnumManager
                                      .attributeTextInputType[attributes[index]
                                          .attributeType
                                          ?.name ??
                                      ""],
                                  hint: LanguageHelper.checkIfLTR(context: context)?
                                  currentAttribute?.attributeNameEn ?? "":
                                  currentAttribute?.attributeName ?? "",
                                  onChanged: (value) {
                                    setAttributeFormValue(
                                        value ?? "", currentAttribute);
                                    return null;
                                  },
                                  validator: (value) {
                                    if ((value ?? "").isEmpty) {
                                      return "required";
                                    }
                                    return null;
                                  },
                                ),
                                child: TitleDropDownFormFieldWidget(
                                  validator: (value) {
                                    if ((value?.name ?? "").isEmpty) {
                                      return "required";
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {
                                    setAttributeFormValue(
                                        value?.name ?? "", currentAttribute);
                                    return null;
                                  },
                                  title: LanguageHelper.checkIfLTR(context: context)?
                                  currentAttribute?.attributeNameEn ?? "":
                                  currentAttribute?.attributeName ?? "",
                                  options: attributeListElements,
                                  hint: LanguageHelper.checkIfLTR(context: context)?
                                  currentAttribute?.attributeNameEn ?? "":
                                  currentAttribute?.attributeName ?? "",
                                ),
                              ),
                              SizedBox(
                                height: AppHeightManager.h1point8,
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                height: AppHeightManager.h6,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryAttributeFormArgs {
  num? categoryId;

  CategoryAttributeFormArgs({required this.categoryId});
}

abstract  class AdvertisementModel{
 static AddAdvertisementRequestEntity? entity = AddAdvertisementRequestEntity();
}