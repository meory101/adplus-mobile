import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzad_damascus/core/model/comment.dart';
import 'package:mzad_damascus/core/storage/shared/shared_pref.dart';
import 'package:mzad_damascus/core/widget/bottom_sheet/login_bottom_sheet.dart';
import 'package:mzad_damascus/core/widget/container/decorated_container.dart';
import 'package:mzad_damascus/core/widget/loading/app_circular_progress_widget.dart';
import 'package:mzad_damascus/core/widget/loading/shimmer/comment_section_shimmer.dart';
import 'package:mzad_damascus/feature/home/domain/entity/request/add_comment_request_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/request/get_comments_request_entity.dart';
import 'package:mzad_damascus/feature/home/presentation/cubit/add_comment_cubit/add_comment_cubit.dart';
import 'package:mzad_damascus/feature/home/presentation/cubit/get_comments_cubit/get_comments_cubit.dart';
import 'package:mzad_damascus/feature/home/presentation/screen/auhter_profile_screen.dart';
import 'package:mzad_damascus/router/router.dart';
import '../../../../../core/resource/color_manager.dart';
import '../../../../../core/resource/constant_manager.dart';
import '../../../../../core/resource/cubit_status_manager.dart';
import '../../../../../core/resource/enum_manager.dart';
import '../../../../../core/resource/font_manager.dart';
import '../../../../../core/resource/size_manager.dart';
import '../../../../../core/widget/button/main_app_button.dart';
import '../../../../../core/widget/form_field/title_app_form_filed.dart';
import '../../../../../core/widget/image/main_image_widget.dart';
import '../../../../../core/widget/snack_bar/note_message.dart';
import '../../../../../core/widget/text/app_text_widget.dart';
import '../../../../../core/injection/injection_container.dart' as di;

class CommentsSection extends StatefulWidget {
  final num? itemId;

  const CommentsSection({super.key, required this.itemId});

  @override
  State<CommentsSection> createState() => _CommentsSectionState();
}

AddCommentRequestEntity entity = AddCommentRequestEntity();

class _CommentsSectionState extends State<CommentsSection> {
  @override
  void initState() {
    entity.itemId = widget.itemId;
    initScroll();
    super.initState();
  }

  ScrollController? scrollController = ScrollController();

  initScroll() {
    scrollController?.addListener(() {
      double pixels = scrollController?.position.pixels ?? 0.0;
      double maxScrollExtent =
          scrollController?.position.maxScrollExtent ?? 0.0;

      if (pixels >= maxScrollExtent) {
        context.read<GetCommentsCubit>().getComments(
            context: context,
            entity: GetCommentsRequestEntity(itemId: widget.itemId));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetCommentsCubit, GetCommentsState>(
        listener: (context, state) {
      if (state.status == CubitStatus.error) {
        NoteMessage.showErrorSnackBar(context: context, text: state.error);
      }
    }, builder: (context, state) {
      if (state.status == CubitStatus.loading) {
        return Padding(
          padding:  EdgeInsets.only(top: AppHeightManager.h1point8),
          child: CommentSectionShimmer(),
        );
      }

      List<Comment>? comments = state.entity.data?.data;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: AppHeightManager.h1,
          ),
          AppTextWidget(
              fontWeight: FontWeight.w700,
              fontSize: FontSizeManager.fs16,
              text: "comments".tr()),
          SizedBox(
            height: AppHeightManager.h1point5,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: (comments?.length ?? 0) > 6 ? 6 : comments?.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                              RouteNamedScreens.authorProfile,
                              arguments: AuthorProfileArgs(
                                  userName: comments?[index].client?.username));
                        },
                        child: Row(
                          children: [
                            Container(
                              height: AppWidthManager.w11,
                              width: AppWidthManager.w11,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              decoration:
                                  const BoxDecoration(shape: BoxShape.circle),
                              child: MainImageWidget(
                                imageUrl: AppConstantManager.imageBaseUrl +
                                    (comments?[index].client?.photo ?? ""),
                              ),
                            ),
                            SizedBox(
                              width: AppWidthManager.w2,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppTextWidget(
                                    maxLines: 2,
                                    fontWeight: FontWeight.w700,
                                    fontSize: FontSizeManager.fs15,
                                    text: comments?[index].client?.name ?? ""),
                                AppTextWidget(
                                    maxLines: 2,
                                    fontWeight: FontWeight.w600,
                                    fontSize: FontSizeManager.fs15,
                                    text: comments?[index].comment ?? ""),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: AppHeightManager.h1point8,
                      )
                    ],
                  );
                },
              ),
            ],
          ),
          SizedBox(
            height: AppHeightManager.h05,
          ),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                backgroundColor: AppColorManager.white,
                showDragHandle: true,
                builder: (context) {
                  return BlocProvider(
                    create: (context) => di.sl<GetCommentsCubit>()
                      ..getComments(
                          context: context,
                          entity: GetCommentsRequestEntity(
                              page: 1, itemId: widget.itemId)),
                    child: BlocConsumer<GetCommentsCubit, GetCommentsState>(
                        listener: (context, state) {
                      if (state.status == CubitStatus.error) {
                        NoteMessage.showErrorSnackBar(
                            context: context, text: state.error);
                      }
                    }, builder: (context, state) {
                      if (state.status == CubitStatus.loading) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: AppWidthManager.w3Point8,
                              vertical: AppHeightManager.h1point8),
                          child: const CommentSectionShimmer(),
                        );
                      }

                      List<Comment>? comments = state.entity.data?.data ?? [];
                      return NotificationListener<ScrollNotification>(
                          onNotification: (ScrollNotification scrollInfo) {
                            if (state.status != CubitStatus.loading &&
                                scrollInfo.metrics.pixels >=
                                    scrollInfo.metrics.maxScrollExtent) {
                              context.read<GetCommentsCubit>().getComments(
                                  context: context,
                                  entity: GetCommentsRequestEntity(
                                      itemId: widget.itemId));
                            }
                            return true;
                          },
                          child: DecoratedContainer(
                            color: AppColorManager.white,
                            height: AppHeightManager.h50,
                            width: AppWidthManager.w100,
                            padding: EdgeInsets.symmetric(
                                horizontal: AppWidthManager.w3Point8),
                            child: Column(
                              children: [
                                AppTextWidget(
                                    maxLines: 2,
                                    fontWeight: FontWeight.w700,
                                    fontSize: FontSizeManager.fs16,
                                    text: "comments".tr()),
                                Expanded(
                                  child: ListView.builder(
                                    controller: scrollController,
                                    itemCount: (comments.length ?? 0) + 1,
                                    itemBuilder: (context, index) {
                                      if (index == comments.length) {
                                        return Visibility(
                                          visible: state.isReachedMax ==
                                                  false &&
                                              state.status != CubitStatus.error,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Center(
                                                child: SizedBox(
                                                    height: AppHeightManager.h5,
                                                    width: AppHeightManager.h5,
                                                    child:
                                                        const AppCircularProgressWidget()),
                                              ),
                                            ],
                                          ),
                                        );
                                      }
                                      return SizedBox(
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    Navigator.of(context).pushNamed(
                                                        RouteNamedScreens
                                                            .authorProfile,
                                                        arguments:
                                                            AuthorProfileArgs(
                                                                userName: comments[
                                                                        index]
                                                                    .client
                                                                    ?.username));
                                                  },
                                                  child: Container(
                                                    height: AppWidthManager.w11,
                                                    width: AppWidthManager.w11,
                                                    clipBehavior: Clip
                                                        .antiAliasWithSaveLayer,
                                                    decoration:
                                                        const BoxDecoration(
                                                            shape: BoxShape
                                                                .circle),
                                                    child: MainImageWidget(
                                                      imageUrl:
                                                          AppConstantManager
                                                                  .imageBaseUrl +
                                                              (comments[index]
                                                                      .client
                                                                      ?.photo ??
                                                                  ""),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: AppWidthManager.w2,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    AppTextWidget(
                                                        maxLines: 2,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize:
                                                            FontSizeManager
                                                                .fs15,
                                                        text: comments[index]
                                                                .client
                                                                ?.name ??
                                                            ""),
                                                    AppTextWidget(
                                                        maxLines: 2,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize:
                                                            FontSizeManager
                                                                .fs15,
                                                        text: comments[index]
                                                                .comment ??
                                                            ""),
                                                  ],
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: AppHeightManager.h1point8,
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ));
                    }),
                  );
                },
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AppTextWidget(
                    fontWeight: FontWeight.w700,
                    color: AppColorManager.mainColor,
                    decorationColor: AppColorManager.mainColor,
                    textDecoration: TextDecoration.underline,
                    fontSize: FontSizeManager.fs15,
                    text: "moreComments".tr()),
              ],
            ),
          ),
          SizedBox(
            height: AppHeightManager.h05,
          ),
          TitleAppFormFiled(
            hint: "yourComment".tr(),
            title: "yourComment".tr(),
            onChanged: (value) {
              entity.comment = value;
              return null;
            },
            validator: (value) {
              return null;
            },
          ),
          SizedBox(
            height: AppHeightManager.h1point8,
          ),
          BlocConsumer<AddCommentCubit, AddCommentState>(
            listener: (context, state) {
              if (state.status == CubitStatus.error) {
                NoteMessage.showErrorSnackBar(
                    context: context, text: state.error);
              }
              if (state.status == CubitStatus.success) {
                entity.comment = null;
                context.read<GetCommentsCubit>().resetData();
                context.read<GetCommentsCubit>().getComments(
                    context: context,
                    entity: GetCommentsRequestEntity(
                        page: 1, itemId: widget.itemId));
              }
            },
            builder: (context, state) {
              if (state.status == CubitStatus.loading) {
                return const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppCircularProgressWidget(),
                  ],
                );
              }
              return MainAppButton(
                onTap: () {

                  if (AppSharedPreferences.getToken().isEmpty) {
                    showLoginBottomSheet(context: context);
                    return;
                  }
                  print(entity.comment);
                  if((entity.comment??"").isEmpty){
                    return;
                  }
                  context
                      .read<AddCommentCubit>()
                      .addComment(context: context, entity: entity);
                },
                borderRadius: BorderRadius.circular(AppRadiusManager.r10),
                height: AppHeightManager.h6,
                color: AppColorManager.mainColor,
                alignment: Alignment.center,
                child: AppTextWidget(
                  text: "saveComment".tr(),
                  fontSize: FontSizeManager.fs16,
                  fontWeight: FontWeight.w600,
                  color: AppColorManager.white,
                ),
              );
            },
          )
        ],
      );
    });
  }
}
