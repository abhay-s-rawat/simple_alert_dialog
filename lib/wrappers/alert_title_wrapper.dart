import 'package:flutter/material.dart';

abstract class AlertTitleWrapper {
  Widget get getWidget;
}

class AlertTitleText implements AlertTitleWrapper {
  final String text;
  final TextStyle? style;

  AlertTitleText(this.text, {this.style});

  @override
  Widget get getWidget {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: style ?? const TextStyle(color: Colors.black, fontSize: 18),
    );
  }
}

class AlertTitleWidget implements AlertTitleWrapper {
  final Widget widget;

  AlertTitleWidget(this.widget);

  @override
  Widget get getWidget {
    return widget;
  }
}
