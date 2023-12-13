import 'package:flutter/material.dart';
import 'package:modern_dialog/dialogs/vertical.dart';
import 'package:modern_dialog/modern_dialog.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Theme
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),

        //Home
        home: const HomePage()
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Modern Dialog"),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            ////////////////////////////////////////////////////////////////////
            // open Standard Dialog
            ElevatedButton(
                onPressed: (){

                  /// Standard Dialog
                  /// normal dialog
                  ModernDialog.showStandard(
                    context,
                    title: "Title",
                    content: const Text("description"),
                    buttonTitle: "Save",
                    onAccept: () => print("do sometime"),
                  );

                },
                child: const Text("Standard Dialog")
            ),
            ////////////////////////////////////////////////////////////////////

            const SizedBox(height: 24,),

            ////////////////////////////////////////////////////////////////////
            // open Info Dialog
            ElevatedButton(
                onPressed: (){

                  /// Info Dialog
                  /// with one agreement button
                  ModernDialog.showInfo(
                    context,
                    content: const Text("You need to know this!"),

                  );

                },
                child: const Text("Info Dialog",)
            ),
            ////////////////////////////////////////////////////////////////////

            const SizedBox(height: 24,),

            ////////////////////////////////////////////////////////////////////
            // open TrailingAction Dialog
            ElevatedButton(
                onPressed: (){

                  /// Trailing Action Dialog
                  /// dialog with two action buttons (main, trailing)
                  ModernDialog.showTrailingAction(
                    context,
                    content: const Text("This a dialog showing a trailing action button"),
                    buttonTitle: 'Save',
                    onAccept: () => print("do sometime"),

                    trailingButtonTitle: "Open Settings",
                    onTrailingPressed: () => print("do sometime"),

                  );

                },
                child: const Text("Trailing Action Dialog")
            ),
            ////////////////////////////////////////////////////////////////////

            const SizedBox(height: 24,),

            ////////////////////////////////////////////////////////////////////
            // open Custom Dialog
            ElevatedButton(
                onPressed: (){

                  /// Vertical Dialog
                  /// dialog with vertical buttons
                  ModernDialog.showVerticalDialog(
                    context,
                    content: const Text("Here you can add buttons horizontally"),
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


                },
                child: const Text("Vertical Dialog")
            ),
            ////////////////////////////////////////////////////////////////////

            const SizedBox(height: 24,),

            ////////////////////////////////////////////////////////////////////
            // open Custom Dialog
            ElevatedButton(
                onPressed: (){

                  /// Custom Dialog
                  ModernDialog.showCustom(
                    context,
                    //replace with your custom widget
                    view: const Text("Add any view you would like"),
                  );

                },
                child: const Text("Custom Dialog")
            ),
            ////////////////////////////////////////////////////////////////////
          ],
        ),
      ),

    );
  }
}