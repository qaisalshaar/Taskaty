import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:taskatykais/core/hellpers/extensions.dart';
import 'package:taskatykais/core/utilities/app_textstyle.dart';
import 'package:taskatykais/screens/home/home_screen.dart';

import '../../core/models/task_maneger.dart';
import '../../core/models/task_model.dart';
import '../../core/widget/custom_btn.dart';
import '../home/widget/date_and_addbtn.dart';
import 'widget/add_task_appbar.dart';
import 'widget/create_taskbtn.dart';
import 'widget/custom_text_form.dart';
import 'widget/start_end_time.dart';

class AddTaskScreen extends StatefulWidget {
  AddTaskScreen({
    super.key,
  });

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final titleController = TextEditingController();

  final noteController = TextEditingController();

  final dateController = TextEditingController();

  final startTimeController = TextEditingController();

  final endTimeController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  TaskManeger maneger = TaskManeger.maneger;

  int selectedColorIndex = -1;

  void updateSelectedIndexColor(int index) {
    setState(() {
      selectedColorIndex = index;
    });
  }

  // Store the selected color index
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AddTaskAppbar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextForm(
                  title: 'Title',

                  controller: titleController,
                  //  validator: (value) => value!.isEmpty ? 'Enter $title' : null,
                  validator: (value) {
                    // if (value == null || value.isEmpty) {
                    //   return 'Enter $titleController';
                    // }

                    if (value?.isEmpty ?? true) {
                      return 'Enter Title';
                    }
                  },
                  readOnly: false,
                  // title: 'Title',
                  hintText: 'Enter a title',
                  prefixIcon: Icon(
                    Icons.text_fields,
                    color: Colors.grey,
                  ),
                ),
                CustomTextForm(
                  controller: noteController,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please Enter Note';
                    }
                  },
                  readOnly: false,
                  prefixIcon: Icon(
                    Icons.note,
                    color: Colors.grey,
                  ),
                  title: 'Note',
                  hintText: 'Enter a note here',
                ),
                CustomTextForm(

                  controller: dateController,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please Enter Date';
                    }
                  },
                  readOnly: false,
                  onTap: () {
                    //  print('onTap onTap onTap onTaponTap');
                    showDatePicker(
                      context: context,
                      //  initialDate: DateTime(1900),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2100),
                    ).then((selectedDate) {
                      if (selectedDate != null) {
                      //  dateController.text = selectedDate.toLocal().toString().split(' ')[0];
                      //  'yyyy-MM-dd'
                        dateController.text =DateFormat('dd/MM/yyyy').format(selectedDate);


                      }
                    });
                  },
                  //  prefixIcon: Icon(Icons.date_range, color: Colors.grey),
                  title: 'Date',
                  hintText: 'Select a date',
                  suffixIcon: Icon(Icons.date_range, color: Colors.grey),
                ),
                Row(
                  // Wrap Start Time and End Time in a Row
                  children: [
                    Expanded(
                      // Use Expanded to make the CustomTextForm take up available space
                      child: CustomTextForm(
                        controller: startTimeController,
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Please Enter Start time';
                          }
                        },
                        readOnly: true,
                        onTap: () {
                          showTimePicker(
                              context: context, initialTime: TimeOfDay.now()).then((selectedTime) {
                            if (selectedTime != null) {
                              //  dateController.text = selectedDate.toLocal().toString().split(' ')[0];
                              //  'yyyy-MM-dd'
                              startTimeController.text =selectedTime.format(context);


                            }
                          });
                        },
                        title: 'Start Time',
                        hintText: 'select a time',
                        suffixIcon: Icon(Icons.date_range),
                      ),
                    ),
                    SizedBox(width: 8), // Add a small gap between the two forms
                    Expanded(
                      // Use Expanded to make the CustomTextForm take up available space
                      child: CustomTextForm(
                        controller: endTimeController,
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Please Enter End Time';
                          }
                        },
                        readOnly: true,
                        onTap: () {
                          showTimePicker(
                              context: context, initialTime: TimeOfDay.now()).then((selectedTime) {
                            if (selectedTime != null) {
                              //  dateController.text = selectedDate.toLocal().toString().split(' ')[0];
                              //  'yyyy-MM-dd'
                              endTimeController.text =selectedTime.format(context);


                            }
                          });
                        },
                        title: 'End Time',
                        hintText: 'select a time',
                        suffixIcon: Icon(Icons.date_range),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                CreatetaskBtn(
                  onColorSelected: (index) {
                    // Receive the color index
                    setState(() {
                      selectedColorIndex = index;
                    });
                  },
                  onTap: () {
                    if (formKey.currentState!.validate()) {

                      if(selectedColorIndex==-1){
                        showDialog(context: context, builder: (context)=>( AlertDialog(
                          title: Center(child: Text('Select Color')),
                          content: Text('Please select a color to add task'),
                       actions: [
                       TextButton(onPressed: (){
                         Navigator.pop(context);
                       }, child: Center(child: Text('OK')))
                       ],
                        )));
                      }else{
                        updateSelectedIndexColor(selectedColorIndex);
                        maneger.addTask(TaskModel(
                            title: titleController.text,
                            noteDescription: noteController.text,
                            date: dateController.text,
                            startTime: startTimeController.text,
                            endTime: endTimeController.text,
                            backgroundColor: selectedColorIndex != -1
                                ? availableColors[selectedColorIndex]
                                : Colors.transparent,
                            isCompleted: false));

                        context.push(HomeScreen());



                     }



                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
