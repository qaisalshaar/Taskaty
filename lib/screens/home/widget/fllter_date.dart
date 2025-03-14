import 'package:flutter/material.dart';
import 'package:taskatykais/core/utilities/app_text.dart';
import 'package:taskatykais/core/utilities/app_textstyle.dart';

import '../../../core/utilities/app_color.dart';

class FilterDays extends StatelessWidget {
  const FilterDays({super.key});

  @override
  Widget build(BuildContext context) {
    return

      Row(
        children: [
          Expanded(child: DaysContainer(isSelected: true)),
          Expanded(child: DaysContainer()),
          Expanded(child: DaysContainer()),
          Expanded(child: DaysContainer()),
        ],
      );
  }
}

class DaysContainer extends StatelessWidget {
  final bool isSelected;

  const DaysContainer({super.key, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      // width: 50,
      // height: 70,
      decoration: BoxDecoration(
        color: isSelected ? AppColor.mainColor : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(
            'Oct',
            style: AppTextStyle.fontStyle10white.copyWith(
              color: isSelected ? Colors.white : Colors.black,fontSize: 18,

            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            '30',
            style: AppTextStyle.fontStyle10white.copyWith(
              color: isSelected ? Colors.white : Colors.black,fontSize: 25,fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Mon',
            style: AppTextStyle.fontStyle10white.copyWith(
              color: isSelected ? Colors.white : Colors.black,fontSize: 15
            ),
          ),
        ],
      ),
    );
  }
}
