import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ابحث في إعلاناتك'),
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'ابحث...',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildFilterButton('النشطة'),
                  _buildFilterButton('المفضلة'),
                  _buildFilterButton('التعليقات'),
                  _buildFilterButton('الإعجابات'),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10, // عدد العناصر في القائمة
              itemBuilder: (context, index) {
                return _buildAdCard();
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'إعلاناتي',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'إعلان جديد',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'الرئيسية',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.deepPurple,
        onTap: (index) {
          // هنا يمكنك إضافة منطق التنقل
        },
      ),
    );
  }

  Widget _buildFilterButton(String title) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      child: ElevatedButton(
        onPressed: () {},
        child: Text(title),
      ),
    );
  }

  Widget _buildAdCard() {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
           
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'غلاﻻ 11',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text('200 ر.س'),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('0 مشاهدة'),
                      Row(
                        children: [
                          Icon(Icons.thumb_up, size: 16),
                          SizedBox(width: 4),
                          Text('0'),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.comment, size: 16),
                          SizedBox(width: 4),
                          Text('0'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}