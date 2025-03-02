import 'package:flutter/material.dart';
import '../../../core/utilities/app_color.dart';
import '../../../core/utilities/app_textstyle.dart';

class CreatetaskBtn extends StatelessWidget {
  const CreatetaskBtn({super.key});

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
        InkWell(
          onTap: () {
            // context.push(AddTask());
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              color: AppColor.mainColor,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 18,
                ),
                Text('Create Task', style: AppTextStyle.fontStyle10white),
              ],
            ),
          ),
        ),
      ],
    );
  }
}