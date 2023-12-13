library modern_dialog;

import 'package:flutter/material.dart';
import 'dialogs/info.dart';
import 'dialogs/trailling_action.dart';
import 'dialogs/vertical.dart';
import 'dialogs/custom.dart';
import 'dialogs/standard.dart';

class ModernDialog {
  /// Dialog icon showing at the top center
  Widget? icon;

  /// Dialog's Title
  String? title;

  /// Widget showing the dialog's content
  Widget content;

  /// Main button title
  String? buttonTitle;

  /// Function to handle main button click
  Function()? onAccept;

  /// Perform an action on closing the dialog
  Function()? onCancel;

  /// Main button color
  Color? mainButtonColor;

  /// Cancel button color
  Color? cancelButtonColor;

  /// Cancel button title
  String? cancelButtonTitle;

  /// Close the dialog when pressing the main button. true by default
  bool? shouldCloseOnMainButton;

  /// Dialog background color
  Color? backgroundColor;

  /// Disables the color tint applied on the background color. false by default.
  /// (only in material design 3)
  bool? disableTintColor;

  /// Text for the trailing button (secondary button)
  String? trailingButtonTitle;

  /// Function when the trailing button is pressed (secondary button)
  Function()? onTrailingPressed;

  /// Custom trailing button color
  Color? trailingButtonColor;

  /// Standard Dialog
  /// ---------------
  /// two buttons
  /// mainButton , cancelButton
  ModernDialog.showStandard(
    BuildContext context, {
    this.icon,
    this.title,
    required this.content,
    required this.buttonTitle,
    required this.onAccept,
    this.onCancel,
    this.mainButtonColor,
    this.cancelButtonColor,
    this.cancelButtonTitle = "Cancel",
    this.shouldCloseOnMainButton = true,
    this.backgroundColor = Colors.white,
    this.disableTintColor = false,
  }) {
    StandardDialog.show(context,
        icon: icon,
        title: title,
        content: content,
        buttonTitle: buttonTitle!,
        onAccept: onAccept!,
        onCancel: onCancel,
        buttonColor: mainButtonColor,
        cancelButtonColor: cancelButtonColor,
        cancelButtonTitle: cancelButtonTitle!,
        shouldCloseOnMainButton: shouldCloseOnMainButton!,
        backgroundColor: backgroundColor!,
        disableTintColor: disableTintColor!);
  }

  /// Info Dialog
  /// ---------------
  /// one buttons
  /// accept
  ModernDialog.showInfo(
    BuildContext context, {
    this.title,
    required this.content,
    this.buttonTitle = "Ok",
    this.mainButtonColor,
    this.backgroundColor = Colors.white,
    this.disableTintColor = false,
  }) {
    InfoDialog.show(context,
        title: title,
        content: content,
        buttonTitle: buttonTitle!,
        buttonColor: mainButtonColor,
        backgroundColor: backgroundColor!,
        disableTintColor: disableTintColor!);
  }

  /// Two Action Dialog
  /// ---------------
  /// put any view you would like in a dialog
  ModernDialog.showTrailingAction(
    BuildContext context, {
    this.title,
    required this.content,
    required this.buttonTitle,
    required this.onAccept,
    this.trailingButtonTitle,
    this.onTrailingPressed,
    this.trailingButtonColor,
    this.mainButtonColor,
    this.backgroundColor = Colors.white,
    this.disableTintColor = false,
  }) {
    TrailingActionDialog.show(
      context,
      title: title,
      content: content,
      buttonTitle: buttonTitle!,
      onAccept: onAccept,
      trailingButtonTitle: trailingButtonTitle!,
      onTrailingPressed: onTrailingPressed!,
      trailingButtonColor: trailingButtonColor,
      buttonColor: mainButtonColor,
      backgroundColor: backgroundColor!,
      disableTintColor: disableTintColor!,
    );
  }

  /// Vertical Dialog
  /// ---------------
  /// put any view you would like in a dialog
  ModernDialog.showVerticalDialog(
    BuildContext context, {
    this.icon,
    this.title,
    required this.content,
    required List<DialogButton> buttons,
    this.backgroundColor = Colors.white,
    this.disableTintColor = false,
  }) {
    VerticalDialog.show(
      context,
      icon: icon,
      title: title,
      content: content,
      buttons: buttons,
      backgroundColor: backgroundColor!,
      disableTintColor: disableTintColor!,
    );
  }

  /// Custom Dialog
  /// ---------------
  /// put any view you would like in a dialog
  static showCustom(
    BuildContext context, {
    required Widget view,
    Color dialogBackgroundColor = Colors.white,
    bool disableTintColor = false,
  }) {
    CustomDialog.show(
      context,
      view: view,
      backgroundColor: dialogBackgroundColor,
      disableTintColor: disableTintColor,
    );
  }
}
