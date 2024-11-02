import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzad_damascus/core/resource/color_manager.dart';
import 'package:mzad_damascus/core/resource/cubit_status_manager.dart';
import 'package:mzad_damascus/core/widget/loading/app_circular_progress_widget.dart';
import 'package:mzad_damascus/core/widget/snack_bar/note_message.dart';
import 'package:mzad_damascus/core/widget/text/app_text_widget.dart';
import 'package:mzad_damascus/core/resource/font_manager.dart';
import 'package:mzad_damascus/core/resource/size_manager.dart';
import 'package:mzad_damascus/feature/authentication/presentation/cubit/logout%20cubit/logout_cubit.dart';
import 'package:mzad_damascus/feature/authentication/presentation/cubit/logout%20cubit/logout_state.dart';
import 'package:mzad_damascus/feature/profile/presentation/screen/profile_screen.dart';
import 'package:mzad_damascus/router/router.dart';

import '../widget/more_list_tile.dart';

class MoreScreen extends StatelessWidget {
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
              text: 'More',
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
            label: 'Add Ads',
            color: AppColorManager.pinkAccent,
            onTap: () {},
          ),
          const Divider(color: AppColorManager.borderGrey),
          MoreListTile(
            icon: Icons.announcement,
            label: 'My Ads',
            color: AppColorManager.green,
            onTap: () {},
          ),
          MoreListTile(
            icon: Icons.star_border,
            label: 'Favourite',
            color: AppColorManager.orange,
            onTap: () {},
          ),
          MoreListTile(
            icon: Icons.block,
            label: 'Blocked',
            color: AppColorManager.red,
            onTap: () {},
          ),
          MoreListTile(
            icon: Icons.chat_bubble_outline,
            label: 'Chat',
            color: AppColorManager.lightBlue,
            onTap: () {},
          ),
          MoreListTile(
            icon: Icons.person,
            label: 'Profile',
            color: AppColorManager.lightBlue,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
            },
          ),
          const Divider(color: AppColorManager.borderGrey),
          MoreListTile(
            icon: Icons.wallet_travel,
            label: 'تحويل الى حساب اعمال',
            color: AppColorManager.purple,
            onTap: () {},
          ),
          MoreListTile(
            icon: Icons.card_giftcard,
            label: 'باقات الإعلانات المدفوعة',
            color: Colors.deepPurpleAccent,
            onTap: () {},
          ),
          MoreListTile(
            icon: Icons.show_chart,
            label: 'الإعلانات المميزة',
            color: Colors.amber,
            onTap: () {},
          ),
          MoreListTile(
            icon: Icons.account_balance,
            label: 'تفاصيل الحساب البنكي',
            color: Colors.green,
            onTap: () {},
          ),
          const Divider(color: AppColorManager.borderGrey),
          BlocConsumer<LogoutCubit, LogoutState>(
            listener: (context, state) {
              if (state.status == CubitStatus.error) {
                NoteMessage.showErrorSnackBar(context: context, text: state.error);
              }
              if (state.status == CubitStatus.success) {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  RouteNamedScreens.login,
                  (route) => false,
                );
              }
            },
            builder: (context, state) {
              if (state.status == CubitStatus.loading) {
                return AppCircularProgressWidget();
              }
              return Padding(
                padding: EdgeInsets.symmetric(vertical: AppHeightManager.h2),
                child: ElevatedButton(
                  onPressed: () {
                    context.read<LogoutCubit>().logout(context: context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColorManager.red,  
                    padding:
                        EdgeInsets.symmetric(vertical: AppHeightManager.h2),
                  ),
                  child: AppTextWidget(
                    text: 'تسجيل الخروج',
                    color: AppColorManager.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
