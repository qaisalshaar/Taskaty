import 'package:flutter/material.dart';

extension Navigate on BuildContext {
  // void navigateTo(Widget widget) {
  //   Navigator.push(
  //     this,
  //     MaterialPageRoute(
  //       builder: (context) => widget,
  //     ),
  //   );
  // }


push(Widget newScreen) => Navigator.push(this, MaterialPageRoute(builder: (_) => newScreen));

}