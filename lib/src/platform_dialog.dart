import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class PlatformDialog {
  factory PlatformDialog() {
    if (Platform.isAndroid) {
      return AndroidDialog();
    } else {
      return CupertinoDialog();
    }
  }
  Widget build(BuildContext context,
      {required Widget title,
      // This radius for only Android's border
      double borderRadius,
      required Widget content,
      List<Widget> actions,

      // This alignment for only Android's actions
      MainAxisAlignment axisAlignment,
      //This Icon widget for only Android's dialog
      Widget icon});
}

class AndroidDialog implements PlatformDialog {
  @override
  Widget build(BuildContext context,
      {required Widget title,
      double borderRadius = 10,
      required Widget content,
      List<Widget>? actions,
      MainAxisAlignment? axisAlignment,
      Widget? icon}) {
    return AlertDialog(
      title: title,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      content: content,
      titlePadding: const EdgeInsets.all(12),
      contentPadding: const EdgeInsets.all(10),
      actions: actions ?? [],
      actionsAlignment: axisAlignment,
      icon: icon,
      iconPadding: const EdgeInsets.all(6),
      actionsPadding: EdgeInsets.zero,
    );
  }
}

class CupertinoDialog implements PlatformDialog {
  @override
  Widget build(BuildContext context,
      {required Widget title,
      double borderRadius = 10,
      required Widget content,
      List<Widget>? actions,
      MainAxisAlignment? axisAlignment,
      Widget? icon}) {
    return CupertinoAlertDialog(
      content: content,
      title: title,
      actions: actions ?? [],
    );
  }
}

abstract class PlatformDialogButton {
  factory PlatformDialogButton(TargetPlatform platform) {
    if (platform == TargetPlatform.android) {
      return AndroidButton();
    } else {
      return CupertinoButton();
    }
  }

  Widget build(BuildContext context, {required Widget child, required VoidCallback onPressed});
}

class AndroidButton implements PlatformDialogButton {
  @override
  Widget build(BuildContext context, {required Widget child, required VoidCallback onPressed}) {
    return TextButton(onPressed: onPressed, child: child);
  }
}

class CupertinoButton implements PlatformDialogButton {
  @override
  Widget build(BuildContext context, {required Widget child, required VoidCallback onPressed}) {
    return CupertinoDialogAction(onPressed: onPressed, child: child);
  }
}
