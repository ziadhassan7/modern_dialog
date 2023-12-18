import 'package:flutter/foundation.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StandardDialog {
  BuildContext context;

  Widget? icon;
  String? title;
  Widget content;
  String buttonTitle;

  Function() onAccept;
  Function()? onCancel;

  Color? buttonColor;
  Color? cancelButtonColor;
  String cancelButtonTitle;

  bool shouldCloseOnMainButton;
  Color backgroundColor;
  bool disableTintColor;

  StandardDialog.show(
    this.context, {
    this.icon,
    this.title,
    required this.content,
    required this.buttonTitle,
    required this.onAccept,
    this.onCancel,
    this.buttonColor,
    this.cancelButtonColor,
    required this.cancelButtonTitle,
    required this.shouldCloseOnMainButton,
    required this.backgroundColor,
    required this.disableTintColor,
  }) {
    // Decide dialog layout based on platform
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      _cupertinoView();
    } else {
      _materialView();
    }
  }

  _materialView() {
    //main button color
    Color mainButtonColor =
        buttonColor ?? Theme.of(context).colorScheme.primary;
    //cancel button color
    cancelButtonColor ??= Theme.of(context).colorScheme.secondary;

    showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          return Theme(
            data: ThemeData(useMaterial3: true),
            child: AlertDialog(
              surfaceTintColor: disableTintColor ? backgroundColor : null,

              /// Background Color
              backgroundColor: backgroundColor,

              /// Icon
              icon: icon,

              /// Title
              title: title != null ? Text(title!) : null,

              /// Child Content Widget
              content: SingleChildScrollView(
                  child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: content,
              )),

              actions: <Widget>[
                /// Cancel Button
                TextButton(
                  onPressed: () {
                    if (onCancel != null) {
                      onCancel!();
                    }
                    Navigator.pop(context);
                  },
                  child: Text(
                    cancelButtonTitle,
                    style: TextStyle(color: cancelButtonColor),
                  ),
                ),

                /// Confirm Button
                TextButton(
                    onPressed: () {
                      onAccept();
                      //close window
                      if (shouldCloseOnMainButton) {
                        Navigator.pop(context);
                      }
                    },
                    style: ButtonStyle(
                      //color
                      backgroundColor:
                          MaterialStateProperty.all(mainButtonColor),
                    ),
                    //text
                    child: Text(
                      buttonTitle,
                      style: TextStyle(color: backgroundColor),
                    )),
              ],
            ),
          );
        });
  }

  _cupertinoView() {
    showCupertinoModalPopup<String>(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            /// Title
            title: title != null
                ? Text(
                    title!,
                    style: const TextStyle(fontSize: 18),
                  )
                : SingleChildScrollView(child: content),

            /// Child Content Widget
            content: title != null
                ? SingleChildScrollView(
                    child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: content,
                  ))
                : null,

            actions: <Widget>[
              /// Cancel Button
              CupertinoDialogAction(
                onPressed: () {
                  if (onCancel != null) {
                    onCancel!();
                  }
                  Navigator.pop(context);
                },
                child: Text(
                  cancelButtonTitle,
                  style: TextStyle(color: cancelButtonColor),
                ),
              ),

              /// Confirm Button
              CupertinoDialogAction(
                  onPressed: () {
                    onAccept();
                    //close window
                    if (shouldCloseOnMainButton) {
                      Navigator.pop(context);
                    }
                  },

                  //text
                  child: Text(
                    buttonTitle,
                    style: TextStyle(color: buttonColor),
                  )),
            ],
          );
        });
  }
}
