import 'package:flutter/foundation.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoDialog {
  BuildContext context;
  String? title;
  Widget content;
  String buttonTitle;

  Color? buttonColor;
  Color backgroundColor;
  bool disableTintColor;

  InfoDialog.show(
    this.context, {
    this.title,
    required this.content,
    required this.buttonTitle,
    this.buttonColor,
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
    Color mainButtonColor =
        buttonColor ?? Theme.of(context).colorScheme.primary;

    showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            surfaceTintColor: disableTintColor ? backgroundColor : null,

            /// Background Color
            backgroundColor: backgroundColor,

            title: title != null ? Text(title!) : null,

            /// Child Content Widget
            content: SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: content,
            )),

            actions: <Widget>[
              /// Confirm Button
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(mainButtonColor),
                ),
                child: Text(
                  buttonTitle,
                  style: TextStyle(color: backgroundColor),
                ),
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
              /// Confirm Button
              CupertinoDialogAction(
                  onPressed: () => Navigator.pop(context),

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
