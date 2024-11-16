import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzad_damascus/core/helper/lanucher_helper.dart';
import 'package:mzad_damascus/core/injection/injection_container.dart' as di;
import 'package:mzad_damascus/core/resource/constant_manager.dart';
import 'package:mzad_damascus/core/resource/cubit_status_manager.dart';
import 'package:mzad_damascus/core/widget/app_bar/main_app_bar.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/request/myfollowers_request_entity.dart';
import 'package:mzad_damascus/feature/profile/presentation/cubit/myfollowers_cubit/myfollowers_cubit.dart';
import 'package:mzad_damascus/feature/profile/presentation/cubit/myfollowers_cubit/myfollowers_state.dart';
import '../../../../core/resource/color_manager.dart';
import '../../../../core/resource/font_manager.dart';
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
          title: ('My Followers'),
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
              return const Center(
                child: Text('No followers yet'),
              );
            }

            return ListView.builder(
              itemCount: followersList.length,
              itemBuilder: (context, index) {
                final followerItem = followersList[index];
                final following = followerItem.following;

                return ListTile(
                  leading: CircleAvatar(
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