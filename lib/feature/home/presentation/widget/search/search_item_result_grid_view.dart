import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzad_damascus/core/widget/empty/empty_widget.dart';
import 'package:mzad_damascus/feature/home/presentation/widget/search/search_item_card.dart';
import '../../../../../core/resource/color_manager.dart';
import '../../../../../core/resource/cubit_status_manager.dart';
import '../../../../../core/resource/font_manager.dart';
import '../../../../../core/resource/size_manager.dart';
import '../../../../../core/widget/loading/app_circular_progress_widget.dart';
import '../../../../../core/widget/loading/shimmer/advs_by_attribute_shimmer.dart';
import '../../../../../core/widget/text/app_text_widget.dart';
import '../../../../../router/router.dart';
import '../../../domain/entity/response/advs_by_attribute_response_entity.dart';
import '../../cubit/item_search/item_search_cubit.dart';
import '../../screen/advertisement_details_screen.dart';

class SearchItemResultGridView extends StatefulWidget {
  const SearchItemResultGridView({super.key});

  @override
  State<SearchItemResultGridView> createState() =>
      _SearchItemResultGridViewState();
}

class _SearchItemResultGridViewState extends State<SearchItemResultGridView> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ItemSearchCubit, ItemSearchState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state.status == CubitStatus.loading) {
          return Column(
            children: [
              const AdvsByAttributeShimmer(),
            ],
          );
        }

        List<AdData> advs = state.entity.data?.data ?? [];

        if (advs.isEmpty) {
          return Padding(
            padding:  EdgeInsets.only(top: AppHeightManager.h20),
            child: EmptyWidget(
              title: "noResults".tr(),
              subTitle: "couldNotFindAnyResult".tr(),
            ),
          );
        }

        return Column(
          children: [
            DynamicHeightGridView(
              crossAxisSpacing: AppWidthManager.w2,
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: advs.length,
              builder: (context, index) {
                AdData? advertisement = advs[index];
                return InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      RouteNamedScreens.advertisementDetails,
                      arguments: AdvertisementDetailsArgs(
                        advertisement: advertisement,
                      ),
                    );
                  },
                  child: SearchItemCard(advertisement: advertisement),
                );
              },
            ),
            Visibility(
                visible: state.isReachedMax == false &&
                    state.status != CubitStatus.error,
                child: const AppCircularProgressWidget())
          ],
        );
      },
    );
  }
}
