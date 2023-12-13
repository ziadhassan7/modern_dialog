Modern custom dialog with simple implementation. Adaptive for Android, IOS, and all platforms.

<p align="center">
    <img width="300" src="https://github.com/ziadhassan7/modern_dialog/assets/31738365/80f39871-b046-4a25-bdba-e78c4c80013b">
  .
  .
  .
    <img width="300" src="https://github.com/ziadhassan7/modern_dialog/assets/31738365/c9a7468e-0632-435c-8b4b-1753f73e5102">
</p>


## 🎯 Features
* Simple implementation
* Adaptive for Android & IOS
* Various ready-to-use layouts
* Full customization


## 📦 Usage
# Standard Dialog

<p align="center">
    <img width="700" src="https://github.com/ziadhassan7/modern_dialog/assets/31738365/eda5fd1e-5bb2-4791-86e2-914b810960c8">
</p>

```dart
ModernDialog.showStandard(
    context,
    title: "Title",
    content: const Text("description"),
    buttonTitle: "Save",
    onAccept: () => print("do sometime"),
);
```

<details>

<summary>More Customization</summary>

```dart
    // Show small icon indicator at the top
    icon: const Icon(Icons.phone_android),
    // Custom main button color
    mainButtonColor: Colors.blue,
    // Custom discard button color
    cancelButtonColor: Colors.red,
    // Do something when you discard the dialog
    onCancel: (){},
    // Change the default cancel button title
    cancelButtonTitle: "",
    // Change the background color of dialog (Only Android)
    backgroundColor: Colors.orange,
    // Disable the default tint color of material design 3 (Only Android). 
    disableTintColor: true,
    // Close dialog on main button by default
    shouldCloseOnMainButton: true
```

</details>


# Info Dialog

<p align="center">
    <img width="700" src="https://github.com/ziadhassan7/modern_dialog/assets/31738365/a4da96c9-720c-4113-bf74-aad532c57cdb">
</p>


```dart
ModernDialog.showInfo(
    context,
    content: const Text("You need to know this!"),
);
```

<details>

<summary>More Customization</summary>

```dart
    // Add a title
    title: "Title",
    // Custom main button title
    buttonTitle: "Save",
    // Custom main button color
    mainButtonColor: Colors.red,
    // Change background color (Only in Android)
    backgroundColor: Colors.grey,
    // Disable the default tint color (Only in Android)
    disableTintColor: true,
```

</details>

# Trailing Action Dialog
Use this when you need a dialog with two important action buttons

<p align="center">
    <img width="700" src="https://github.com/ziadhassan7/modern_dialog/assets/31738365/65a94f45-6091-4d60-b83c-d475e3c1ae49">
</p>

```dart
ModernDialog.showTrailingAction(
    context,
    content: const Text("This a dialog showing a trailing action button"),
    buttonTitle: 'Save',
    onAccept: () => print("do sometime"),
  
    trailingButtonTitle: "Open Settings",
    onTrailingPressed: () => print("do sometime"),
);
```

<details>

<summary>More Customization</summary>

```dart
    // Add a title
    title: "Title",
    // Custom main button color
    mainButtonColor: Colors.red,
    // Custom trailing button color
    trailingButtonColor: Colors.red,
    // Change background color (Only in Android)
    backgroundColor: Colors.grey,
    // Disable the default tint color (Only in Android)
    disableTintColor: true,
```

</details>


# Vertical Dialog
Dialog with buttons aligned vertically.
Here you can add a button by using the `DialogButton` class made for you.

<p align="center">
    <img width="700" src="https://github.com/ziadhassan7/modern_dialog/assets/31738365/d3efdf9b-8019-4128-a4a8-d7a328e87ff3">
</p>


```dart
ModernDialog.showVerticalDialog(
    context,
    content: const Text("description"),

    // your custom buttons
    buttons: [
      DialogButton(
        title: "Discard",
        onPressed: () => print("do sometime"),
        color: Colors.red,
      ),
    
      DialogButton(
        title: "Allow all changes",
        onPressed: () => print("do sometime"),
      ),
    ],
);
```

<details>

<summary>More Customization</summary>

```dart
    // Add an icon
    icon: const Icon(Icons.ac_unit),
    // Add a title
    title: "Title",
    // Change background color (Only in Android)
    backgroundColor: Colors.grey,
    // Disable the default tint color (Only in Android)
    disableTintColor: true,
```

</details>



# Custom Dialog

<p align="center">
    <img width="700" src="https://github.com/ziadhassan7/modern_dialog/assets/31738365/b6334a46-129c-48ac-993c-9ae91c1c7b10">
</p>


```dart
ModernDialog.showCustom(
    context,
    //replace with your custom widget
    view: const Text("Add any view you would like"),
);
```

<details>

<summary>More Customization</summary>

```dart
    // Change background color (Only in Android)
    backgroundColor: Colors.grey,
    // Disable the default tint color (Only in Android)
    disableTintColor: true,
```

</details>


## 🎯Parameters

| Name | Description | Data type | Default value | 
|:------------|-----------------------------------------|----------|-----------|
| icon | icon showing at the top center | Widget | - |
| title | Dialog's title | String | - | 
| content | Widget showing the dialog's content | Widget | - | 
| buttonTitle | Function that let you build the group separator widget | String | - | 
| onAccept | Function to handle main button click | Function() | - | 
| onCancel | Perform an action on closing the dialog | Function() | - | 
| cancelButtonTitle | Cancel button title | String | "Cancel" |
| cancelButtonColor | Cancel button color | Color | - |
| mainButtonColor | Main button color | Color | ColorScheme.primary |
| shouldCloseOnMainButton | Close the dialog when pressing the main button. | bool | true |
| backgroundColor | Dialog's background color. (Only Android) | Color | white | 
| disableTintColor | Disables the color tint applied on the background color. (Only Android) | bool | false |

**Vertical Dialog**
| Name | Description | Data type | Default value | 
|:------------|-----------------------------------------|----------|-----------|
| buttons | Custom button for the vertical dialog. | List<DialogButton> | - |

**Trailing Dialog**
| Name | Description | Data type | Default value | 
|:------------|-----------------------------------------|----------|-----------|
| trailingButtonTitle | Text for the trailing button. (secondary button) | String | - | 
| onTrailingPressed | Handle trailing button press. | Function() | - |
| trailingButtonColor | Custom trailing button color. | Color | - |

**Custom Dialog**
| Name | Description | Data type | Default value | 
|:------------|-----------------------------------------|----------|-----------|
| view | Widget for the the Custom Dialog | Widget | - | 
 
