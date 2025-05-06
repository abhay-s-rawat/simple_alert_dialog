import 'package:flutter/material.dart';
import 'animated_image.dart';
import '../wrappers/alert_content_wrapper.dart';
import '../wrappers/alert_title_wrapper.dart';
import 'simple_alert_dialog_widget.dart';

class SimpleAlertDialog {
  static Future show(
    BuildContext context, {
    //
    required AlertTitleWrapper title,
    required AlertContentWrapper content,
    //
    Function(BuildContext ctx)? onConfirmButtonPressed,
    Function(BuildContext ctx)? onCancelButtonPressed,
    //
    String? confirmationText,
    //
    String assetImagepath = AnimatedImage.success,
    bool barrierDismissible = true,
    String? confirmBtnText = 'YES',
    String? cancelBtnText = 'NO',
    Color buttonsColor = Colors.red,
    double borderRadius = 5,
    double? width,
  }) {
    return showDialog(
      barrierDismissible: barrierDismissible,
      context: context,
      builder: (BuildContext ctx2) {
        return SimpleAlertDialogWidget(
          title: title,
          content: content,
          assetImagepath: assetImagepath,
          barrierDismissible: barrierDismissible,
          buttonsColor: buttonsColor,
          borderRadius: borderRadius,
          onConfirmButtonPressed: onConfirmButtonPressed,
          onCancelButtonPressed: onCancelButtonPressed,
          confirmationText: confirmationText,
          confirmBtnText: confirmBtnText,
          cancelBtnText: cancelBtnText,
          width: width,
        );
      },
    );
  }
}
