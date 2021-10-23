import 'package:flutter/material.dart';
import 'package:timer_snackbar/timer_snackbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Timer Snackbar',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage());
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Timer Snackbar"),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Show Snackbar', textScaleFactor: 1.2)),
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0))),
          onPressed: () => timerSnackbar(
            context: context,
            contentText: "A snackbar with live timer.",
            buttonPrefixWidget: Image.asset(
              'assets/undo.png',
              width: 17.0,
              height: 15.0,
              alignment: Alignment.topCenter,
              color: Colors.blue[100],
            ),
            afterTimeExecute: () => print("Operation Execute."),
            second: 5,
          ),
        ),
      ),
    );
  }
}
