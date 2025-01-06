import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzad_damascus/core/helper/language_helper.dart';
import 'package:mzad_damascus/core/resource/font_manager.dart';
import 'package:mzad_damascus/core/resource/size_manager.dart';
import 'package:mzad_damascus/core/widget/app_bar/main_app_bar.dart';
import 'package:mzad_damascus/core/widget/snack_bar/note_message.dart';
import 'package:mzad_damascus/feature/more/domain/entity/request/myitem_review_request_entiity.dart';
import 'package:mzad_damascus/feature/more/presentation/cubit/my_reviewd_item_cubit/myitem_under_review/myitem_review_cubit.dart';
import 'package:mzad_damascus/feature/more/presentation/cubit/rejected_ads_cubit/rejected_ads_cubit.dart';
import 'package:mzad_damascus/feature/more/presentation/widget/my_advs/active_adv_list_view.dart';
import 'package:mzad_damascus/feature/more/presentation/widget/my_advs/my_adv_list_view.dart';
import 'package:mzad_damascus/feature/more/presentation/widget/my_advs/rejected_adv_list_view.dart';
import 'package:mzad_damascus/feature/more/presentation/widget/my_advs/under_review_list_view.dart';
import '../../../../core/resource/color_manager.dart';
import '../../../../core/resource/cubit_status_manager.dart';
import '../../domain/entity/request/myitem_under_review_request_entiity.dart';
import '../cubit/myitem_cubit/myitem_cubit.dart';
import '../cubit/myitem_cubit/myitem_state.dart';
import '../cubit/myitem_under_review/myitem_under_review_cubit.dart';
import '../../domain/entity/request/myitem_request_entity.dart';

class MyItemsScreen extends StatefulWidget {
  const MyItemsScreen({super.key});

  @override
  State<MyItemsScreen> createState() => _MyItemsScreenState();
}

class _MyItemsScreenState extends State<MyItemsScreen> {
  final List<String> filters = [
    'all'.tr(),
    'active'.tr(),
    'inReview'.tr(),
    'rejected'.tr()
  ];
  int selectedFilterIndex = 0;

  @override
  void initState() {
    super.initState();
    loadItems();
  }

  void loadItems() {
    if (selectedFilterIndex == 2) {
      context.read<MyitemUnderReviewCubit>().myitemunderreview(
            context: context,
            entity: MyItemUnderReviewRequestEntity(
              page: 1,
            ),
          );
    } else if (selectedFilterIndex == 1) {
      context.read<MyitemReviewCubit>().myitemreview(
            context: context,
            entity: MyItemReviewRequestEntity(
              page: 1,
            ),
          );
    } else if (selectedFilterIndex == 0) {
      context.read<MyItemCubit>().getMyItems(
            context: context,
            entity: MyItemRequestEntity(
              page: 1,
            ),
          );
    } else {
      context.read<RejectedAdsCubit>().getRejectedAds(
            context: context,
            entity: MyItemRequestEntity(
              page: 1,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: "myAds".tr()),
      body: BlocConsumer<MyItemCubit, MyitemState>(
        listener: (context, state) {
          if (state.status == CubitStatus.error && state.error.isNotEmpty) {
            NoteMessage.showErrorSnackBar(context: context, text: state.error);
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              _buildFilterButtons(),
              Expanded(
                child: selectedFilterIndex == 2
                    ? const UnderReviewListView()
                    : selectedFilterIndex == 1
                        ? const ActiveAdvListView()
                        : selectedFilterIndex == 0
                            ? const MyAdvListView()
                            : const RejectedAdvListView(),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildFilterButtons() {
    return SizedBox(
      height: AppHeightManager.h5,

      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: filters.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
                left: LanguageHelper.checkIfLTR(context: context)
                    ? AppWidthManager.w2
                    : 0,
                right: !LanguageHelper.checkIfLTR(context: context)
                    ? AppWidthManager.w2
                    : 0),
            child: FilterChip(
              color: WidgetStateProperty.all(AppColorManager.lightGreyOpacity6),
              label: Text(filters[index]),
              selected: selectedFilterIndex == index,
              onSelected: (selected) {
                setState(() {
                  selectedFilterIndex = index;
                });
                loadItems();
              },
              backgroundColor: AppColorManager.lightGreyOpacity6,
              selectedColor: AppColorManager.black,
              labelStyle: TextStyle(
                fontSize: FontSizeManager.fs15,
                color: selectedFilterIndex == index
                    ? AppColorManager.black
                    : Colors.black,
              ),
            ),
          );
        },
      ),
    );
  }
}
