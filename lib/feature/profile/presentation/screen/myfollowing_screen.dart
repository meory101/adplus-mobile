import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzad_damascus/core/injection/injection_container.dart' as di;
import 'package:mzad_damascus/core/resource/cubit_status_manager.dart';
import 'package:mzad_damascus/core/widget/app_bar/main_app_bar.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/request/myfolloweing_request_entity.dart';
import 'package:mzad_damascus/feature/profile/presentation/cubit/myfollowing_cubit/myfollowing_cubit.dart';
import 'package:mzad_damascus/feature/profile/presentation/cubit/myfollowing_cubit/myfollowing_state.dart';
import '../../../../core/helper/lanucher_helper.dart';
import '../../../../core/resource/color_manager.dart';
import '../../../../core/resource/constant_manager.dart';
import '../../../../core/resource/font_manager.dart';
import '../../../../core/widget/text/app_text_widget.dart';

class MyFollowingScreen extends StatelessWidget {
  const MyFollowingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<MyFollowingCubit>()
        ..getMyFollowing(
          context: context,
          entity: MyFollowingRequestEntity(page: 1),
        ),
      child: Scaffold(
        appBar: MainAppBar(
          title: ('Following'),
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
              return const Center(
                child: Text('You are not following anyone yet'),
              );
            }

            return ListView.builder(
              itemCount: followingList.length,
              itemBuilder: (context, index) {
                final followingItem = followingList[index];
                final follower = followingItem.follower;
                
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: follower?.photo != null
                        ? NetworkImage('${AppConstantManager.imageBaseUrl}${follower?.photo}')
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
                      onPressed: (){
                        UrlLauncherHelper.makeCall(phoneNumber: follower?.phone);
                      }, icon: Icon(
                    Icons. call,
                    color: AppColorManager.green,
                  ))
                      : null,
                );
              },
            );
          },
        ),
      ),
    );
  }
}