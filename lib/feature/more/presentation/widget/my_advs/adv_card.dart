import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:mzad_damascus/core/resource/constant_manager.dart';
import 'package:mzad_damascus/core/widget/button/main_app_button.dart';
import 'package:mzad_damascus/core/widget/image/main_image_widget.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/advs_by_attribute_response_entity.dart';
import '../../../../../core/resource/color_manager.dart';
import '../../../../../core/resource/enum_manager.dart';
import '../../../../../core/resource/font_manager.dart';
import '../../../../../core/resource/size_manager.dart';
import '../../../../../core/widget/snack_bar/note_message.dart';
import '../../../../../core/widget/text/app_text_widget.dart';
import '../../../../../router/router.dart';
import '../../../../home/presentation/screen/advertisement_details_screen.dart';

import '../../screen/update_adv_screen.dart';
import '../dialog/delete_ad_dialog.dart';

class AdvCard extends StatelessWidget {
  final AdData item;

  const AdvCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(RouteNamedScreens.advertisementDetails,
                arguments: AdvertisementDetailsArgs(advertisement: item))
            .then(
          (value) {
            Navigator.of(context)
                .pushReplacementNamed(RouteNamedScreens.myitem);
          },
        );
      },
      child: Column(
        children: [
          Card(
            margin: EdgeInsets.only(bottom: AppWidthManager.w3Point8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppRadiusManager.r10),
            ),
            child: Padding(
              padding: EdgeInsets.all(AppRadiusManager.r10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppRadiusManager.r10),
                    ),
                    child: MainImageWidget(
                      borderRadius: BorderRadius.circular(AppRadiusManager.r10),
                      height: AppHeightManager.h12,
                      width: AppHeightManager.h12,
                      imageUrl: AppConstantManager.imageBaseUrl +
                          (item.photos?.first.photo ?? ""),
                    ),
                  ),
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
                        SizedBox(height: AppHeightManager.h08),

                        AppTextWidget(
                          text: '${item.startingPrice ?? 0}',
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        SizedBox(height: AppHeightManager.h08),
                        Visibility(
                          visible: (item.note ?? "").isNotEmpty,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                 color: AppColorManager.subColor
                              )
                            ),
                            child: AppTextWidget(
                              text: '${item.note ?? ""}',
                              color: Colors.pink,
                              fontSize: FontSizeManager.fs16,
                              fontWeight: FontWeight.w700,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ),
                        ),
                        SizedBox(height: AppHeightManager.h08),
                        Row(
                          children: [
                            IconButton(
                                iconSize: 15,
                                color: AppColorManager.grey,
                                onPressed: () {},
                                icon: Icon(Icons.thumb_up_alt_rounded)),
                            AppTextWidget(
                              text: '${item.likeCount ?? 0}',
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                            IconButton(
                                iconSize: 15,
                                color: AppColorManager.grey,
                                onPressed: () {},
                                icon: Icon(Icons.comment)),
                            AppTextWidget(
                              text: '${item.commentCount ?? 0}',
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                            SizedBox(
                              width: AppWidthManager.w5,
                            ),
                            AppTextWidget(
                              text:
                                  (EnumManager.advsStateCode[item.status] ?? "")
                                      .tr(),
                              color: EnumManager.advsStateColor[item.status] ??
                                  AppColorManager.amber,
                              fontSize: FontSizeManager.fs14,
                              fontWeight: FontWeight.w700,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MainAppButton(
                  color: AppColorManager.mainColor,
                  borderRadius: BorderRadius.circular(AppRadiusManager.r10),
                  padding: EdgeInsets.symmetric(
                      horizontal: AppWidthManager.w5,
                      vertical: AppHeightManager.h1),
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(RouteNamedScreens.updateAdvs,
                            arguments: UpdateAdvArgs(data: item))
                        .then((value) {
                      Navigator.of(context).pushReplacementNamed(
                        RouteNamedScreens.myitem,
                      );
                    });
                  },
                  child: AppTextWidget(
                    text: "edit".tr(),
                    color: AppColorManager.white,
                    fontWeight: FontWeight.w500,
                    fontSize: FontSizeManager.fs15,
                  )),
              SizedBox(
                width: AppWidthManager.w3Point8,
              ),
              MainAppButton(
                  color: Colors.red.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(AppRadiusManager.r10),
                  padding: EdgeInsets.symmetric(
                      horizontal: AppWidthManager.w5,
                      vertical: AppHeightManager.h1),
                  onTap: () {
                    showDeleteAdDialog(
                        context: context,
                        item: item,
                        onSuccess: () {
                          NoteMessage.showSuccessSnackBar(
                              context: context,
                              text: "successfullyDone".tr());

                          Navigator.of(context).pushReplacementNamed(
                            RouteNamedScreens.myitem,
                          );
                        });
                  },
                  child: AppTextWidget(
                    text: "delete".tr(),
                    color: AppColorManager.white,
                    fontWeight: FontWeight.w500,
                    fontSize: FontSizeManager.fs15,
                  )),

            ],
          )
        ],
      ),
    );
  }
}
