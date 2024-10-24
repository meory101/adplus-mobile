import 'package:flutter/material.dart';
import 'package:mzad_damascus/core/resource/color_manager.dart';
import 'package:mzad_damascus/feature/profile/presentation/screen/profile_screen.dart';

class MoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'More',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          _buildListTile(
            icon: Icons.add,
            label: 'Add Ads',
            color: Colors.pinkAccent,
            onTap: () {},
          ),
          Divider(),
          _buildListTile(
            icon: Icons.announcement,
            label: 'My Ads',
            color: Colors.green,
            onTap: () {},
          ),
          _buildListTile(
            icon: Icons.star_border,
            label: 'Favourite',
            color: Colors.orange,
            onTap: () {},
          ),
          _buildListTile(
            icon: Icons.block,
            label: 'blocked',
            color: Colors.red,
            onTap: () {},
          ),
          _buildListTile(
            icon: Icons.chat_bubble_outline,
            label: 'chat',
            color: Colors.lightBlue,
            onTap: () {},
          ),
          _buildListTile(
            icon: Icons.person,
            label: 'Profile',
            color: Colors.lightBlue,
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
