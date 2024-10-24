import 'package:flutter/material.dart';
import 'package:mzad_damascus/core/resource/color_manager.dart';
import 'package:mzad_damascus/core/widget/text/app_text_widget.dart';
import 'package:mzad_damascus/feature/more/presentation/screen/widget/CustomListTile.dart';
import 'package:mzad_damascus/feature/profile/presentation/screen/profile_screen.dart';

class MoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppTextWidget(
          text: 'More',
          fontSize: 14,
          color: AppColorManager.textAppColor,
        ),
        backgroundColor: AppColorManager.background,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          CustomListTile(
            icon: Icons.add,
            label: 'Add Ads',
            color: AppColorManager.pinkAccent,
            onTap: () {},
          ),
          Divider(),
          CustomListTile(
            icon: Icons.announcement,
            label: 'My Ads',
            color: AppColorManager.green,
            onTap: () {},
          ),
          CustomListTile(
            icon: Icons.star_border,
            label: 'Favourite',
            color: AppColorManager.orange,
            onTap: () {},
          ),
          CustomListTile(
            icon: Icons.block,
            label: 'blocked',
            color: AppColorManager.red,
            onTap: () {},
          ),
          CustomListTile(
            icon: Icons.chat_bubble_outline,
            label: 'chat',
            color: AppColorManager.lightBlue,
            onTap: () {},
          ),
          CustomListTile(
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
          Divider(),
          CustomListTile(
            icon: Icons.wallet_travel,
            label: 'رصيد المزائدة',
            color: AppColorManager.purple,
            onTap: () {},
          ),
          CustomListTile(
            icon: Icons.card_giftcard,
            label: 'باقات الإعلانات المدفوعة',
            color: AppColorManager.deepPurpleAccent,
            onTap: () {},
          ),
          CustomListTile(
            icon: Icons.show_chart,
            label: 'الإعلانات المميزة',
            color: AppColorManager.amber,
            onTap: () {},
          ),
          CustomListTile(
            icon: Icons.account_balance,
            label: 'تفاصيل الحساب البنكي',
            color: AppColorManager.green,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
