import 'package:flutter/material.dart';
import 'package:mzad_damascus/core/resource/color_manager.dart';
import 'package:mzad_damascus/core/widget/text/app_text_widget.dart';
import 'package:mzad_damascus/feature/more/presentation/screen/widget/CustomListTile.dart';
import 'package:mzad_damascus/core/resource/font_manager.dart';
import 'package:mzad_damascus/core/resource/size_manager.dart';
import 'package:mzad_damascus/core/widget/text/app_text_widget.dart';
import 'package:mzad_damascus/feature/profile/presentation/screen/profile_screen.dart';

class MoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        surfaceTintColor: AppColorManager.background,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppTextWidget(
            text: 'More',
                fontSize: FontSizeManager.fs17,
                color: AppColorManager.textAppColor,
                fontWeight: FontWeight.w700),
          ],
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
        padding: EdgeInsets.symmetric(horizontal: AppWidthManager.w3Point8),
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
          _buildListTile(
            icon: Icons.wallet_travel,
            label: 'رصيد المزائدة',
            color: Colors.purple,
            onTap: () {},
          ),
          _buildListTile(
            icon: Icons.card_giftcard,
            label: 'باقات الإعلانات المدفوعة',
            color: Colors.deepPurpleAccent,
            onTap: () {},
          ),
          _buildListTile(
            icon: Icons.show_chart,
            label: 'الإعلانات المميزة',
            color: Colors.amber,
            onTap: () {},
          ),
          _buildListTile(
            icon: Icons.account_balance,
            label: 'تفاصيل الحساب البنكي',
            color: Colors.green,
            onTap: () {},
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Text(
          'Help',
          style: TextStyle(color: AppColorManager.textAppColor),
        ),
        icon: Icon(
          Icons.help_outline,
          color: AppColorManager.background,
        ),
        backgroundColor: AppColorManager.mainColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }

  Widget _buildListTile({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: CircleAvatar(
        radius: 20,
        backgroundColor: color.withOpacity(0.1),
        child: Icon(icon, color: color),
      ),
      title: Text(label, style: TextStyle(fontSize: 16)),
      onTap: onTap,
    );
  }
}
