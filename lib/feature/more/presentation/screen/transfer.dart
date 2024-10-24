// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:mzad_damascus/core/resource/color_manager.dart';
// import 'package:mzad_damascus/core/widget/text/app_text_widget.dart';
//
// class BusinessAccountScreen extends StatefulWidget {
//   @override
//   _BusinessAccountScreenState createState() => _BusinessAccountScreenState();
// }
//
// class _BusinessAccountScreenState extends State<BusinessAccountScreen> {
//   String? fileName;
//
//   Future<void> pickFile() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//       type: FileType.custom,
//       allowedExtensions: ['pdf', 'jpg', 'png'],
//     );
//
//     if (result != null) {
//       setState(() {
//         fileName = result.files.single.name;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: AppTextWidget(
//           text: 'رفع السجل التجاري',
//           fontSize: 14,
//           color: AppColorManager.textAppColor,
//         ),
//         backgroundColor: AppColorManager.background,
//         elevation: 0,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             AppTextWidget(
//               text: 'يرجى رفع صورة السجل التجاري بصيغة PDF أو صورة',
//               fontSize: 16,
//               color: AppColorManager.textAppColor,
//             ),
//             SizedBox(height: 20),
//             Center(
//               child: ElevatedButton.icon(
//                 onPressed: pickFile,
//                 icon: Icon(Icons.upload_file),
//                 label: AppTextWidget(
//                   text: 'اختر ملف',
//                   fontSize: 16,
//                   color: AppColorManager.textAppColor,
//                 ),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: AppColorManager.mainColor,
//                   // textStyle: AppColorManager.textAppColor
//                 ),
//               ),
//             ),
//             if (fileName != null)
//               Padding(
//                 padding: const EdgeInsets.only(top: 16.0),
//                 child: AppTextWidget(
//                   text: 'الملف الذي تم تحميله: $fileName',
//                   fontSize: 14,
//                   color: AppColorManager.textAppColor,
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
