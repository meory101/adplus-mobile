import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzad_damascus/core/resource/color_manager.dart';
import 'package:mzad_damascus/core/resource/constant_manager.dart';
import 'package:mzad_damascus/core/resource/cubit_status_manager.dart';
import 'package:mzad_damascus/core/widget/image/main_image_widget.dart';
import 'package:mzad_damascus/core/widget/loading/app_circular_progress_widget.dart';
import 'package:mzad_damascus/core/widget/snack_bar/note_message.dart';
import 'package:mzad_damascus/feature/home/presentation/cubit/company_accounts_cubit/get_company_accounts_cubit.dart';
import 'package:mzad_damascus/feature/home/presentation/screen/auhter_profile_screen.dart';
import 'package:mzad_damascus/router/router.dart';

import '../../../../../core/helper/language_helper.dart';
import '../../../../../core/model/user.dart';
import '../../../../../core/resource/font_manager.dart';
import '../../../../../core/resource/size_manager.dart';
import '../../../../../core/widget/container/decorated_container.dart';
import '../../../../../core/widget/text/app_text_widget.dart';

class CompaniesAccountsListView extends StatelessWidget {
  const CompaniesAccountsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetCompanyAccountsCubit, GetCompanyAccountState>(
      listener: (context, state) {
        if (state.status == CubitStatus.error) {
          NoteMessage.showErrorSnackBar(context: context, text: state.error);
        }
      },
      builder: (context, state) {
        if (state.status == CubitStatus.loading) {
          return const AppCircularProgressWidget();
        }
        List<User> companies = state.entity.data ?? [];
        if (companies.length == 0) {
          return SizedBox();
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTextWidget(
              text: "companies",
              fontSize: FontSizeManager.fs17,
              fontWeight: FontWeight.w700,
            ),
            SizedBox(
              height: AppHeightManager.h1point8,
            ),
            DynamicHeightGridView(
              itemCount: companies.length,
              crossAxisCount: 2,
              shrinkWrap: true,
              crossAxisSpacing: AppWidthManager.w3Point8,
              physics: const NeverScrollableScrollPhysics(),
              builder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                        RouteNamedScreens.authorProfile,
                        arguments: AuthorProfileArgs(
                            userName: companies[index].username));
                  },
                  child: DecoratedContainer(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(AppWidthManager.w3Point8),
                      child: Column(
                        children: [
                          Container(
                            width: AppWidthManager.w20,
                            height: AppWidthManager.w20,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle
                            ),
                            child: MainImageWidget(
                              imageUrl: AppConstantManager.imageBaseUrl + (companies[index].photo ?? ""),
                            ),
                          ),
                          SizedBox(height: AppHeightManager.h1point8,),
                          AppTextWidget(text: companies[index].name ?? ""),
                          AppTextWidget(
                              text: companies[index].description ?? "--"),
                        ],
                      )),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
