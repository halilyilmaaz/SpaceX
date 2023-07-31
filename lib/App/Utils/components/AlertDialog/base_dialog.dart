import 'package:flutter/material.dart';
import 'package:spacex/App/Utils/route/route.dart';

class BaseDialog {
  Future showDynamicDialog({required Widget widget, bool? barrierDismissible, Color? barrierColor}) {
    return showDialog(
      barrierDismissible: barrierDismissible ?? true,
      barrierColor: barrierColor,
      context: Screens.context,
      builder: (BuildContext context) {
        return widget;
      },
    );
  }
}