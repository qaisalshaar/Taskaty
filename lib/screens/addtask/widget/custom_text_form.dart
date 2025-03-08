import 'package:flutter/material.dart';

import '../../../core/utilities/app_textstyle.dart';

class CustomTextForm extends StatelessWidget {
  final String title;
  final String hintText;
final bool readOnly;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
 // final String? Function(String?)? validator;

  final void Function()? onTap;

  final TextEditingController? controller;
  const CustomTextForm({super.key, required this.title, required this.hintText, this.suffixIcon, this.prefixIcon, this.onTap, required this.readOnly, this.validator, this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyle.fontStyle20boldblack),
        SizedBox(
          height: 5,
        ),
        TextFormField(
          controller:controller ,
          // validator: (value) => value!.isEmpty ? 'Enter $title' : null,
          validator: validator,
          readOnly: readOnly,
          onTap: onTap,
          decoration: InputDecoration(


            hintText: hintText,

            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                  color: Colors.grey, style: BorderStyle.solid, width: 3),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
