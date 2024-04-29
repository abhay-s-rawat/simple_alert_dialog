import 'package:flutter/material.dart';

abstract class AlertContentWrapper {
  Widget get getWidget;
}

class AlertContentText implements AlertContentWrapper {
  final String text;
  final TextStyle? style;

  AlertContentText(this.text, {this.style});

  @override
  Widget get getWidget {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: style ??
          const TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
    );
  }
}

class AlertContentWidget implements AlertContentWrapper {
  final Widget widget;

  AlertContentWidget(this.widget);

  @override
  Widget get getWidget {
    return widget;
  }
}
