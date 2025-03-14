import 'package:flutter/material.dart';
import 'package:taskatykais/core/utilities/app_color.dart';
import 'package:taskatykais/core/utilities/app_textstyle.dart';

class AddTaskAppbar extends StatelessWidget implements PreferredSizeWidget {
  const AddTaskAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      toolbarHeight: 56,
      elevation: 0,
      backgroundColor: Colors.white,
      iconTheme:  IconThemeData(color: AppColor.mainColor),
      title: Text(
        'Add Task',
        style: AppTextStyle.fontStyle20boldgrey.copyWith(
            color: AppColor.mainColor,
            fontSize: 25,
            fontWeight: FontWeight.bold),
      ),

    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(56);
}
