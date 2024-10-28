import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzad_damascus/core/resource/cubit_status_manager.dart';
import 'package:mzad_damascus/core/resource/font_manager.dart';
import 'package:mzad_damascus/core/resource/size_manager.dart';
import 'package:mzad_damascus/core/widget/app_bar/main_app_bar.dart';
import 'package:mzad_damascus/core/widget/container/decorated_container.dart';
import 'package:mzad_damascus/core/widget/image/main_image_widget.dart';
import 'package:mzad_damascus/core/widget/loading/app_circular_progress_widget.dart';
import 'package:mzad_damascus/core/widget/text/app_text_widget.dart';
import 'package:mzad_damascus/feature/advertisement/domain/entity/response/get_category_attributes_response_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/request/advs_by_attribute_request_entity.dart';
import '../../../../core/resource/color_manager.dart';
import '../cubit/advs_by_attribute_cubit/advs_by_attribute_cubit.dart';

class InsidePageCategoryAdvsScreen extends StatefulWidget {
  final InsidePageCategoryAdvArgs args;

  const InsidePageCategoryAdvsScreen({super.key, required this.args});

  @override
  State<InsidePageCategoryAdvsScreen> createState() =>
      _InsidePageCategoryAdvsScreenState();
}

class _InsidePageCategoryAdvsScreenState
    extends State<InsidePageCategoryAdvsScreen> {
  @override
  void initState() {
    getAdvs(widget.args.entity);
    super.initState();
  }

  getAdvs(AdvsByAttributeRequestEntity entity) {
    context
        .read<AdvsByAttributeCubit>()
        .getAdvsByAttribute(context: context, entity: entity);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(title: ''),
      body: SingleChildScrollView(
        child: BlocConsumer<AdvsByAttributeCubit, AdvsByAttributeState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state.status == CubitStatus.loading) {
              return const AppCircularProgressWidget();
            }
            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppWidthManager.w3Point8),
                  child: DynamicHeightGridView(
                    crossAxisSpacing: AppWidthManager.w3Point8,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 10,
                    crossAxisCount: 2,
                    builder: (context, index) {
                      return Column(
                        children: [
                          DecoratedContainer(
                              borderRadius:
                                  BorderRadius.circular(AppRadiusManager.r15),
                              color: AppColorManager.lightGreyOpacity6,
                              height: AppWidthManager.w45,
                              child: MainImageWidget(
                                imageUrl: "",
                                borderRadius:
                                    BorderRadius.circular(AppRadiusManager.r15),
                              )),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: AppHeightManager.h08,
                              ),
                              AppTextWidget(
                                text: "name name name name name",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                fontSize: FontSizeManager.fs15,
                                fontWeight: FontWeight.w600,
                              ),
                              AppTextWidget(
                                text: "500 price",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                fontSize: FontSizeManager.fs14,
                                fontWeight: FontWeight.w500,
                              ),
                              SizedBox(
                                height: AppHeightManager.h1point8,
                              ),
                            ],
                          )
                        ],
                      );
                    },
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

class InsidePageCategoryAdvArgs {
  AdvsByAttributeRequestEntity entity;

  InsidePageCategoryAdvArgs({required this.entity});
}
