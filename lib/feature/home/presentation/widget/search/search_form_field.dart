import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzad_damascus/feature/home/domain/entity/request/item_search_request_entity.dart';
import 'package:mzad_damascus/feature/home/presentation/cubit/item_search/item_search_cubit.dart';
import 'package:mzad_damascus/feature/main/presentation/screen/main_bottom_app_bar.dart';

import '../../../../../core/resource/color_manager.dart';
import '../../../../../core/resource/cubit_status_manager.dart';
import '../../../../../core/resource/size_manager.dart';
import '../../../../../core/widget/container/shimmer_container.dart';
import '../../../../../core/widget/form_field/app_form_field.dart';
import '../../../../../core/widget/snack_bar/note_message.dart';
import '../../../domain/entity/request/search_user_request_entity.dart';
import '../../cubit/search_user/search_user_cubit.dart';

class SearchFormField extends StatefulWidget {
  final String? initValue;


  const SearchFormField({super.key, this.initValue});

  @override
  State<SearchFormField> createState() => _SearchFormFieldState();
}

class _SearchFormFieldState extends State<SearchFormField> {


  @override
  void initState() {
    if (widget.initValue != null) {
      SearchUserAndItemRequestEntity.userSearchEntity.searchText = widget.initValue;
      SearchUserAndItemRequestEntity.itemSearchEntity.searchText = widget.initValue;
    searchUsersAndItems();

    }
    super.initState();
  }

  searchUsersAndItems(){
    context
        .read<SearchUserCubit>()
        .searchUser(context: context, entity: SearchUserAndItemRequestEntity.userSearchEntity);

    context
        .read<ItemSearchCubit>()
        .resetData();
    context
        .read<ItemSearchCubit>().searchItems(context: context, entity: SearchUserAndItemRequestEntity.itemSearchEntity);
  }

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
              SearchUserAndItemRequestEntity.userSearchEntity.searchText = value;
              SearchUserAndItemRequestEntity.itemSearchEntity.searchText = value;
              return null;
            },
            hintText: "search".tr(),
            initialValue: SearchUserAndItemRequestEntity.userSearchEntity.searchText,
            suffixIcon: IconButton(
              icon: const Icon(
                Icons.search,
                color: AppColorManager.mainColor,
              ),
              onPressed: () {
                if ((SearchUserAndItemRequestEntity.userSearchEntity
                    .searchText ?? "").isEmpty) {
                  return;
                }
                searchUsersAndItems();
              }
            ),
          ),
        );
      },
    );
  }
}
abstract class SearchUserAndItemRequestEntity{
 static SearchUserRequestEntity userSearchEntity=SearchUserRequestEntity();
 static ItemSearchRequestEntity itemSearchEntity = ItemSearchRequestEntity();
}