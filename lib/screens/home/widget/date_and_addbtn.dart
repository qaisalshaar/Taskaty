import 'package:flutter/material.dart';
import 'package:taskatykais/core/hellpers/extensions.dart';
import 'package:taskatykais/core/utilities/app_color.dart';
import 'package:taskatykais/core/utilities/app_textstyle.dart';

import '../../addtask/add_task_screen.dart';

class DateAddBtn extends StatelessWidget {
  const DateAddBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(child: Text('October 30 , 2025 \nToday',style: AppTextStyle.fontStyle20boldgrey,)),
   InkWell(
     onTap: (){

       context.push(AddTask());

     },
     child: Container(
       // width: 60,
       // height: 60,
       padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
       decoration: BoxDecoration(
          color: AppColor.mainColor,
         shape:BoxShape.rectangle,borderRadius: BorderRadius.circular(10),
       ),
      child: Row(

        children: [
          Icon(Icons.add,color: Colors.white,size: 18,),
          Text('Add Task',style: AppTextStyle.fontStyle10white),

        ],
      ),

     ),
   )

    ]);
  }
}
