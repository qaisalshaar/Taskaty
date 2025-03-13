import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';


part 'task_model.g.dart';
@HiveType(typeId: 0)
class TaskModel extends HiveObject{
  @HiveField(0)
  String title;
  @HiveField(1)
  String noteDescription;
  @HiveField(2)
  String date;
  @HiveField(3)
  String startTime;
  @HiveField(4)
  String endTime;
  @HiveField(5)
  Color backgroundColor;
  @HiveField(6)
  bool isCompleted;


  TaskModel({
    required this.title,
    required this.noteDescription,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.backgroundColor,
     this.isCompleted=false,
  });
}



