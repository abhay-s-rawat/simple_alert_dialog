import 'package:flutter/material.dart';
import 'animated_image.dart';
import '../wrappers/alert_content_wrapper.dart';
import '../wrappers/alert_title_wrapper.dart';

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
        return Center(
          child: LayoutBuilder(
              builder: (BuildContext ctx, BoxConstraints constraints) {
            double maxWidth = 350;
            if (constraints.maxWidth <= maxWidth) {
              maxWidth = constraints.maxWidth - 40;
            }
            if (width != null) {
              maxWidth = width;
            }
            return SingleChildScrollView(
              child: AlertDialog(
                elevation: 10,
                backgroundColor: Colors.white,
                surfaceTintColor: Colors.white,
                contentPadding: EdgeInsets.zero,
                titlePadding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
                title: Container(
                  width: double.infinity,
                  height: 150,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(borderRadius),
                      topRight: Radius.circular(borderRadius),
                    ),
                  ),
                  child: Image.asset(
                    assetImagepath,
                    fit: BoxFit.cover,
                  ),
                ),
                content: Container(
                  constraints: BoxConstraints(maxWidth: maxWidth),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(borderRadius),
                      bottomRight: Radius.circular(borderRadius),
                    ),
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      title.getWidget,
                      const SizedBox(height: 10),
                      content.getWidget,
                      const SizedBox(height: 20),
                      if ((confirmBtnText != null) || (cancelBtnText != null))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (cancelBtnText != null)
                              Expanded(
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(borderRadius),
                                    ),
                                    side: BorderSide(
                                      width: 1,
                                      color: buttonsColor,
                                    ),
                                  ),
                                  onPressed: () async {
                                    if (onCancelButtonPressed != null) {
                                      await onCancelButtonPressed.call(ctx);
                                    } else {
                                      Navigator.pop(ctx, false);
                                    }
                                  },
                                  child: Text(
                                    cancelBtnText,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: buttonsColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            const SizedBox(width: 20),
                            if (confirmBtnText != null)
                              Expanded(
                                child: FilledButton(
                                  style: FilledButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(borderRadius),
                                    ),
                                    backgroundColor: buttonsColor,
                                  ),
                                  onPressed: () async {
                                    if (onConfirmButtonPressed != null) {
                                      await onConfirmButtonPressed.call(ctx);
                                    } else {
                                      Navigator.pop(ctx, true);
                                    }
                                  },
                                  child: Text(
                                    confirmBtnText,
                                    style: const TextStyle(
                                      fontSize: 13,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            );
          }),
        );
      },
    );
  }
}
