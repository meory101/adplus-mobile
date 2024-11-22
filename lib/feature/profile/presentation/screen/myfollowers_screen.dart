import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzad_damascus/app/app.dart';
import 'package:mzad_damascus/core/helper/lanucher_helper.dart';
import 'package:mzad_damascus/core/injection/injection_container.dart' as di;
import 'package:mzad_damascus/core/resource/constant_manager.dart';
import 'package:mzad_damascus/core/resource/cubit_status_manager.dart';
import 'package:mzad_damascus/core/widget/app_bar/main_app_bar.dart';
import 'package:mzad_damascus/feature/home/presentation/screen/auhter_profile_screen.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/request/myfollowers_request_entity.dart';
import 'package:mzad_damascus/feature/profile/presentation/cubit/myfollowers_cubit/myfollowers_cubit.dart';
import 'package:mzad_damascus/feature/profile/presentation/cubit/myfollowers_cubit/myfollowers_state.dart';
import 'package:mzad_damascus/router/router.dart';
import '../../../../core/resource/color_manager.dart';
import '../../../../core/resource/enum_manager.dart';
import '../../../../core/resource/font_manager.dart';
import '../../../../core/widget/loading/app_circular_progress_widget.dart';
import '../../../../core/widget/text/app_text_widget.dart';

class MyFollowersScreen extends StatelessWidget {
  const MyFollowersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<MyFollowersCubit>()
        ..getMyFollowers(
          context: context,
          entity: MyFollowersRequestEntity(page: 1),
        ),
      child: Scaffold(
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
              return  Center(
                child: Text('noFollowersYet'.tr()),
              );
            }

            return
              NotificationListener<ScrollNotification>(
                onNotification: (ScrollNotification scrollInfo) {
              if (state.status != CubitStatus.loading &&
                  scrollInfo.metrics.pixels >=
                      scrollInfo.metrics.maxScrollExtent) {
                context.read<MyFollowersCubit>().getMyFollowers(
                    context: context, entity: MyFollowersRequestEntity(
                ));
              }
              return true;
            },
            child:
              ListView.builder(
              itemCount: followersList.length+1,
              itemBuilder: (context, index) {if (index == followersList.length) {
                if (followersList.length < EnumManager.paginationLength) {
                  return const SizedBox();
                }
                return const AppCircularProgressWidget();
              }

                final followerItem = followersList[index];
                final following = followerItem.following;

                return InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(RouteNamedScreens.authorProfile,
                    arguments: AuthorProfileArgs(userName: following?.username??"")
                    );
                  },
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: AppColorManager.lightGreyOpacity6,
                      backgroundImage: following?.photo != null
                          ? NetworkImage('${AppConstantManager.imageBaseUrl}${following?.photo}')
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
                    subtitle: AppTextWidget(
                      text: following?.username ?? '',
                      fontSize: FontSizeManager.fs14,
                      color: AppColorManager.textGrey,
                    ),
                    trailing: following?.phone != null
                        ? IconButton(
                        splashColor: AppColorManager.transparent,
                        highlightColor: AppColorManager.transparent,
                        onPressed: (){
                          UrlLauncherHelper.makeCall(phoneNumber: following?.phone);
                    }, icon: const Icon(
                      Icons. call,
                      color: AppColorManager.green,
                    ))
                        : null,
                  ),
                );
              },
              ) );
          },
        ),
      ),
    );
  }
}