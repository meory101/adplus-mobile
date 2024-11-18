import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mzad_damascus/app/app.dart';
import 'package:mzad_damascus/core/helper/language_helper.dart';
import 'package:mzad_damascus/core/resource/constant_manager.dart';
import 'package:mzad_damascus/core/resource/enum_manager.dart';
import 'package:mzad_damascus/core/resource/font_manager.dart';
import 'package:mzad_damascus/core/resource/icon_manager.dart';
import 'package:mzad_damascus/core/resource/size_manager.dart';
import 'package:mzad_damascus/core/widget/app_bar/main_app_bar.dart';
import 'package:mzad_damascus/core/widget/button/main_app_button.dart';
import 'package:mzad_damascus/core/widget/image/main_image_widget.dart';
import 'package:mzad_damascus/core/widget/loading/app_circular_progress_widget.dart';
import 'package:mzad_damascus/core/widget/snack_bar/note_message.dart';
import 'package:mzad_damascus/core/widget/text/app_text_widget.dart';
import 'package:mzad_damascus/feature/advertisement/domain/entity/request/delete_adv_request_entity.dart';
import 'package:mzad_damascus/feature/advertisement/presentation/cubit/delete_adv_cubit/delete_advertisement_cubit.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/advs_by_attribute_response_entity.dart';
import 'package:mzad_damascus/feature/home/presentation/screen/advertisement_details_screen.dart';
import 'package:mzad_damascus/feature/more/presentation/screen/update_adv_screen.dart';
import 'package:mzad_damascus/router/router.dart';
import '../../../../core/resource/color_manager.dart';
import '../../../../core/resource/cubit_status_manager.dart';
import '../../../../core/storage/shared/shared_pref.dart';
import '../../../advertisement/presentation/cubit/delete_adv_cubit/delete_advertisement_state.dart';
import '../cubit/myitem_cubit/myitem_cubit.dart';
import '../cubit/myitem_cubit/myitem_state.dart';
import '../cubit/myitem_under_review/myitem_under_review_cubit.dart';
import '../cubit/myitem_under_review/myitem_under_review_state.dart';
import '../../domain/entity/request/myitem_request_entity.dart';
import '../../domain/entity/response/myitems_response_entity.dart';
import '../../../../core/injection/injection_container.dart' as di;
import '../widget/dialog/delete_ad_dialog.dart';

class MyItemsScreen extends StatefulWidget {
  const MyItemsScreen({Key? key}) : super(key: key);

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
    _loadItems();
  }

  void _loadItems() {
    if (selectedFilterIndex == 2) {
      // underreview tab
      context.read<MyitemUnderReviewCubit>().myitemunderreview(
            context: context,
            entity: MyItemUnderReviewRequestEntity(
              page: 1,
            ),
          );
    } else {
      context.read<MyitemCubit>().myitem(
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
      body: BlocConsumer<MyitemCubit, MyitemState>(
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
                child: _buildItemsList(state),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildFilterButtons() {
    return Container(
      height: AppHeightManager.h5,
      margin: EdgeInsets.symmetric(horizontal: AppWidthManager.w3Point8),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: filters.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
                right: LanguageHelper.checkIfLTR(context: context)
                    ? AppWidthManager.w2
                    : 0,
                left: !LanguageHelper.checkIfLTR(context: context)
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
                _loadItems();
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

  Widget _buildUnderReviewList() {
    return BlocConsumer<MyitemUnderReviewCubit, MyitemUnderReviewState>(
      listener: (context, state) {
        if (state.status == CubitStatus.error && state.error.isNotEmpty) {
          NoteMessage.showErrorSnackBar(context: context, text: state.error);
        }
      },
      builder: (context, state) {
        if (state.status == CubitStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        }

        final items = state.entity.data?.data ?? [];

        if (items.isEmpty) {
          return const Center(child: AppTextWidget(text: "no advertisements"));
        }

        return ListView.builder(
          padding: EdgeInsets.all(AppWidthManager.w3Point8),
          itemCount: items.length,
          itemBuilder: (context, index) => _buildItemCard(items[index]),
        );
      },
    );
  }

  Widget _buildItemsList() {
    return BlocConsumer<MyitemCubit, MyitemState>(
      listener: (context, state) {
        if (state.status == CubitStatus.error && state.error.isNotEmpty) {
          NoteMessage.showErrorSnackBar(context: context, text: state.error);
        }
      },
      builder: (context, state) {
        if (state.status == CubitStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        }

        final items = state.entity.data?.data ?? [];

        if (items.isEmpty) {
          return const Center(child: AppTextWidget(text: "no advertisements"));
        }

        return ListView.builder(
          padding: EdgeInsets.all(AppWidthManager.w3Point8),
          itemCount: items.length,
          itemBuilder: (context, index) => _buildItemCard(items[index]),
        );
      },
    );
  }

  Widget _buildItemCard(AdData item) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(RouteNamedScreens.advertisementDetails,
            arguments: AdvertisementDetailsArgs(advertisement: item));
      },
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          extentRatio: 0.4,
          children: [
            SizedBox(
              width: AppWidthManager.w3Point8,
            ),
            CircleAvatar(
              backgroundColor: AppColorManager.mainColor.withOpacity(0.8),
              child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                        RouteNamedScreens.updateAdvs,
                        arguments: UpdateAdvArgs(data: item));
                  },
                  icon: const Icon(
                    Icons.edit,
                  )),
            ),
            SizedBox(
              width: AppWidthManager.w3Point8,
            ),
            CircleAvatar(
              backgroundColor: AppColorManager.red.withOpacity(0.8),
              child: IconButton(
                  onPressed: () {
                    showDeleteAdDialog(
                        context: context,
                        item: item,
                        onSuccess: () {
                          context.read<MyitemCubit>().myitem(
                              context: context,
                              entity: MyItemRequestEntity(page: 1));
                        });
                  },
                  icon: const Icon(
                    Icons.delete,
                  )),
            ),
            SizedBox(
              width: AppWidthManager.w3Point8,
            ),
          ],
        ),
        child: Card(
          margin: EdgeInsets.only(bottom: AppWidthManager.w3Point8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadiusManager.r10),
          ),
          child: Padding(
            padding: EdgeInsets.all(AppRadiusManager.r10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildItemImage(item),
                SizedBox(width: AppRadiusManager.r10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.name ?? '',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '${item.startingPrice ?? 0}',
                        style: const TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          IconButton(
                              iconSize: 15,
                              color: AppColorManager.grey,
                              onPressed: () {},
                              icon: Icon(Icons.thumb_up_alt_rounded)),
                          Text(
                            '${item.likeCount ?? 0}',
                            style: const TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                              iconSize: 15,
                              color: AppColorManager.grey,
                              onPressed: () {},
                              icon: Icon(Icons.comment)),
                          Text(
                            '${item.commentCount ?? 0}',
                            style: const TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: AppWidthManager.w5,
                          ),
                          Text(
                            (EnumManager.advsStateCode[item.status] ?? "").tr(),
                            style: TextStyle(
                              color: EnumManager.advsStateColor[item.status] ??
                                  AppColorManager.amber,
                              fontSize: FontSizeManager.fs14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildItemImage(AdData item) {
    if (item.photos == null || item.photos!.isEmpty) {
      return _buildPlaceholderImage();
    }

    final photoUrl = item.photos!.first.photo;
    if (photoUrl == null || photoUrl.isEmpty) {
      return _buildPlaceholderImage();
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: SizedBox(
        width: 100,
        height: 100,
        child: MainImageWidget(
          imageUrl: AppConstantManager.imageBaseUrl + photoUrl,
        ),
      ),
    );
  }

  Widget _buildPlaceholderImage() {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Center(
        child: Icon(
          Icons.image_not_supported,
          color: Colors.grey,
          size: 32,
        ),
      ),
    );
  }
}
