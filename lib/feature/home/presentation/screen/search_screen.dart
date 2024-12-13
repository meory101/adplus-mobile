import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzad_damascus/core/resource/size_manager.dart';
import 'package:mzad_damascus/core/widget/app_bar/main_app_bar.dart';
import 'package:mzad_damascus/feature/home/domain/entity/request/item_search_request_entity.dart';
import 'package:mzad_damascus/feature/home/domain/entity/request/search_user_request_entity.dart';
import 'package:mzad_damascus/feature/home/presentation/widget/search/search_form_field.dart';
import 'package:mzad_damascus/feature/home/presentation/widget/search/search_item_result_grid_view.dart';
import 'package:mzad_damascus/feature/home/presentation/widget/search/search_tab_bar.dart';
import 'package:mzad_damascus/feature/home/presentation/widget/search/search_user_result_list_view.dart';

import '../cubit/item_search/item_search_cubit.dart';

class SearchScreen extends StatefulWidget {
  final SearchArgs? args;

  const SearchScreen({super.key, this.args});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  int selectedTabIndex = 0;
  final ScrollController scrollController = ScrollController();
  @override
  void initState() {
    scrollController.addListener(onScroll);
    super.initState();
  }
  void onScroll() {
    if (scrollController.position.pixels >=
        scrollController.position.maxScrollExtent) {
      context.read<ItemSearchCubit>().searchItems(
          context: context,
          entity: SearchUserAndItemRequestEntity.itemSearchEntity
      );
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return
      PopScope(
        onPopInvokedWithResult: (didPop, result) {
          SearchUserAndItemRequestEntity.itemSearchEntity = ItemSearchRequestEntity();
          SearchUserAndItemRequestEntity.userSearchEntity = SearchUserRequestEntity();
        },
        child: Scaffold(
        appBar: const MainAppBar(title: ""),
        body: SingleChildScrollView(
          controller: scrollController,
          child: Stack(
            children: [
              SearchFormField(
                initValue: widget.args?.searchString,
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: AppHeightManager.h6,
                    left: AppWidthManager.w3Point8,
                    right: AppWidthManager.w3Point8),
                child: SearchTabBar(
                  onTapChanged: (value) {
                    setState(() {
                      selectedTabIndex = value;
                    });
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: AppHeightManager.h17,
                    left: AppWidthManager.w3Point8,
                    right: AppWidthManager.w3Point8),
                child: Visibility(
                  visible: selectedTabIndex == 0,
                  child: SearchItemResultGridView(),
                  replacement: SearchUserResultListView(),
                ),
              )
            ],
          ),
        ),
            ),
      );
  }
}

class SearchArgs {
  final String? searchString;

  SearchArgs({required this.searchString});
}
