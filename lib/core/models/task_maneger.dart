import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskatykais/core/models/task_model.dart';

class TaskManeger extends ChangeNotifier{
  TaskManeger._(){


    _loadTasks();
  }

 static TaskManeger maneger = TaskManeger._();
  List<TaskModel> tasksList = [
     //TaskModel(title: 'Task 1', noteDescription: 'Task 1 desc', date: '10/10/2025', startTime: '10:00 AM', endTime: '10:30 PM', backgroundColor: Colors.blue,isCompleted: true),
    // TaskModel(title: 'Task 2', noteDescription: 'Task 2 desc', date: '10/10/2025', startTime: '10:00 AM', endTime: '10:30 PM', backgroundColor: Colors.green,isCompleted: false),
    // TaskModel(title: 'Task 3', noteDescription: 'Task 3 desc', date: '10/10/2025', startTime: '10:00 AM', endTime: '10:30 PM', backgroundColor: Colors.orange,isCompleted: true),

  ];

  _loadTasks()async{
  tasksList = await Hive.box<TaskModel>("tasks box").values.toList();
    notifyListeners();
  }


 void addTask(TaskModel task)async{
   tasksList.add(task);
   await Hive.box<TaskModel>("tasksbox").add(task);

    notifyListeners();

  }
}