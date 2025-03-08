import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:taskatykais/core/hellpers/extensions.dart';
import 'package:taskatykais/core/utilities/app_textstyle.dart';
import 'package:taskatykais/screens/home/home_screen.dart';

import '../../core/widget/custom_btn.dart';
import '../home/widget/date_and_addbtn.dart';
import 'widget/add_task_appbar.dart';
import 'widget/create_taskbtn.dart';
import 'widget/custom_text_form.dart';
import 'widget/start_end_time.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({super.key,});

  final titleController = TextEditingController();

  var formKey = GlobalKey<FormState>();

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

                    if (value?.isEmpty??true) {
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
                  readOnly: false,
                  prefixIcon: Icon(
                    Icons.note,
                    color: Colors.grey,
                  ),
                  title: 'Note',
                  hintText: 'Enter a note here',
                ),
                CustomTextForm(
                  readOnly: false,
                  onTap: () {
                    //  print('onTap onTap onTap onTaponTap');
                    showDatePicker(
                      context: context,
                      //  initialDate: DateTime(1900),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2100),
                    );
                  },
                  //  prefixIcon: Icon(Icons.date_range, color: Colors.grey),
                  title: 'Date',
                  hintText: '12/12/2025',
                  suffixIcon: Icon(Icons.date_range, color: Colors.grey),
                ),
                Row(
                  // Wrap Start Time and End Time in a Row
                  children: [
                    Expanded(
                      // Use Expanded to make the CustomTextForm take up available space
                      child: CustomTextForm(
                        readOnly: true,
                        onTap: () {
                          showTimePicker(
                              context: context, initialTime: TimeOfDay.now());
                        },
                        title: 'Start Time',
                        hintText: '2:30 AM',
                        suffixIcon: Icon(Icons.date_range),
                      ),
                    ),
                    SizedBox(width: 8), // Add a small gap between the two forms
                    Expanded(
                      // Use Expanded to make the CustomTextForm take up available space
                      child: CustomTextForm(
                        readOnly: true,
                        onTap: () {
                          showTimePicker(
                              context: context, initialTime: TimeOfDay.now());
                        },
                        title: 'End Time',
                        hintText: '3:30 PM',
                        suffixIcon: Icon(Icons.date_range),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                CreatetaskBtn(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      context.push(HomeScreen());
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
