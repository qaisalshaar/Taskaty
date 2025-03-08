import 'package:flutter/material.dart';
import '../../../core/utilities/app_color.dart';
import '../../../core/utilities/app_textstyle.dart';
import '../../../core/widget/custom_btn.dart';

class CreatetaskBtn extends StatelessWidget {
  final void Function()? onTap;
  const CreatetaskBtn({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column( // Use Column here
            crossAxisAlignment: CrossAxisAlignment.start, // Align to the start
            children: [
              Text(
                'Color',
                style: AppTextStyle.fontStyle20boldblack,
              ),
              const SizedBox(height: 5), // Add vertical spacing
              Row(
                mainAxisAlignment: MainAxisAlignment.start, // Align circles to the start
                children: <Widget>[
                  // Red Circle
                  Container(
                    width: 20,
                    height: 20,
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    child: const Stack(
                      alignment: Alignment.center, // Center the icon
                      children: [
                        Icon(
                          Icons.check , // Or any other arrow icon
                          size: 12, // Adjust the size as needed
                          color: Colors.white, // Or any color you want for the icon
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 5),
                  // Blue Circle
                  Container(
                    width: 20,
                    height: 20,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 5),
                  // Green Circle
                  Container(
                    width: 20,
                    height: 20,
                    decoration: const BoxDecoration(
                      color: Colors.orange,
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),


        // CustomBtn(
        //   title: 'Create Task',
        //  // icon:  Icons.add,
        //   onTap: onTap,
        // ),
      ],
    );
  }
}