import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mzad_damascus/core/resource/cubit_status_manager.dart';
import 'package:mzad_damascus/core/widget/app_bar/main_app_bar.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/request/myfolloweing_request_entity.dart';
import 'package:mzad_damascus/feature/profile/presentation/cubit/myfollowing_cubit/myfollowing_cubit.dart';
import 'package:mzad_damascus/feature/profile/presentation/cubit/myfollowing_cubit/myfollowing_state.dart';
import '../../../../core/helper/lanucher_helper.dart';
import '../../../../core/resource/color_manager.dart';
import '../../../../core/resource/constant_manager.dart';
import '../../../../core/resource/font_manager.dart';
import '../../../../core/resource/icon_manager.dart';
import '../../../../core/resource/size_manager.dart';
import '../../../../core/widget/empty/empty_widget.dart';
import '../../../../core/widget/text/app_text_widget.dart';
import '../../../../router/router.dart';
import '../../../home/presentation/screen/auhter_profile_screen.dart';
import 'dart:ui' as ui;
class MyFollowingScreen extends StatefulWidget {
  const MyFollowingScreen({super.key});

  @override
  State<MyFollowingScreen> createState() => _MyFollowingScreenState();
}

class _MyFollowingScreenState extends State<MyFollowingScreen> {
  @override
  void initState() {
    initScroll();
    super.initState();
  }

  initScroll() {
    scrollController.addListener(
      () {
        if (scrollController.position.pixels >=
            scrollController.position.maxScrollExtent) {
          context.read<MyFollowingCubit>().getMyFollowing(
                context: context,
                entity: MyFollowingRequestEntity(),
              );
        }
      },
    );
  }

  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: ('following'.tr()),
      ),
      body: BlocBuilder<MyFollowingCubit, MyFollowingState>(
        builder: (context, state) {
          if (state.status == CubitStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state.status == CubitStatus.error) {
            return Center(
              child: Text(state.error),
            );
          }

          final followingList = state.entity.data?.data;

          if (followingList == null || followingList.isEmpty) {
            return EmptyWidget(
              subTitle: 'couldNotFindAnyResult'.tr(),
              title: 'noFollowingYet'.tr(),
            );
          }

          return ListView.builder(
            itemCount:
                followingList.length + (state.isReachedMax == true ? 0 : 1),
            itemBuilder: (context, index) {
              if (index == followingList.length) {
                return const Center(child: CircularProgressIndicator());
              } else {
                final followingItem = followingList[index];
                final follower = followingItem.following;

                return InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                        RouteNamedScreens.authorProfile,
                        arguments: AuthorProfileArgs(
                            userName: follower?.username ?? ""));
                  },
                  child: ListTile(
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: AppWidthManager.w3),
                    leading: CircleAvatar(
                      backgroundColor: AppColorManager.lightGreyOpacity6,
                      backgroundImage: follower?.photo != null
                          ? NetworkImage(
                              '${AppConstantManager.imageBaseUrl}${follower?.photo}')
                          : null,
                      child: follower?.photo == null
                          ? const Icon(Icons.person)
                          : null,
                    ),
                    title: AppTextWidget(
                      text: follower?.name ?? '',
                      fontSize: FontSizeManager.fs16,
                      color: AppColorManager.textAppColor,
                    ),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Directionality(
                          textDirection: ui.TextDirection.ltr,
                          child: AppTextWidget(
                            text: follower?.username ?? '',
                            fontSize: FontSizeManager.fs14,
                            color: AppColorManager.textGrey,
                          ),
                        ),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          onTap: () {
                            if (follower?.whatsapp == null) return;
                            UrlLauncherHelper.openWhatsapp(
                                phoneNumber: follower?.whatsapp);
                          },
                          child: SizedBox(
                            width: AppHeightManager.h2point5,
                            height: AppHeightManager.h2point5,
                            child: SvgPicture.asset(
                              AppIconManager.whatsapp,
                              colorFilter: ColorFilter.mode(
                                  follower?.whatsapp == null
                                      ? AppColorManager.textGrey
                                      : AppColorManager.green,
                                  BlendMode.srcIn),
                            ),
                          ),
                        ),
                        IconButton(
                            splashColor: AppColorManager.transparent,
                            highlightColor: AppColorManager.transparent,
                            onPressed: () {
                              if (follower?.phone == null) return;
                              UrlLauncherHelper.makeCall(
                                  phoneNumber: follower?.phone);
                            },
                            icon: Icon(
                              Icons.call,
                              size: AppHeightManager.h2point5,
                              color: follower?.phone == null
                                  ? AppColorManager.textGrey
                                  : AppColorManager.mainColor,
                            )),
                      ],
                    ),
                  ),
                );
              }
            },
          );
        },
      ),
    );
  }
}
