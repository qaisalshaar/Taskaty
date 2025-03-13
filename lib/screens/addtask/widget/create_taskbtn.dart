import 'package:flutter/material.dart';
import '../../../core/utilities/app_color.dart';
import '../../../core/utilities/app_textstyle.dart';
import '../../../core/widget/custom_btn.dart';

class CreatetaskBtn extends StatefulWidget {
  final void Function()? onTap;
  final Function(int) onColorSelected; // Add this callback
  const CreatetaskBtn({super.key, this.onTap, required this.onColorSelected,});

  @override
  State<CreatetaskBtn> createState() => _CreatetaskBtnState();
}

class _CreatetaskBtnState extends State<CreatetaskBtn> {
 late int selectedIndexColor = -1;

  @override
  Widget build(BuildContext context) {

    return Row(
      children: [
        Expanded(
          child: Column( // Use Column here
            crossAxisAlignment: CrossAxisAlignment.center, // Align to the start
            children: [
              Text(
                'Tasks Color',
                style: AppTextStyle.fontStyle20boldblack,
              ),
              const SizedBox(height: 5), // Add vertical spacing
              SizedBox(
                height: 100, // Increased height
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return SizedBox( // Removed Expanded, added SizedBox with width if needed
                      width: 80, // Adjust width as needed
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                selectedIndexColor=index;
                              });
                              widget.onColorSelected(index);


                            },

                            child: CircleAvatar(
                              backgroundColor: availableColors[index],
                              radius: 20,
                              child:
                              index==selectedIndexColor? Icon(Icons.check, color: Colors.white,):null

                            //  Icon(Icons.check, color: Colors.white,),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Column(
                            children: [
                              Text(
                                availableColorsTitle[index],
                                textAlign: TextAlign.center,
                                style: AppTextStyle.fontStyle20boldblack.copyWith(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                               // overflow: TextOverflow.ellipsis, // Added overflow handling
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(width: 10),
                  itemCount: availableColors.length,
                ),
              ),


            ],
          ),
        ),


        SizedBox(
        //  width: 100,
          child: CustomBtn(
            width: 100,
            title: 'Create Task',
            // icon:  Icons.add,
            onTap: () {
              widget.onColorSelected(selectedIndexColor); // Pass the selected index
              if (widget.onTap != null) {
                widget.onTap!();
              }
            },
          ),
        ),
      ],
    );
  }
}

List<Color> availableColors = [
  Colors.blue,
  Colors.orange,
  Colors.red,
];
List<String> availableColorsTitle = ['Normal\n Task', 'Important\n Task', 'Critical\n Task'];