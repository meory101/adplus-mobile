import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzad_damascus/core/model/comment.dart';
import 'package:mzad_damascus/core/storage/shared/shared_pref.dart';
import 'package:mzad_damascus/core/widget/loading/app_circular_progress_widget.dart';
import 'package:mzad_damascus/feature/home/domain/entity/request/add_comment_request_entity.dart';
import 'package:mzad_damascus/feature/home/presentation/cubit/add_comment_cubit/add_comment_cubit.dart';

import '../../../../../core/resource/color_manager.dart';
import '../../../../../core/resource/constant_manager.dart';
import '../../../../../core/resource/cubit_status_manager.dart';
import '../../../../../core/resource/font_manager.dart';
import '../../../../../core/resource/size_manager.dart';
import '../../../../../core/widget/button/main_app_button.dart';
import '../../../../../core/widget/form_field/title_app_form_filed.dart';
import '../../../../../core/widget/image/main_image_widget.dart';
import '../../../../../core/widget/snack_bar/note_message.dart';
import '../../../../../core/widget/text/app_text_widget.dart';

class CommentsSection extends StatefulWidget {
  final List<Comment>? comments;
  final num? itemId;

  const CommentsSection({super.key, required this.comments,required this.itemId});

  @override
  State<CommentsSection> createState() => _CommentsSectionState();
}


AddCommentRequestEntity entity = AddCommentRequestEntity();

class _CommentsSectionState extends State<CommentsSection> {
  @override
  void initState() {
    entity.itemId = widget.itemId;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextWidget(
            fontWeight: FontWeight.w700,
            fontSize: FontSizeManager.fs15,
            text: "comments"),
        SizedBox(
          height: AppHeightManager.h1point5,
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: widget.comments?.length ?? 0,
          itemBuilder: (context, index) {
            return Row(
              children: [
                Container(
                  height: AppWidthManager.w15,
                  width: AppWidthManager.w15,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: MainImageWidget(
                    imageUrl: AppConstantManager.imageBaseUrl +
                        (widget.comments?[index].client?.photo ?? ""),
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
                        fontWeight: FontWeight.w600,
                        fontSize: FontSizeManager.fs15,
                        text: widget.comments?[index].client?.name ?? ""),
                    AppTextWidget(
                        maxLines: 2,
                        fontWeight: FontWeight.w600,
                        fontSize: FontSizeManager.fs15,
                        text: widget.comments?[index].comment ?? ""),
                  ],
                )
              ],
            );
          },
        ),
        SizedBox(
          height: AppHeightManager.h4,
        ),
        TitleAppFormFiled(
          hint: "your comment",
          title: "your comment",
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
              NoteMessage.showErrorSnackBar(context: context, text: "");
            }
          },
          builder: (context, state) {
            if (state.status == CubitStatus.loading) {
              return const AppCircularProgressWidget();
            }
            return MainAppButton(
              onTap: () {
                if((entity.comment??"").isEmpty){
                  return;
                }
                print(AppSharedPreferences.getToken());
                print('00000000000000');
                context.read<AddCommentCubit>().addComment(context: context, entity: entity);
              },
              borderRadius: BorderRadius.circular(AppRadiusManager.r10),
              height: AppHeightManager.h6,
              color: AppColorManager.mainColor,
              alignment: Alignment.center,
              child: AppTextWidget(
                text: "save comment",
                fontSize: FontSizeManager.fs15,
                fontWeight: FontWeight.w500,
                color: AppColorManager.white,
              ),
            );
          },
        )
      ],
    );
  }
}
