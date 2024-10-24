import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzad_damascus/core/resource/cubit_status_manager.dart';
import 'package:mzad_damascus/core/resource/enum_manager.dart';
import 'package:mzad_damascus/core/widget/drop_down/NameAndId.dart';
import 'package:mzad_damascus/core/widget/drop_down/title_drop_down_form_field.dart';
import 'package:mzad_damascus/core/widget/snack_bar/note_message.dart';
import 'package:mzad_damascus/feature/advertisement/domain/entity/request/get_category_attributes_request_entity.dart';
import 'package:mzad_damascus/feature/advertisement/domain/entity/response/get_category_attributes_response_entity.dart';
import 'package:mzad_damascus/feature/advertisement/presentation/cubit/get_category_attributes_cubit.dart';
import 'package:mzad_damascus/feature/advertisement/presentation/cubit/get_category_attributes_state.dart';
import '../../../../core/resource/size_manager.dart';
import '../../../../core/widget/container/dialog_container.dart';
import '../../../../core/widget/form_field/title_app_form_filed.dart';
import '../../../../core/widget/loading/shimmer/category_attribute_form_list_view_shimmer.dart';
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

  getCategoryAttributes() {
    print('999999999999999999999${widget.args.categoryId}');
    context.read<GetCategoryAttributesCubit>().getCategoryAttributes(
        context: context,
        entity: GetCategoryAttributesRequestEntity(
            categoryId: widget.args.categoryId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: AdvertisementNextButton(
        onTap: () {
          if ((formKey.currentState?.validate()) ?? false) {
            // Navigator.of(context)
            //     .pushNamed(RouteNamedScreens.categoryAttributeForm);
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
                    //TODO make real error message
                    NoteMessage.showErrorSnackBar(context: context, text: "");
                  }
                },
                builder: (context, state) {
                  if (state.status == CubitStatus.loading) {
                    return const CategoryAttributeFormListViewShimmer();
                  }
                  List<Attributes> attributes =
                      state.entity.data?.attributes ?? [];

                  return Form(
                    key: formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                        attributes.length,
                        (index) {
                          Attributes? currentAttribute =
                              state.entity.data?.attributes?[index];

                          List<NameAndId> attributeListElements = [];

                          if (currentAttribute
                                  ?.attributeType?.attributeTypeId ==
                              EnumManager.listCode) {
                            currentAttribute?.attributeTypeList?.forEach(
                              (attributeListElement) {
                                attributeListElements.add(
                                  NameAndId(
                                    name: attributeListElement.option ?? '',
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
                                        ?.attributeType?.attributeTypeId ==
                                    EnumManager.listCode,
                                replacement: TitleAppFormFiled(
                                  title: currentAttribute?.attributeName ?? "",
                                  textInputType: EnumManager
                                      .attributeTextInputType[attributes[index]
                                          .attributeType
                                          ?.attributeTypeId ??
                                      -1],
                                  hint: attributes[index].attributeName ?? "",
                                  onChanged: (value) {
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
                                    if (value?.name.isEmpty ?? true) {
                                      return "required";
                                    }
                                    return null;
                                  },
                                  title: currentAttribute?.attributeName ?? "",
                                  options: attributeListElements,
                                  hint: currentAttribute?.attributeName ?? "",
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
