import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzad_damascus/app/app.dart';
import 'package:mzad_damascus/core/resource/size_manager.dart';
import 'package:mzad_damascus/core/widget/button/main_app_button.dart';
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
import 'package:mzad_damascus/feature/more/presentation/cubit/myitem_cubit/myitem_cubit.dart';
import 'package:mzad_damascus/feature/more/presentation/cubit/myitem_cubit/myitem_state.dart';
import 'package:mzad_damascus/feature/more/domain/entity/request/myitem_request_entity.dart';
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
        BlocProvider(
          create: (context) => di.sl<MyItemCubit>()
            ..getMyItems(
              context: context,
              entity: MyItemRequestEntity(page: 1),
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
        _buildFollowersSection(),
        _buildFollowingSection(),
        _buildPostedAdsSection(),
        _buildWhatsappSection(),
      ],
    );
  }

  Widget _buildFollowersSection() {
    return MainAppButton(
      onTap: () => _navigateToScreen(const MyFollowersScreen()),
      child: Column(
        children: [
          BlocBuilder<MyFollowersCubit, MyFollowersState>(
            builder: (context, state) {
              return AppTextWidget(
                text: state.entity.data?.pagination?.totalItems?.toString() ??
                    '0',
                fontSize: FontSizeManager.fs15,
                fontWeight: FontWeight.w700,
                color: AppColorManager.textAppColor,
              );
            },
          ),
          SizedBox(height: AppWidthManager.w2),
          AppTextWidget(
            text: "followers".tr(),
            fontSize: FontSizeManager.fs15,
            color: AppColorManager.textGrey,
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
    );
  }

  Widget _buildFollowingSection() {
    return MainAppButton(
      onTap: () => _navigateToScreen(const MyFollowingScreen()),
      child: Column(
        children: [
          BlocBuilder<MyFollowingCubit, MyFollowingState>(
            builder: (context, state) {
              return AppTextWidget(
                text: state.entity.data?.pagination?.totalItems?.toString() ??
                    '0',
                fontSize: FontSizeManager.fs15,
                fontWeight: FontWeight.w700,
                color: AppColorManager.textAppColor,
              );
            },
          ),
          SizedBox(height: AppWidthManager.w2),
          AppTextWidget(
            text: "following".tr(),
            fontSize: FontSizeManager.fs15,
            color: AppColorManager.textGrey,
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
    );
  }

  Widget _buildPostedAdsSection() {
    return Column(
      children: [
        BlocBuilder<MyItemCubit, MyitemState>(
          builder: (context, state) {
            final totalItems =
                state.entity.data?.pagination?.totalItems?.toString() ?? '0';
            return AppTextWidget(
              text: totalItems,
              fontSize: FontSizeManager.fs15,
              fontWeight: FontWeight.w700,
              color: AppColorManager.textAppColor,
            );
          },
        ),
        SizedBox(height: AppWidthManager.w2),
        AppTextWidget(
          text: 'advertisements'.tr(),
          fontSize: FontSizeManager.fs15,
          color: AppColorManager.textGrey,
          fontWeight: FontWeight.w600,
          maxLines: 2,
        ),
      ],
    );
  }

  Widget _buildWhatsappSection() {
    return Column(
      children: [
        AppTextWidget(
          text: widget.profileInfo?.user?.whatsapp ?? '--',
          fontSize: FontSizeManager.fs15,
          fontWeight: FontWeight.w700,
          color: AppColorManager.textAppColor,
        ),
        SizedBox(height: AppWidthManager.w2),
        AppTextWidget(
          text: 'whatsapp'.tr(),
          fontSize: FontSizeManager.fs15,
          color: AppColorManager.textGrey,
          fontWeight: FontWeight.w600,
        ),
      ],
    );
  }

  void _navigateToScreen(Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }
}
