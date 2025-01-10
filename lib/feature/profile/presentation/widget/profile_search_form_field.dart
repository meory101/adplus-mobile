import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzad_damascus/feature/home/presentation/screen/search_screen.dart';
import 'package:mzad_damascus/router/router.dart';
import '../../../../../core/resource/color_manager.dart';
import '../../../../../core/resource/cubit_status_manager.dart';
import '../../../../../core/resource/size_manager.dart';
import '../../../../../core/widget/container/shimmer_container.dart';
import '../../../../../core/widget/form_field/app_form_field.dart';
import '../../../../../core/widget/snack_bar/note_message.dart';
import '../../../home/presentation/cubit/search_user/search_user_cubit.dart';

class MainSearchFormField extends StatefulWidget {
  const MainSearchFormField({super.key});

  @override
  State<MainSearchFormField> createState() => _SearchFormFieldState();
}

class _SearchFormFieldState extends State<MainSearchFormField> {
  String? searchText ;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchUserCubit, SearchUserState>(
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
            borderColor: AppColorManager.mainColor,

            onChanged: (value) {
              searchText = value;
              return null;
            },
            hintText: "search".tr(),
            suffixIcon: IconButton(
              icon: const Icon(
                Icons.search,
                color: AppColorManager.mainColor,
              ),
              onPressed: () {
                if ((searchText ?? "").isEmpty) return;
                Navigator.of(context).pushNamed(RouteNamedScreens.search,
                arguments: SearchArgs(searchString:searchText )
                );
              },
            ),
          ),
        );
      },
    );
  }
}
