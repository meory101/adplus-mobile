import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/widget/app_bar/main_app_bar.dart';
import '../../../../core/widget/text/app_text_widget.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MainAppBar(title: ""),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: AppTextWidget(
            text: '''        مزاد دمشق الإلكتروني هو سوق إلكتروني مفتوح للبائع و المشتري و أصحاب الخدمات.
يتيح للمستخدم تقديم خدماته أو الحصول على أي خدمة، و بشكلٍ مجاني 
تقديم خدمة التسويق الإلكتروني، بيع و شراء العقارات بأنواعها،. و السيارات، و الأثاث المنزلي، و الأراضي و الأشياء المستعملة، و الإلكترونيات و مستلزمات الرجال و النساء و الأطفال و الخدمات، و عرض فرص العمل من خلال تطبيق مزاد دمشق الإلكتروني.
لا يتقاضى المزاد أي عمولة على عمليات البيع و الشراء و الخدمات و هو مجاني بالكامل، و لا يجمع أي بيانات تتعلق بالمستخدمين. 
      
       
        ''',
            maxLines: 1000,
            textAlign: TextAlign.right,
          ),
        ));
  }
}
