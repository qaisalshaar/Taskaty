import 'package:flutter/material.dart';
import 'package:taskatykais/core/models/task_maneger.dart';
import 'package:taskatykais/core/utilities/app_textstyle.dart';

import 'task_item.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({super.key});

  @override
  Widget build(BuildContext context) {
    TaskManeger maneger = TaskManeger.maneger;
    return ListenableBuilder(
        listenable: TaskManeger.maneger,
        builder: (context, child) {
          return Expanded(
            child: ListView.builder(
              itemCount: maneger.tasksList.length,
              itemBuilder: (_, index) => Dismissible(
                key: UniqueKey(),
                onDismissed: (direction) {
                  if (direction == DismissDirection.startToEnd) {
                    // Handle completed action
                  }
                },
                background: Align(
                  // Use Align to control alignment
                  alignment: Alignment.centerLeft, // Align to the left
                  child: Transform.scale(
                    // Scale the background
                    scaleY: 1.7,
                    // Scale vertically to 10 pixels (0.2 * original height)
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.done,
                            color: Colors.white,
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Completed',
                            style: AppTextStyle.fontStyle10white
                                .copyWith(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                secondaryBackground: Align(
                  // Use Align to control alignment
                  alignment: Alignment.centerRight, // Align to the right
                  child: Transform.scale(
                    // Scale the background
                    scaleY: 1.7,
                    // Scale vertically to 10 pixels (0.2 * original height)
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Delete',
                            style: AppTextStyle.fontStyle10white
                                .copyWith(fontSize: 20),
                          ),
                          SizedBox(width: 10),
                          Icon(
                            Icons.delete_forever_rounded,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: TaskItem(
                    task: maneger.tasksList[index],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
