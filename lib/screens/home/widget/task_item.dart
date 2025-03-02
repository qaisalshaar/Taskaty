import 'package:flutter/material.dart';
import 'package:taskatykais/core/utilities/app_color.dart';
import '../../../core/utilities/app_textstyle.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: AppColor.mainColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(children: [
        Expanded( // Wrap the Column in an Expanded widget
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Flutter Task-1 oooooooooooooooooooewtewtewtewtwetoooojhmcgchgmccc',
                style: AppTextStyle.fontStyle10white,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                softWrap: false,
              ),
              SizedBox(
                height: 10,
              ),
              Row(children: [
                Icon(
                  Icons.access_time_outlined,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  '10:00 AM',
                  style: AppTextStyle.fontStyle10white,
                ),
              ]),
              SizedBox(
                height: 10,
              ),
              Text(
                'I Will Do This Task',
                style: AppTextStyle.fontStyle10white,
              ),
            ],
          ),
        ),
        Container(
          width: 1,
          height: 60, // Adjust the height as needed
          child: VerticalDivider(
            color: Colors.white,
            thickness: 1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: RotatedBox(
            quarterTurns: 3, // Rotates the text 90 degrees clockwise
            child: Text('To Do', style: AppTextStyle.fontStyle10white),
          ),
        ),
      ]),
    );
  }
}