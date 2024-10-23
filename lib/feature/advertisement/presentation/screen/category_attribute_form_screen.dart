import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzad_damascus/core/resource/cubit_status_manager.dart';
import 'package:mzad_damascus/core/widget/snack_bar/note_message.dart';
import 'package:mzad_damascus/feature/advertisement/domain/entity/request/get_category_attributes_request_entity.dart';
import 'package:mzad_damascus/feature/advertisement/presentation/cubit/get_category_attributes_cubit.dart';
import 'package:mzad_damascus/feature/advertisement/presentation/cubit/get_category_attributes_state.dart';
import '../../../../core/resource/size_manager.dart';
import '../../../../core/widget/container/decorated_container.dart';
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
  @override
  void initState() {
    getCategoryAttributes();
    super.initState();
  }

  getCategoryAttributes() {
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
          Navigator.of(context)
              .pushNamed(RouteNamedScreens.categoryAttributeForm);
        },
      ),
      body: DecoratedContainer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              const AdvertisementAppBar(
                completePercent: 2,
              ),
              SizedBox(
                height: AppHeightManager.h2point5,
              ),
              BlocConsumer<GetCategoryAttributesCubit,
                  GetCategoryAttributesState>(
                listener: (context, state) {
                  if (state.status == CubitStatus.error) {
                    //TODO make real error message
                    NoteMessage.showErrorSnackBar(
                        context: context, text:  "");
                  }
                },
                builder: (context, state) {
                  return Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // children: List.generate(, generator),
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
