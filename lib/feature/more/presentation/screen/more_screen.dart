import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzad_damascus/app/app.dart';
import 'package:mzad_damascus/core/resource/color_manager.dart';
import 'package:mzad_damascus/core/resource/cubit_status_manager.dart';
import 'package:mzad_damascus/core/storage/shared/shared_pref.dart';
import 'package:mzad_damascus/core/widget/bottom_sheet/login_bottom_sheet.dart';
import 'package:mzad_damascus/core/widget/button/main_app_button.dart';
import 'package:mzad_damascus/core/widget/loading/app_circular_progress_widget.dart';
import 'package:mzad_damascus/core/widget/snack_bar/note_message.dart';
import 'package:mzad_damascus/core/widget/text/app_text_widget.dart';
import 'package:mzad_damascus/core/resource/font_manager.dart';
import 'package:mzad_damascus/core/resource/size_manager.dart';
import 'package:mzad_damascus/feature/authentication/presentation/cubit/logout%20cubit/logout_cubit.dart';
import 'package:mzad_damascus/feature/authentication/presentation/cubit/logout%20cubit/logout_state.dart';
import 'package:mzad_damascus/feature/more/presentation/cubit/convert_business_account_cubit/convert_business_account_cubit.dart';
import 'package:mzad_damascus/feature/more/presentation/cubit/convert_business_account_cubit/convert_business_account_state.dart';
import 'package:mzad_damascus/feature/more/presentation/screen/edit_password_screen.dart';
import 'package:mzad_damascus/feature/more/presentation/screen/edit_username_screen.dart';
import 'package:mzad_damascus/feature/more/presentation/screen/favorites_screen.dart';
import 'package:mzad_damascus/feature/more/presentation/widget/dialog/convet_business_account_dialog.dart';
import 'package:mzad_damascus/router/router.dart';
import '../widget/dialog/language_dialog.dart';
import '../widget/dialog/logout_dialog.dart';
import '../widget/more_list_tile.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

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
              text: 'more'.tr(),
              fontSize: FontSizeManager.fs17,
              color: AppColorManager.textAppColor,
              fontWeight: FontWeight.w700,
            ),
          ],
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: AppWidthManager.w3Point8),
        children: [
          MoreListTile(
            icon: Icons.add,
            label: 'addAdvertisement'.tr(),
            color: AppColorManager.pinkAccent,
            onTap: () {
              if (AppSharedPreferences.getToken().isEmpty) {
                showLoginBottomSheet(context: context);
                return;
              }
              Navigator.of(context)
                  .pushNamed(RouteNamedScreens.advertisementLanguage);
            },
          ),
          const Divider(color: AppColorManager.borderGrey),
          MoreListTile(
            icon: Icons.announcement,
            label: 'myAds'.tr(),
            color: AppColorManager.green,
            onTap: () {
              if (AppSharedPreferences.getToken().isEmpty) {
                showLoginBottomSheet(context: context);
                return;
              }
              Navigator.pushNamed(context, RouteNamedScreens.myitem);
            },
          ),
          // MoreListTile(
          //   icon: Icons.star_border,
          //   label: 'favourite'.tr(),
          //   color: AppColorManager.orange,
          //   onTap: () {
          //     if(AppSharedPreferences.getToken().isEmpty){
          //       showLoginBottomSheet(context: context);
          //       return;
          //     }
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //           builder: (context) => const FavoritesScreen()),
          //     );
          //   },
          //
          // ),
          MoreListTile(
            icon: Icons.password,
            label: 'changePassword'.tr(),
            color: AppColorManager.lightBlue,
            onTap: () {
              if (AppSharedPreferences.getToken().isEmpty) {
                showLoginBottomSheet(context: context);
                return;
              }
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const EditPasswordScreen()),
              );
            },
          ),
          MoreListTile(
            icon: Icons.edit,
            label: 'changeUserName'.tr(),
            color: AppColorManager.darkRed,
            onTap: () {
              if (AppSharedPreferences.getToken().isEmpty) {
                showLoginBottomSheet(context: context);
                return;
              }
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const EditUsernameScreen()),
              );
            },
          ),
          const Divider(color: AppColorManager.borderGrey),
          MoreListTile(
            icon: Icons.insert_drive_file_outlined,
            label: 'aboutUs'.tr(),
            color: AppColorManager.orange,
            onTap: () {
              Navigator.of(context).pushNamed(RouteNamedScreens.aboutUs);

            },
          ),
          MoreListTile(
            icon: Icons.shield_outlined,
            label: 'privacyPolicy'.tr(),
            color: Colors.pink,
            onTap: () {
              Navigator.of(context).pushNamed(RouteNamedScreens.privacyPolicy);

            },
          ),
          const Divider(color: AppColorManager.borderGrey),
          Visibility(
            visible: AppSharedPreferences.getAccountType()=="0",
            child: MoreListTile(
              icon: Icons.wallet_travel,
              label: 'convertToBusinessAccount'.tr(),
              color: AppColorManager.purple,
              onTap: () {
                if (AppSharedPreferences.getToken().isEmpty) {
                  showLoginBottomSheet(context: context);
                  return;
                }
                showBusinessAccountDialog(
                  context: context,
                  onSuccess: () {},
                );
              },
            ),
          ),
          MoreListTile(
            icon: Icons.card_giftcard,
            label: 'language'.tr(),
            color: Colors.deepPurpleAccent,
            onTap: () {
              showLanguageDialog(context: context);
            },
          ),
          const Divider(color: AppColorManager.borderGrey),
          Visibility(
            visible: AppSharedPreferences.getToken().isNotEmpty,
            child:  Padding(
                  padding: EdgeInsets.symmetric(vertical: AppHeightManager.h2),
                  child: MainAppButton(
                    height: AppHeightManager.h6,
                    alignment: Alignment.center,
                    onTap: () {
                      showLogoutDialog(context: context);
                    },
                   color: AppColorManager.mainColor,
                    child: AppTextWidget(
                      text: "logout".tr(),
                      color: AppColorManager.white,
                      fontWeight: FontWeight.w600,
                      fontSize: FontSizeManager.fs16,
                      maxLines: 2,
                    ),
                  ),

            ),
          ),
        ],
      ),
    );
  }
}
