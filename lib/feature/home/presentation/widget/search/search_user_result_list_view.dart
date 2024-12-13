import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzad_damascus/core/widget/container/shimmer_container.dart';
import 'package:mzad_damascus/core/widget/loading/shimmer/search_user_list_view_shimmer.dart';

import '../../../../../core/model/user.dart';
import '../../../../../core/resource/color_manager.dart';
import '../../../../../core/resource/cubit_status_manager.dart';
import '../../../../../core/resource/font_manager.dart';
import '../../../../../core/resource/size_manager.dart';
import '../../../../../core/widget/button/main_app_button.dart';
import '../../../../../core/widget/container/decorated_container.dart';
import '../../../../../core/widget/empty/empty_widget.dart';
import '../../../../../core/widget/image/main_image_widget.dart';
import '../../../../../core/widget/loading/app_circular_progress_widget.dart';
import '../../../../../core/widget/snack_bar/note_message.dart';
import '../../../../../core/widget/text/app_text_widget.dart';
import '../../../../../router/router.dart';
import '../../cubit/search_user/search_user_cubit.dart';
import 'dart:ui' as ui;

import '../../screen/auhter_profile_screen.dart';

class SearchUserResultListView extends StatelessWidget {
  const SearchUserResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchUserCubit, SearchUserState>(
      listener: (context, state) {
        if (state.status == CubitStatus.error) {
          NoteMessage.showErrorSnackBar(context: context, text: state.error);
        }
      },
      builder: (context, state) {
        if (state.status == CubitStatus.loading) {
          return SearchUserListViewShimmer();
        }
        List<User> users = state.entity.data ?? [];
        if (users.isEmpty) {
          return Padding(
            padding:  EdgeInsets.only(top: AppHeightManager.h20),
            child: EmptyWidget(
              title: "noResults".tr(),
              subTitle: "couldNotFindAnyResult".tr(),
            ),
          );
        }
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: users.length,
          itemBuilder: (context, index) {
            return DecoratedContainer(
              margin: EdgeInsets.only(bottom: AppHeightManager.h2point5),
              padding: EdgeInsets.symmetric(
                  vertical: AppHeightManager.h2,
                  horizontal: AppWidthManager.w3Point8),
              child: Column(
                children: [
                  Visibility(
                    visible: users[index].isCompany == 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.verified,
                          color: AppColorManager.mainColor,
                        ),
                        SizedBox(
                          width: AppWidthManager.w2,
                        ),
                        AppTextWidget(
                          text: "businessAccount".tr(),
                          fontWeight: FontWeight.w700,
                          fontSize: FontSizeManager.fs16,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: AppHeightManager.h1point8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: AppWidthManager.w15,
                            width: AppWidthManager.w15,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            decoration:
                                const BoxDecoration(shape: BoxShape.circle),
                            child: MainImageWidget(
                              imageUrl: users[index].photo ?? "",
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            width: AppWidthManager.w2,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppTextWidget(
                                text: users[index].name ?? "",
                                fontWeight: FontWeight.w700,
                                fontSize: FontSizeManager.fs16,
                              ),
                              Directionality(
                                textDirection: ui.TextDirection.ltr,
                                child: AppTextWidget(
                                    text: users[index].username ?? ""),
                              ),
                            ],
                          )
                        ],
                      ),
                      MainAppButton(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                              RouteNamedScreens.authorProfile,
                              arguments: AuthorProfileArgs(
                                  userName: users[index].username ?? ""));
                        },
                        borderRadius:
                            BorderRadius.circular(AppRadiusManager.r10),
                        padding: EdgeInsets.symmetric(
                            horizontal: AppWidthManager.w3Point8,
                            vertical: AppHeightManager.h08),
                        color: AppColorManager.mainColor,
                        child: AppTextWidget(
                            text: "userProfile".tr(),
                            fontWeight: FontWeight.w600,
                            color: AppColorManager.white,
                            fontSize: FontSizeManager.fs16),
                      )
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
