import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDialog {
  BuildContext context;
  Widget view;

  Color backgroundColor;
  bool disableTintColor;

  CustomDialog.show(
    this.context, {
    required this.view,
    required this.backgroundColor,
    required this.disableTintColor,
  }) {
    // Decide dialog layout based on platform
    if (Platform.isIOS) {
      _cupertinoView();
    } else if (Platform.isAndroid) {
      _materialView();
    } else {
      _materialView();
    }
  }

  _materialView() {
    showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            surfaceTintColor: disableTintColor ? backgroundColor : null,
            backgroundColor: backgroundColor,

            /// Child Content Widget
            content: SingleChildScrollView(child: view),
          );
        });
  }

  _cupertinoView() {
    showCupertinoModalPopup(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            /// Child Content Widget
            content: SingleChildScrollView(child: view),
          );
        });
  }
}
