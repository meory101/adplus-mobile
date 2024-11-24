import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mzad_damascus/app/app.dart';
import 'package:mzad_damascus/core/resource/image_manager.dart';
import 'package:mzad_damascus/core/resource/size_manager.dart';
import 'package:mzad_damascus/core/widget/text/app_text_widget.dart';

class BiddingScreen extends StatefulWidget {
  const BiddingScreen({super.key});

  @override
  State<BiddingScreen> createState() => _BiddingScreenState();
}

class _BiddingScreenState extends State<BiddingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(

          alignment: Alignment.center,
            height: AppHeightManager.h50,
            width: AppHeightManager.h50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage(
                      AppImageManager.comingSoon,
                    ),
                    fit: BoxFit.cover)),
          ),
        ],
      ),
    );
  }
}
