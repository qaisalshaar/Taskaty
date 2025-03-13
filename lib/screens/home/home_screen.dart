import 'package:flutter/material.dart';
import 'package:taskatykais/screens/home/widget/fllter_date.dart';

import '../../core/models/task_maneger.dart';
import '../../core/utilities/app_textstyle.dart';
import 'widget/date_and_addbtn.dart';
import 'widget/empty_task_list.dart';
import 'widget/home_appbar.dart';
import 'widget/task_item.dart';
import 'widget/tasks_list_view.dart';

class HomeScreen extends StatelessWidget {

  TaskManeger maneger = TaskManeger.maneger;
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Column(
              children: [
                HomeAppBar(),
                SizedBox(
                  height: 10,
                ),
                DateAddBtn(),
                SizedBox(
                  height: 10,
                ),
                FilterDays(),
                SizedBox(
                  height: 10,
                ),
                //  TaskListView(),
                SizedBox(
                  height: 30,),
                maneger.tasksList.isEmpty? EmptyTaskList() : TaskListView(),
                //  maneger.tasksList.isEmpty ? EmptyTaskList() :  TaskManeger.maneger.loadTasks(),

                //   true? TaskListView(): EmptyTaskList(),
                //   EmptyTaskList(),
                //   TaskListView()
              ],
            ),
          )),
    );
  }
}
