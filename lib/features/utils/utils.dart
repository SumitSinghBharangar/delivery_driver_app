import 'package:flutter/cupertino.dart';

class Utils {
  static go(
      {required BuildContext context,
      required dynamic screen,
      bool replace = false}) {
    replace
        ? Navigator.pushReplacement(
            context,
            CupertinoPageRoute(
              builder: (context) => screen,
            ))
        : Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => screen,
            ),
          );
  }
}