import 'package:flutter/material.dart';

import '../utilities/app_color.dart';
import '../utilities/app_textstyle.dart';

class CustomBtn extends StatelessWidget {
  final void Function()? onTap;
  final IconData? icon;
  final String title;
  final double? width;
  final double? height;
  final bool? centerTitle;
  final double? fontSize;
  final bool?  FontWeightbold;
  final Color? color;
  const CustomBtn(
      {super.key,
      this.onTap,
      this.icon,
      required this.title,

      this.centerTitle, this.fontSize, this.FontWeightbold, this.color, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: color ?? AppColor.mainColor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            if (icon != null)
              Icon(
                icon,
                color: Colors.white,
                size: 18,
              ),
            Expanded(
                child: Center(
                    child: Text(
              title,
            //  style: AppTextStyle.fontStyle10white,
              style: AppTextStyle.fontStyle10white.copyWith(
                fontSize: fontSize ?? 10,
                fontWeight: FontWeightbold == true ? FontWeight.bold : FontWeight.normal,
              ),
            ))),
          ],
        ),
      ),
    );
  }
}
