import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzad_damascus/core/resource/size_manager.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/request/myfolloweing_request_entity.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/response/get_profile_info_response_entity.dart';
import 'package:mzad_damascus/feature/profile/domain/entity/request/myfollowers_request_entity.dart';
import 'package:mzad_damascus/feature/profile/presentation/cubit/myfollowers_cubit/myfollowers_cubit.dart';
import 'package:mzad_damascus/feature/profile/presentation/cubit/myfollowers_cubit/myfollowers_state.dart';
import 'package:mzad_damascus/feature/profile/presentation/cubit/myfollowing_cubit/myfollowing_cubit.dart';
import 'package:mzad_damascus/feature/profile/presentation/cubit/myfollowing_cubit/myfollowing_state.dart';
import 'package:mzad_damascus/core/injection/injection_container.dart' as di;
import 'package:mzad_damascus/feature/profile/presentation/screen/myfollowers_screen.dart';
import 'package:mzad_damascus/feature/profile/presentation/screen/myfollowing_screen.dart';
import '../../../../core/resource/color_manager.dart';
import '../../../../core/resource/font_manager.dart';
import '../../../../core/widget/text/app_text_widget.dart';

class ProfileFollowingInfoCard extends StatefulWidget {
  final ProfileInfo? profileInfo;
  const ProfileFollowingInfoCard({super.key, required this.profileInfo});

  @override
  State<ProfileFollowingInfoCard> createState() =>
      _ProfileFollowingInfoCardState();
}

class _ProfileFollowingInfoCardState extends State<ProfileFollowingInfoCard> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.sl<MyFollowersCubit>()
            ..getMyFollowers(
              context: context,
              entity: MyFollowersRequestEntity(page: 1),
            ),
        ),
        BlocProvider(
          create: (context) => di.sl<MyFollowingCubit>()
            ..getMyFollowing(
              context: context,
              entity: MyFollowingRequestEntity(page: 1),
            ),
        ),
      ],
      child: _buildContent(),
    );
  }

  Widget _buildContent() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            BlocBuilder<MyFollowersCubit, MyFollowersState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MyFollowersScreen(),
                      ),
                    );
                  },
                  child: AppTextWidget(
                    text: state.entity.data?['total']?.toString() ?? '0',
                    fontSize: FontSizeManager.fs15,
                    fontWeight: FontWeight.w700,
                    color: AppColorManager.textAppColor,
                  ),
                );
              },
            ),
            SizedBox(height: AppWidthManager.w2),
            AppTextWidget(
              text: "followers",
              fontSize: FontSizeManager.fs14,
              color: AppColorManager.textGrey,
            ),
          ],
        ),
        Column(
          children: [
            BlocBuilder<MyFollowingCubit, MyFollowingState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MyFollowingScreen(),
                      ),
                    );
                  },
                  child: AppTextWidget(
                    text: state.entity.data?['total']?.toString() ?? '0',
                    fontSize: FontSizeManager.fs15,
                    fontWeight: FontWeight.w700,
                    color: AppColorManager.textAppColor,
                  ),
                );
              },
            ),
            SizedBox(height: AppWidthManager.w2),
            AppTextWidget(
              text: "Following",
              fontSize: FontSizeManager.fs14,
              color: AppColorManager.textGrey,
            ),
          ],
        ),
        Column(
          children: [
            AppTextWidget(
              text: '0/100',
              fontSize: FontSizeManager.fs15,
              fontWeight: FontWeight.w700,
              color: AppColorManager.textAppColor,
            ),
            SizedBox(height: AppWidthManager.w2),
            AppTextWidget(
              text: 'Posted Ads',
              fontSize: FontSizeManager.fs14,
              color: AppColorManager.textGrey,
            ),
          ],
        ),
        Column(
          children: [
            AppTextWidget(
              text: widget.profileInfo?.user?.whatsapp ?? '--',
              fontSize: FontSizeManager.fs15,
              fontWeight: FontWeight.w700,
              color: AppColorManager.textAppColor,
            ),
            SizedBox(height: AppWidthManager.w2),
            AppTextWidget(
              text: 'whatsapp',
              fontSize: FontSizeManager.fs14,
              color: AppColorManager.textGrey,
            ),
          ],
        )
      ],
    );
  }
}
