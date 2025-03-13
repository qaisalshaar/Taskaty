import 'package:flutter/material.dart';
import 'package:taskatykais/core/models/task_model.dart';
import 'package:taskatykais/core/utilities/app_color.dart';
import '../../../core/utilities/app_textstyle.dart';

class TaskItem extends StatelessWidget {
final  TaskModel task;

  const TaskItem({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: task.backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(children: [
        Expanded( // Wrap the Column in an Expanded widget
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
               task.title,
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
                 '${task.startTime} - ${task.endTime}',
                  style: AppTextStyle.fontStyle10white,
                ),
              ]),
              SizedBox(
                height: 10,
              ),
              Text(
                task.noteDescription,
                style: AppTextStyle.fontStyle10white,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                task.date,
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
            child: Text(task.isCompleted?'Completed':'To Do', style: AppTextStyle.fontStyle10white),
          ),
        ),
      ]),
    );
  }
}