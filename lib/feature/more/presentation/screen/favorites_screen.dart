import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzad_damascus/core/widget/app_bar/main_app_bar.dart';
import 'package:mzad_damascus/feature/profile/presentation/widget/favorite_list_view.dart';
import '../../../../core/injection/injection_container.dart' as di;
class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: "favourite".tr()),
      body: const FavoriteListView(),
    );
  }
}
