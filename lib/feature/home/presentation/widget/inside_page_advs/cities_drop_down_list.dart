import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mzad_damascus/feature/home/domain/entity/request/advs_by_attribute_request_entity.dart';

import '../../../../../core/helper/language_helper.dart';
import '../../../../../core/resource/color_manager.dart';
import '../../../../../core/resource/cubit_status_manager.dart';
import '../../../../../core/resource/size_manager.dart';
import '../../../../../core/widget/container/shimmer_container.dart';
import '../../../../../core/widget/drop_down/NameAndId.dart';
import '../../../../../core/widget/snack_bar/note_message.dart';
import '../../../../advertisement/domain/entity/response/get_cities_response_entity.dart';
import '../../../../advertisement/presentation/cubit/get_cities_cubit/get_category_attributes_cubit.dart';
import '../../../../advertisement/presentation/cubit/get_cities_cubit/get_category_attributes_state.dart';
import '../../cubit/advs_by_attribute_cubit/advs_by_attribute_cubit.dart';
import '../../screen/category_inside_page_screen.dart';
import '../../screen/inside_page_category_advs_screen.dart';

class CitiesDropDownList extends StatelessWidget {
  const CitiesDropDownList({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<GetCitiesCubit, GetCitiesState>(
      listener: (context, state) {
        if (state.status == CubitStatus.error) {
          NoteMessage.showErrorSnackBar(
              context: context, text: state.error);
        }
      },
      builder: (context, state) {
        if (state.status == CubitStatus.loading) {
          return ShimmerContainer(
              width: AppWidthManager.w45,
              height: AppHeightManager.h6);
        }
        List<NameAndId> citiesOptions = [];
        List<City> cities = state.entity.data ?? [];
        String? hint;
        for (var city in cities) {
          if(city.cityId==FilterRequest.entity.cityId){
            hint = LanguageHelper.checkIfLTR(
                context: context)
                ? city.enName ?? ""
                : city.arName ?? "";
          }
          citiesOptions.add(NameAndId(
            name: LanguageHelper.checkIfLTR(
                context: context)
                ? city.enName ?? ""
                : city.arName ?? "",
            id: city.cityId.toString(),
          ));
        }
        return SizedBox(
          height: AppHeightManager.h7,
          width: AppWidthManager.w45,

          child: MainDropdownWidget(

            hintFontColor: AppColorManager.black,
            onChanged: (selectedCity) {
              print('ddddddddddddddddddddddddddddddddd');
              FilterRequest.entity.cityId =
                  num.parse(selectedCity?.id ?? "0");
              context
                  .read<AdvsByAttributeCubit>()
                  .resetData();
              context
                  .read<AdvsByAttributeCubit>()
                  .getAdvsByAttribute(
                  context: context,
                  entity: FilterRequest.entity);
            },
            hint:hint==null? 'city'.tr() : hint??"", // Localized text
            options: citiesOptions,
          ),
        );
      },
    );
  }
}
