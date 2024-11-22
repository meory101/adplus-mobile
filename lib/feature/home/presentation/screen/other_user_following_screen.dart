import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzad_damascus/core/injection/injection_container.dart' as di;
import 'package:mzad_damascus/core/resource/cubit_status_manager.dart';
import 'package:mzad_damascus/core/widget/app_bar/main_app_bar.dart';
import 'package:mzad_damascus/feature/home/presentation/cubit/following_cubit/following_cubit.dart';
import 'package:mzad_damascus/feature/home/presentation/cubit/following_cubit/following_state.dart';
import 'package:mzad_damascus/feature/home/presentation/screen/other_user_followers_screen.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/request/myfolloweing_request_entity.dart';
import 'package:mzad_damascus/feature/profile/presentation/cubit/myfollowing_cubit/myfollowing_cubit.dart';
import 'package:mzad_damascus/feature/profile/presentation/cubit/myfollowing_cubit/myfollowing_state.dart';
import '../../../../core/helper/lanucher_helper.dart';
import '../../../../core/resource/color_manager.dart';
import '../../../../core/resource/constant_manager.dart';
import '../../../../core/resource/enum_manager.dart';
import '../../../../core/resource/font_manager.dart';
import '../../../../core/widget/loading/app_circular_progress_widget.dart';
import '../../../../core/widget/text/app_text_widget.dart';
import '../../../../router/router.dart';
import '../../../home/presentation/screen/auhter_profile_screen.dart';
import '../../domain/entity/request/followers_request_entity.dart';

class OtherUserFollowingScreen extends StatelessWidget {
  final OtherUserFollowingDataArgs args;

  const OtherUserFollowingScreen({super.key, required this.args});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: ('following'.tr()),
      ),
      body: BlocBuilder<FollowingCubit, FollowingState>(
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
            return Center(
              child: Text('noFollowingYet'.tr()),
            );
          }

          return NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification scrollInfo) {
            if (state.status != CubitStatus.loading &&
                scrollInfo.metrics.pixels >=
                    scrollInfo.metrics.maxScrollExtent) {
              context.read<FollowingCubit>().getFollowings(
                  context: context, entity: FollowersRequestEntity(
                  username: args.user.username??""
              ));
            }
            return true;
          },
          child: ListView.builder(
            itemCount: followingList.length+1,
            itemBuilder: (context, index) {
              if (index == followingList.length) {
                if (followingList.length < EnumManager.paginationLength) {
                  return const SizedBox();
                }
                return const AppCircularProgressWidget();
              }
              final followingItem = followingList[index];
              final follower = followingItem.following;


              return InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(
                      RouteNamedScreens.authorProfile,
                      arguments:
                          AuthorProfileArgs(userName: follower?.username ?? ""));
                },
                child: ListTile(
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
                  subtitle: AppTextWidget(
                    text: follower?.username ?? '',
                    fontSize: FontSizeManager.fs14,
                    color: AppColorManager.textGrey,
                  ),
                  trailing: follower?.phone != null
                      ? IconButton(
                          splashColor: AppColorManager.transparent,
                          highlightColor: AppColorManager.transparent,
                          onPressed: () {
                            UrlLauncherHelper.makeCall(
                                phoneNumber: follower?.phone ?? "");
                          },
                          icon: Icon(
                            Icons.call,
                            color: AppColorManager.green,
                          ))
                      : null,
                ),
              );
            },
          ));
        },
      ),
    );
  }
}
