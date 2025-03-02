import 'package:flutter/material.dart';
import 'package:taskatykais/core/utilities/app_images.dart';
import 'package:taskatykais/core/utilities/app_text.dart';
import 'package:taskatykais/core/utilities/app_textstyle.dart';
import 'package:taskatykais/screens/home/home_screen.dart';

import '../../core/utilities/navigate_to_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {

    NavigationDelay.navigateAfterDelay(
      context,
      HomeScreen(),
      Duration(seconds: 3),
    );

   // Future.delayed(Duration(seconds: 3),(){
   //   Navigator.push(context,MaterialPageRoute(builder: (context)=>HomeScreen()));
   // });
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Image.asset(
          AppImages.splashlogo,
          width: double.infinity, // Customize the width as needed
          height: 200, // Customize the height as needed
                ),
            Text(AppText.appName,style: AppTextStyle.fontStyle50bold),
            SizedBox(height: 10,),
            Text(AppText.appdesc,style: AppTextStyle.fontStyle20boldgrey,



            )]),
        ));
  }
}
