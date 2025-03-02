import 'package:flutter/material.dart';
import 'package:taskatykais/core/utilities/app_color.dart';
import 'package:taskatykais/core/utilities/app_textstyle.dart';

class EmptyTaskList extends StatelessWidget {
  const EmptyTaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(

      children: [
        Image.asset(
          'assets/images/no-task.png',
          width: 175,
          height: 175,

        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 100),
          child: Row(

            children: [
              Text(
                'No Task Found',
                style: AppTextStyle.fontStyle20boldgrey,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Add New Task To Make Your Days More Productive ',textAlign:TextAlign.center ,
          style: AppTextStyle.fontStyle20boldgrey,
        ),

      ],
    );
  }
}
