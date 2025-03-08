import 'package:flutter/material.dart';
import 'package:taskatykais/core/hellpers/extensions.dart';
import 'package:taskatykais/core/utilities/app_color.dart';
import 'package:taskatykais/core/utilities/app_textstyle.dart';
import '../../../core/widget/custom_btn.dart';
import '../../addtask/add_task_screen.dart';

class DateAddBtn extends StatelessWidget {
  const DateAddBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            'October 30 , 2025 \nToday',
            style: AppTextStyle.fontStyle20boldgrey,
          ),
        ),
        SizedBox(width: 8), // Add some spacing between text and button
        SizedBox( // Constrain the button's width
          width: 125, // Adjust this value to your desired width
          child: CustomBtn(
            title: 'Add Task',
            icon: Icons.add,
            onTap: () {
              context.push(AddTaskScreen());
            },
          ),
        ),
      ],
    );
  }
}