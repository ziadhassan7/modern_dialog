import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VerticalDialog {
  BuildContext context;

  Widget? icon;
  String? title;
  Widget content;

  List<DialogButton> buttons;

  bool dismissibleDialog;
  Color backgroundColor;
  bool disableTintColor;

  VerticalDialog.show(
    this.context, {
    this.icon,
    this.title,
    required this.content,
    required this.buttons,
    required this.dismissibleDialog,
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
    showDialog<String>(
        context: context,
        barrierDismissible: dismissibleDialog,
        builder: (BuildContext context) {
          return PopScope(
            canPop: dismissibleDialog,

            child: Theme(
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
                  Column(
                    children: [
                      for (int i = 0; i < buttons.length; i++)
                        Padding(
                          padding: const EdgeInsets.all(4),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 2),
                            decoration: BoxDecoration(
                                color: buttons[i].color != null
                                    ? buttons[i].color!.withOpacity(0.09)
                                    : Theme.of(context)
                                        .colorScheme
                                        .primary
                                        .withOpacity(0.07),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(6))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                TextButton(
                                  onPressed: buttons[i].onPressed,
                                  child: Text(
                                    buttons[i].title,
                                    style: TextStyle(color: buttons[i].color),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }

  _cupertinoView() {
    showCupertinoModalPopup<String>(
        context: context,
        barrierDismissible: dismissibleDialog,
        builder: (BuildContext context) {
          return PopScope(
            canPop: dismissibleDialog,

            child: CupertinoAlertDialog(
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
                      for (int i = 0; i < buttons.length; i++)
                        Column(
                          children: [
                            // Button
                            CupertinoDialogAction(
                              onPressed: buttons[i].onPressed,
                              child: Text(
                                buttons[i].title,
                                style: TextStyle(color: buttons[i].color),
                              ),
                            ),

                            // Divider between buttons
                            // unless it's the last item
                            Visibility(
                                visible: i != (buttons.length - 1),
                                child: const Divider()),
                          ],
                        )
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}

class DialogButton {
  final String title;
  final Function() onPressed;
  final Color? color;

  DialogButton({
    required this.title,
    this.color,
    required this.onPressed,
  });
}
