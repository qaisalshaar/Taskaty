import 'package:flutter/material.dart';

import 'custom_text_form.dart';

class StartEndTime extends StatelessWidget {
  const StartEndTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Row(children: [
        CustomTextForm(
          onTap: (){


          },

          title: 'Start Time',
          hintText: '2:30 AM',
          suffixIcon: Icon(Icons.arrow_drop_down),
        ),

        SizedBox(width: 25,),

        CustomTextForm(
          onTap: (){


          },

          title: 'End Time',
          hintText: '2:45 PM',
          suffixIcon: Icon(Icons.arrow_drop_down),
        ),

      ],),

    );
  }
}
