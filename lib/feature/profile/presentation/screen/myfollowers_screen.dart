import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mzad_damascus/core/helper/lanucher_helper.dart';
import 'package:mzad_damascus/core/resource/constant_manager.dart';
import 'package:mzad_damascus/core/resource/cubit_status_manager.dart';
import 'package:mzad_damascus/core/widget/app_bar/main_app_bar.dart';
import 'package:mzad_damascus/core/widget/empty/empty_widget.dart';
import 'package:mzad_damascus/feature/home/presentation/screen/auhter_profile_screen.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/request/myfollowers_request_entity.dart';
import 'package:mzad_damascus/feature/profile/presentation/cubit/myfollowers_cubit/myfollowers_cubit.dart';
import 'package:mzad_damascus/feature/profile/presentation/cubit/myfollowers_cubit/myfollowers_state.dart';
import 'package:mzad_damascus/router/router.dart';
import '../../../../core/resource/color_manager.dart';
import '../../../../core/resource/font_manager.dart';
import '../../../../core/resource/icon_manager.dart';
import '../../../../core/resource/size_manager.dart';
import '../../../../core/widget/text/app_text_widget.dart';
import 'dart:ui' as ui;

class MyFollowersScreen extends StatefulWidget {
  const MyFollowersScreen({super.key});

  @override
  State<MyFollowersScreen> createState() => _MyFollowersScreenState();
}

class _MyFollowersScreenState extends State<MyFollowersScreen> {
  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

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
          context.read<MyFollowersCubit>().getMyFollowers(
                context: context,
                entity: MyFollowersRequestEntity(),
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
        title: ('followers'.tr()),
      ),
      body: BlocBuilder<MyFollowersCubit, MyFollowersState>(
        builder: (context, state) {
          if (state.status == CubitStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.status == CubitStatus.error) {
            return Center(
              child: Text(state.error),
            );
          }

          final followersList = state.entity.data?.data;

          if (followersList == null || followersList.isEmpty) {
            return EmptyWidget(
              subTitle: 'couldNotFindAnyResult'.tr(),
              title: 'noFollowersYet'.tr(),
            );
          }
          return ListView.builder(
              controller: scrollController,
              itemCount:
                  followersList.length + (state.isReachedMax == true ? 0 : 1),
              itemBuilder: (context, index) {
                if (index == followersList.length) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  final followerItem = followersList[index];
                  final following = followerItem.following;

                  return InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                          RouteNamedScreens.authorProfile,
                          arguments: AuthorProfileArgs(
                              userName: following?.username ?? ""));
                    },
                    child: ListTile(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: AppWidthManager.w3),
                      leading: CircleAvatar(
                        backgroundColor: AppColorManager.lightGreyOpacity6,
                        backgroundImage: following?.photo != null
                            ? NetworkImage(
                                '${AppConstantManager.imageBaseUrl}${following?.photo}')
                            : null,
                        child: following?.photo == null
                            ? const Icon(Icons.person)
                            : null,
                      ),
                      title: AppTextWidget(
                        text: following?.name ?? '',
                        fontSize: FontSizeManager.fs16,
                        color: AppColorManager.textAppColor,
                      ),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Directionality(
                            textDirection: ui.TextDirection.ltr,
                            child: AppTextWidget(
                              text: following?.username ?? '',
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
                              if (following?.whatsapp == null) return;
                              UrlLauncherHelper.openWhatsapp(
                                  phoneNumber: following?.whatsapp);
                            },
                            child: SizedBox(
                              width: AppHeightManager.h2point5,
                              height: AppHeightManager.h2point5,
                              child: SvgPicture.asset(
                                AppIconManager.whatsapp,
                                colorFilter: ColorFilter.mode(
                                    following?.whatsapp == null
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
                                if (following?.phone == null) return;
                                UrlLauncherHelper.makeCall(
                                    phoneNumber: following?.phone);
                              },
                              icon: Icon(
                                Icons.call,
                                size: AppHeightManager.h2point5,
                                color: following?.phone == null
                                    ? AppColorManager.textGrey
                                    : AppColorManager.mainColor,
                              )),
                        ],
                      ),
                    ),
                  );
                }
              });
        },
      ),
    );
  }
}
