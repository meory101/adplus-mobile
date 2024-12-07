import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:mzad_damascus/app/app.dart';
import 'package:mzad_damascus/core/model/user.dart';
import 'package:mzad_damascus/core/resource/cubit_status_manager.dart';
import 'package:mzad_damascus/core/resource/font_manager.dart';
import 'package:mzad_damascus/core/resource/size_manager.dart';
import 'package:mzad_damascus/core/widget/app_bar/main_app_bar.dart';
import 'package:mzad_damascus/core/widget/button/main_app_button.dart';
import 'package:mzad_damascus/core/widget/container/decorated_container.dart';
import 'package:mzad_damascus/core/widget/container/shimmer_container.dart';
import 'package:mzad_damascus/core/widget/form_field/app_form_field.dart';
import 'package:mzad_damascus/core/widget/image/main_image_widget.dart';
import 'package:mzad_damascus/core/widget/loading/app_circular_progress_widget.dart';
import 'package:mzad_damascus/core/widget/snack_bar/note_message.dart';
import 'package:mzad_damascus/core/widget/text/app_text_widget.dart';
import 'package:mzad_damascus/feature/home/domain/entity/request/search_user_request_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/search_user_response_entity.dart';
import 'package:mzad_damascus/feature/home/presentation/cubit/search_user/search_user_cubit.dart';
import 'package:mzad_damascus/feature/home/presentation/screen/auhter_profile_screen.dart';
import 'package:mzad_damascus/router/router.dart';
import 'dart:ui' as ui;

import '../../../../core/resource/color_manager.dart';

class SearchUserScreen extends StatefulWidget {
  const SearchUserScreen({super.key});

  @override
  State<SearchUserScreen> createState() => _SearchUserScreenState();
}

class _SearchUserScreenState extends State<SearchUserScreen> {
  SearchUserRequestEntity entity = SearchUserRequestEntity();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(title: ""),
      floatingActionButton: BlocConsumer<SearchUserCubit, SearchUserState>(
        listener: (context, state) {
          if (state.status == CubitStatus.error) {
            NoteMessage.showErrorSnackBar(context: context, text: state.error);
          }
        },
        builder: (context, state) {
          if (state.status == CubitStatus.loading) {
            return Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppWidthManager.w3Point8,
                  ),
              child: ShimmerContainer(
                  width: AppWidthManager.w100, height: AppHeightManager.h6),
            );
          }
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: AppWidthManager.w3Point8),
            child: AppTextFormField(
              onChanged: (value) {
                entity.searchText = value;
              },
              hintText: "search".tr(),
              initialValue: entity.searchText,
              suffixIcon: IconButton(
                icon: const Icon(
                  Icons.search,
                  color: AppColorManager.mainColor,
                ),
                onPressed: () {
                  if ((entity.searchText ?? "").isEmpty) return;
                  context
                      .read<SearchUserCubit>()
                      .searchUser(context: context, entity: entity);
                },
              ),
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
      body: SingleChildScrollView(
        child: BlocConsumer<SearchUserCubit, SearchUserState>(
          listener: (context, state) {
            if (state.status == CubitStatus.error) {
              NoteMessage.showErrorSnackBar(
                  context: context, text: state.error);
            }
          },
          builder: (context, state) {
            if (state.status == CubitStatus.loading) {
              return Container(
                margin: EdgeInsets.only(top: AppHeightManager.h10),
                alignment: Alignment.center,
                child: const AppCircularProgressWidget(),
              );
            }
            List<User> users = state.entity.data ?? [];
            return Padding(
              padding: EdgeInsets.only(
                  top: AppHeightManager.h6,
                  left: AppWidthManager.w3Point8,
                  right: AppWidthManager.w3Point8),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: users.length,
                itemBuilder: (context, index) {
                  return DecoratedContainer(
                    margin: EdgeInsets.only(bottom: AppHeightManager.h2point5),
                    padding: EdgeInsets.symmetric(
                        vertical: AppHeightManager.h2,
                        horizontal: AppWidthManager.w3Point8),
                    child: Row(
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
                              vertical: AppHeightManager.h05),
                          color: AppColorManager.mainColor,
                          child: AppTextWidget(
                              text: "userProfile".tr(),
                              fontWeight: FontWeight.w600,
                              color: AppColorManager.white,
                              fontSize: FontSizeManager.fs16),
                        )
                      ],
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
