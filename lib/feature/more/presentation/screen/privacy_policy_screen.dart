import 'package:flutter/material.dart';
import 'package:mzad_damascus/core/widget/app_bar/main_app_bar.dart';
import 'package:mzad_damascus/core/widget/text/app_text_widget.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: MainAppBar(title: ""), body: Padding(
      padding: const EdgeInsets.symmetric(horizontal:  8.0),
      child: AppTextWidget(text: '''سياسة الخصوصية

1. المعلومات التي نجمعها
نقوم بجمع المعلومات التالية:

المعلومات الشخصية: مثل الاسم، البريد الإلكتروني، ورقم الهاتف، عند التسجيل أو استخدام التطبيق.
المعلومات غير الشخصية: مثل بيانات الاستخدام، تفضيلات الإعلانات، وبيانات الجهاز.
2. كيفية استخدام المعلومات
نستخدم المعلومات التي نجمعها للأغراض التالية:

تحسين تجربة المستخدم.
تقديم إعلانات مخصصة تتناسب مع اهتماماتك.
التواصل معك بشأن التحديثات والعروض الخاصة.
3. مشاركة المعلومات
قد نشارك معلوماتك مع:

شركاء الإعلان: لتحسين جودة الإعلانات المقدمة لك.
مقدمي الخدمات: الذين يساعدوننا في تشغيل التطبيق وتقديم الخدمات.
4. حماية المعلومات
نحن نتخذ تدابير أمنية مناسبة لحماية معلوماتك من الوصول غير المصرح به أو الاستخدام أو التعديل.


      ''',maxLines: 1000,

      textAlign: TextAlign.right,
      ),
    ));
  }
}
