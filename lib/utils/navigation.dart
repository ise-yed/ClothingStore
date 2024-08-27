import 'package:flutter/material.dart';

 navigation({
  required BuildContext context,
  required Widget widgets,
  bool fullScreen = false,
  bool closeScreen = false,
}) {
  if (closeScreen) {
    Navigator.of(context, rootNavigator: fullScreen)
        .pushReplacement(MaterialPageRoute(
      builder: (context) => widgets,
    ));
  }
  Navigator.of(context, rootNavigator: fullScreen).push(MaterialPageRoute(
    builder: (context) => widgets,
  ));
}
