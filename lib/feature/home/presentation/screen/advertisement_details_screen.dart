import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mzad_damascus/feature/home/domain/entity/response/advs_by_attribute_response_entity.dart';

class AdvertisementDetailsScreen extends StatefulWidget {
  final AdvertisementDetailsArgs args;
  const AdvertisementDetailsScreen({super.key,required this.args});

  @override
  State<AdvertisementDetailsScreen> createState() => _AdvertisementDetailsScreenState();
}

class _AdvertisementDetailsScreenState extends State<AdvertisementDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}


class AdvertisementDetailsArgs{
  AdData? advertisement;
  AdvertisementDetailsArgs({required this.advertisement});
}
