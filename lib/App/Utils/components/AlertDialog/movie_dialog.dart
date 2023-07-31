import 'package:flutter/material.dart';
import 'package:spacex/App/Constants/paddings.dart';
import 'package:spacex/App/Utils/Components/AlertDialog/base_dialog.dart';

class MovieSimpleDialog {
  Future show({Widget? title, List<Widget>? children, EdgeInsets? padding, bool? barrierDismissible}) {
    return BaseDialog().showDynamicDialog(
      barrierColor: Colors.black45,
      barrierDismissible: barrierDismissible,
      widget: SimpleDialog(
        title: title,
        titlePadding: EdgeInsets.zero,
        contentPadding: padding ?? const EdgeInsets.all(paddingM),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(paddingXL)),
        children: children,
      ),
    );
  }
}
