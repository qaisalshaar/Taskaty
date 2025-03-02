import 'package:flutter/material.dart';
import 'package:taskatykais/core/hellpers/extensions.dart';
import 'package:taskatykais/core/utilities/app_color.dart';

import '../../../core/utilities/app_text.dart';
import '../../../core/utilities/app_textstyle.dart';
import '../../profile/profile_screen.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
        
            children: [
              Text(
        
                AppText.welcomeInHome('Kais Alshaar'),
                style: AppTextStyle.fontStyle20boldgrey.copyWith(
                    color: AppColor.mainColor),),
              Text('Have A Nice Day',
                style: AppTextStyle.fontStyle20boldgrey.copyWith(
        
                    fontWeight: FontWeight.normal
                ),),
            ]),
      ),

      InkWell(
        onTap: (){

          context.push(ProfileScreen());



        },
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage('assets/images/kaisalshaar.jpg'),
              fit: BoxFit.cover,
              onError: (exception, stackTrace) {
                debugPrint('Error loading image: $exception');
              },
            ),
            border: Border.all(
              color: AppColor.mainColor, // Change to your desired blue color
              width: 3.0, // Adjust the width of the border
            ),
          ),
        ),
      )

    ]);
  }
}
