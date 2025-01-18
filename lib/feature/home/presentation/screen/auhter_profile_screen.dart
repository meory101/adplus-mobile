import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzad_damascus/core/widget/app_bar/main_app_bar.dart';
import 'package:mzad_damascus/core/widget/loading/app_circular_progress_widget.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/advs_by_attribute_response_entity.dart';
import 'package:mzad_damascus/feature/home/presentation/widget/auhtor_profile/author_profile_info_card.dart';
import '../../../../core/resource/color_manager.dart';
import '../../../../core/resource/constant_manager.dart';
import '../../../../core/resource/cubit_status_manager.dart';
import '../../../../core/resource/font_manager.dart';
import '../../../../core/resource/size_manager.dart';
import '../../../../core/widget/image/main_image_widget.dart';
import '../../../../core/widget/loading/shimmer/advs_by_attribute_shimmer.dart';
import '../../../../core/widget/snack_bar/note_message.dart';
import '../../../../core/widget/text/app_text_widget.dart';
import '../../../../router/router.dart';
import '../../domain/entity/request/get_advs_by_user_request_entity.dart';
import '../cubit/get_advs_by_user_cubit/get_adv_by_user_cubit.dart';
import 'advertisement_details_screen.dart';

class AuthorProfileScreen extends StatefulWidget {
  final AuthorProfileArgs arg;

  const AuthorProfileScreen({super.key, required this.arg});

  @override
  State<AuthorProfileScreen> createState() => _AuthorProfileScreenState();
}

class _AuthorProfileScreenState extends State<AuthorProfileScreen> {
  AdData? advertisement;
  ScrollController scrollController = ScrollController();
  GetAdvsByUserRequestEntity adByUserEntity = GetAdvsByUserRequestEntity();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    initScroll();
    super.initState();
  }

  initScroll() {
    scrollController.addListener(
      () {
        if (scrollController.position.pixels >=
            (scrollController.position.maxScrollExtent)) {
          context
              .read<GetAdvByUserCubit>()
              .getAdvsByUser(context: context, entity: adByUserEntity);
        }
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(
        title: "",
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.zero,
        controller: scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          AuthorProfileInfoCard(
            userName: widget.arg.userName??"",
            onAdByUserEntityChanged: (entity) {
            adByUserEntity = entity;
          },),
            SizedBox(
              height: AppHeightManager.h1point8,
            ),
            BlocConsumer<GetAdvByUserCubit, GetAdvByUserState>(
              listener: (context, state) {
                if (state.status == CubitStatus.error) {
                  NoteMessage.showErrorSnackBar(
                      context: context, text: state.error);
                }
              },
              builder: (context, state) {
                if (state.status == CubitStatus.loading) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppWidthManager.w3Point8),
                    child: const AdvsByAttributeShimmer(),
                  );
                }
                List<AdData>? advs = state.entity.data?.data ?? [];
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppWidthManager.w2),
                  child: Column(
                    children: [
                      DynamicHeightGridView(
                        crossAxisSpacing: AppWidthManager.w2,
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: advs.length,
                        builder: (context, index) {
                          advertisement = advs[index];
                          return InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                  RouteNamedScreens.advertisementDetails,
                                  arguments: AdvertisementDetailsArgs(
                                      advertisement: advs[index]));
                            },
                            child: Column(
                              children: [
                                Container(
                                    height: AppHeightManager.h30,
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    decoration: BoxDecoration(
                                      color: AppColorManager.lightGreyOpacity6,
                                      borderRadius: BorderRadius.circular(
                                          AppRadiusManager.r15),
                                    ),
                                    child: MainImageWidget(
                                      imageUrl: AppConstantManager.imageBaseUrl +((advertisement?.photos??[]).isNotEmpty?
                                      (advertisement?.photos?.first.photo ?? "") : ""),
                                      borderRadius: BorderRadius.circular(
                                          AppRadiusManager.r15),
                                    )),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: AppHeightManager.h08,
                                    ),
                                    AppTextWidget(
                                      text:
                                          advertisement?.name.toString() ?? "",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      fontSize: FontSizeManager.fs15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    AppTextWidget(
                                      text: advertisement?.startingPrice
                                              .toString() ??
                                          "",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      fontSize: FontSizeManager.fs14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    SizedBox(
                                      height: AppHeightManager.h1point8,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                      ),
                      Visibility(
                          visible: state.isReachedMax == false &&
                              state.status != CubitStatus.error,
                          child: const AppCircularProgressWidget())
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class AuthorProfileArgs {
  final String? userName;

  AuthorProfileArgs({required this.userName});
}
