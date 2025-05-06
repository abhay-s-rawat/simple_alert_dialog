import 'package:flutter/material.dart';
import '../simple_alert_dialog.dart';

class SimpleAlertDialogWidget extends StatefulWidget {
  final AlertTitleWrapper title;
  final AlertContentWrapper content;
  //
  final Function(BuildContext ctx)? onConfirmButtonPressed;
  final Function(BuildContext ctx)? onCancelButtonPressed;
  //
  final String? confirmationText;
  //
  final String assetImagepath;
  final bool barrierDismissible;
  final String? confirmBtnText;
  final String? cancelBtnText;
  final Color buttonsColor;
  final double borderRadius;
  final double? width;

  const SimpleAlertDialogWidget({
    super.key,
    required this.title,
    required this.content,
    this.onConfirmButtonPressed,
    this.onCancelButtonPressed,
    this.confirmationText,
    required this.assetImagepath,
    required this.barrierDismissible,
    this.confirmBtnText,
    this.cancelBtnText,
    required this.buttonsColor,
    required this.borderRadius,
    this.width,
  });

  @override
  State<SimpleAlertDialogWidget> createState() =>
      _SimpleAlertDialogWidgetState();
}

class _SimpleAlertDialogWidgetState extends State<SimpleAlertDialogWidget> {
  final TextEditingController confirmationText = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    confirmationText.dispose();
    super.dispose();
  }

  Widget get _getConfirmationTextWidget {
    if (widget.confirmationText != null) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Enter '${widget.confirmationText}' to confirm action.",
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            validator: (String? value) {
              if (value == widget.confirmationText) {
                return null;
              }
              return "Wrong confirmation text";
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: confirmationText,
            textAlignVertical: TextAlignVertical.center,
            style: const TextStyle(fontSize: 12, color: Colors.black),
            decoration: InputDecoration(
              hintText: "Enter text here...",
              hintStyle: const TextStyle(fontSize: 12, color: Colors.grey),
              isDense: true,
              contentPadding: const EdgeInsets.all(15),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              border: const OutlineInputBorder(),
              errorMaxLines: 1,
              errorStyle: const TextStyle(fontSize: 9, height: 1),
              labelText: "Confirmation Text",
              labelStyle: TextStyle(
                fontSize: 13,
                color: widget.buttonsColor,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: widget.buttonsColor),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              disabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              hoverColor: widget.buttonsColor,
              focusColor: widget.buttonsColor,
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
              ),
              focusedErrorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Center(
        child: LayoutBuilder(builder: (
          BuildContext ctx,
          BoxConstraints constraints,
        ) {
          double maxWidth = 350;
          if (constraints.maxWidth <= maxWidth) {
            maxWidth = constraints.maxWidth - 40;
          }
          if (widget.width != null) {
            maxWidth = widget.width!;
          }
          return SingleChildScrollView(
            child: AlertDialog(
              elevation: 10,
              backgroundColor: Colors.white,
              surfaceTintColor: Colors.white,
              contentPadding: EdgeInsets.zero,
              titlePadding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius),
              ),
              title: Container(
                width: double.infinity,
                height: 150,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(widget.borderRadius),
                    topRight: Radius.circular(widget.borderRadius),
                  ),
                ),
                child: Image.asset(
                  widget.assetImagepath,
                  fit: BoxFit.cover,
                ),
              ),
              content: Container(
                constraints: BoxConstraints(maxWidth: maxWidth),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(widget.borderRadius),
                    bottomRight: Radius.circular(widget.borderRadius),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    widget.title.getWidget,
                    const SizedBox(height: 10),
                    widget.content.getWidget,
                    const SizedBox(height: 15),
                    if (widget.confirmationText != null)
                      _getConfirmationTextWidget,
                    if ((widget.confirmBtnText != null) ||
                        (widget.cancelBtnText != null))
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (widget.cancelBtnText != null)
                            Expanded(
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      widget.borderRadius,
                                    ),
                                  ),
                                  side: BorderSide(
                                    width: 1,
                                    color: widget.buttonsColor,
                                  ),
                                ),
                                onPressed: () async {
                                  if (widget.onCancelButtonPressed != null) {
                                    await widget.onCancelButtonPressed!
                                        .call(ctx);
                                  } else {
                                    Navigator.pop(ctx, false);
                                  }
                                },
                                child: Text(
                                  widget.cancelBtnText!,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: widget.buttonsColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          const SizedBox(width: 20),
                          if (widget.confirmBtnText != null)
                            Expanded(
                              child: FilledButton(
                                style: FilledButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      widget.borderRadius,
                                    ),
                                  ),
                                  backgroundColor: widget.buttonsColor,
                                ),
                                onPressed: () async {
                                  if (widget.confirmationText != null) {
                                    bool? isValid =
                                        _formKey.currentState?.validate();
                                    if (isValid == null || isValid == false) {
                                      return;
                                    }
                                  }
                                  if (widget.onConfirmButtonPressed != null) {
                                    await widget.onConfirmButtonPressed!
                                        .call(ctx);
                                  } else {
                                    Navigator.pop(ctx, true);
                                  }
                                },
                                child: Text(
                                  widget.confirmBtnText!,
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
      ),
    );
  }
}
