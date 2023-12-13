import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TrailingActionDialog {
  BuildContext context;
  String? title;
  Widget content;

  String buttonTitle;
  Function()? onAccept;

  String trailingButtonTitle;
  Function() onTrailingPressed;
  Color? trailingButtonColor;

  Color? buttonColor;
  Color backgroundColor;
  bool disableTintColor;

  TrailingActionDialog.show(
    this.context, {
    this.title,
    required this.content,
    required this.buttonTitle,
    required this.onAccept,
    required this.trailingButtonTitle,
    required this.onTrailingPressed,
    this.trailingButtonColor,
    this.buttonColor,
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
    Color mainButtonColor =
        buttonColor ?? Theme.of(context).colorScheme.primary;

    showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            surfaceTintColor: disableTintColor ? backgroundColor : null,

            /// Background Color
            backgroundColor: backgroundColor,

            /// Title
            title: title != null ? Text(title!) : null,

            /// Child Content Widget
            content: SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: content,
            )),

            actions: <Widget>[
              Row(
                children: [
                  /// Trailing Button
                  TextButton(
                    onPressed: () {
                      onTrailingPressed();
                    },
                    child: Text(
                      trailingButtonTitle,
                      style: TextStyle(color: trailingButtonColor),
                    ),
                  ),

                  const Spacer(),

                  /// Confirm Button
                  ElevatedButton(
                    onPressed: () {
                      if (onAccept != null) onAccept!();
                      Navigator.pop(context);
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(mainButtonColor),
                    ),
                    child: Text(
                      buttonTitle,
                      style: TextStyle(color: backgroundColor),
                    ),
                  ),
                ],
              ),
            ],
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
              Padding(
                padding: const EdgeInsets.only(top: 4, bottom: 10),
                child: Column(
                  children: [
                    /// Trailing Button
                    CupertinoDialogAction(
                      onPressed: () {
                        onTrailingPressed();
                      },
                      child: Text(
                        trailingButtonTitle,
                        style: TextStyle(color: trailingButtonColor),
                      ),
                    ),

                    const Divider(),

                    /// Confirm Button
                    CupertinoDialogAction(
                      onPressed: () {
                        if (onAccept != null) onAccept!();
                        Navigator.pop(context);
                      },
                      child: Text(
                        buttonTitle,
                        style: TextStyle(
                            color: buttonColor, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        });
  }
}
