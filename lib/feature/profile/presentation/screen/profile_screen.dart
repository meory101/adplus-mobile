import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzad_damascus/core/resource/color_manager.dart';
import 'package:mzad_damascus/core/resource/font_manager.dart';
import 'package:mzad_damascus/core/widget/text/app_text_widget.dart';
import 'package:mzad_damascus/feature/favorite/domain/entity/request/favorite_request_entity.dart';
import 'package:mzad_damascus/feature/favorite/domain/entity/request/favorites_request_entity.dart';
import 'package:mzad_damascus/feature/favorite/presentation/cubit/favorites_cubit/favorites_cubit.dart';
import 'package:mzad_damascus/feature/profile/presentation/cubit/get_profile_cubit/get_profile_info_cubit.dart';
import 'package:mzad_damascus/feature/profile/presentation/widget/activity_card.dart';
import 'package:mzad_damascus/feature/profile/presentation/widget/comments_list_view.dart';
import 'package:mzad_damascus/feature/profile/presentation/widget/favorite_list_view.dart';
import 'package:mzad_damascus/feature/profile/presentation/widget/likes_list_view.dart';
import 'package:mzad_damascus/feature/profile/presentation/widget/profile_info_card.dart';
import '../../../../core/resource/size_manager.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    initScroll();
    getData();
    initProfileScreen();
    super.initState();
  }

  initScroll() {
    scrollController.addListener(
      () {
        if (scrollController.position.pixels >=
            scrollController.position.maxScrollExtent) {
          context.read<FavoritesCubit>().getMyFavorites(
              context: context, entity: MyFavoritesRequestEntity());
        }
      },
    );
  }

  initProfileScreen() {
    context.read<GetProfileInfoCubit>().getProfileInfo(context: context);
  }

  int selectedIndex = 0;
  ScrollController scrollController = ScrollController();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
  getData(){
    if(selectedIndex == 0){
      context.read<FavoritesCubit>().resetData();
      context.read<FavoritesCubit>()
          .getMyFavorites(context: context, entity: MyFavoritesRequestEntity());
    }else{

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        surfaceTintColor: AppColorManager.background,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppTextWidget(
                text: 'profile'.tr(),
                fontSize: FontSizeManager.fs17,
                color: AppColorManager.textAppColor,
                fontWeight: FontWeight.w700),
          ],
        ),
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const ProfileInfoCard(),
            Divider(
              color: AppColorManager.borderGrey,
              thickness: 1.0,
              indent: AppWidthManager.w3Point8,
              endIndent: AppWidthManager.w3Point8,
            ),
            ActivityCard(
              onActivityTapChanged: (index) {
                setState(() {
                  selectedIndex = index;
                  getData();
                });
              },
            ),
            SizedBox(
              height: AppHeightManager.h2,
            ),
            selectedIndex == 0
                ? const FavoriteListView()
                : selectedIndex == 1
                    ? const CommentsListView()
                    : selectedIndex == 2
                        ? const LikesListView()
                        : SizedBox(
                            height: AppHeightManager.h3,
                          )
          ],
        ),
      ),
    );
  }
}
