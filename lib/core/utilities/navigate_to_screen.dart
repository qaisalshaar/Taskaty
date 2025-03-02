import 'package:flutter/material.dart';

class NavigationDelay {
  static void navigateAfterDelay(
      BuildContext context, Widget destination, Duration delay) {
    Future.delayed(delay, () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => destination));
    });
  }
}
