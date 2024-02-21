import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDialog {
  BuildContext context;
  Widget view;

  bool disablePadding;
  double? borderRadius;

  Color backgroundColor;
  bool disableTintColor;

  CustomDialog.show(
    this.context, {
    required this.view,
    this.disablePadding = false,
    this.borderRadius,
    required this.backgroundColor,
    required this.disableTintColor,
  }) {
    // Decide dialog layout based on platform
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      if (borderRadius == null && disablePadding == false) {
        _cupertinoView();
      } else {
        _materialView();
      }
    } else {
      _materialView();
    }
  }

  _materialView() {
    showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          return Theme(
            data: ThemeData(useMaterial3: true),
            child: AlertDialog(
              surfaceTintColor: disableTintColor ? backgroundColor : null,
              backgroundColor: backgroundColor,

              contentPadding: disablePadding ? EdgeInsets.zero : null,
              shape: (borderRadius != null)
                  ? RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.all(Radius.circular(borderRadius!)))
                  : null,

              /// Child Content Widget
              content: SingleChildScrollView(child: view),
            ),
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
