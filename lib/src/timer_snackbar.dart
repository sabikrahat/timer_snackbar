import 'dart:async';

import 'package:flutter/material.dart';

timerSnackbar({
  required BuildContext context,

  /// Main body message
  required String contentText,

  /// action button prefix child
  Widget? buttonPrefixWidget,

  /// button label
  String buttonLabel = 'Undo',

  /// This method will execute after time finish. The default time is 4 seconds.
  required void Function() afterTimeExecute,

  /// default time set 4 seconds.
  int second = 4,

  /// default backgorund color [Colors.grey[850]]
  Color? backgroundColor,

  /// default TextStyle is none.
  TextStyle? contentTextStyle,
}) {
  bool isExecute = true;
  final snackbar = SnackBar(
    content: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          constraints: const BoxConstraints(maxHeight: 22.0),
          child: TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: second * 1000.toDouble()),
            duration: Duration(seconds: second),
            builder: (context, double value, child) {
              return Stack(
                fit: StackFit.loose,
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: 20.0,
                    width: 20.0,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.0,
                      value: value / (second * 1000),
                      color: Colors.grey[850],
                      backgroundColor: Colors.white,
                    ),
                  ),
                  Center(
                    child: Text(
                      (second - (value / 1000)).toInt().toString(),
                      textScaleFactor: 0.85,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        const SizedBox(width: 12.0),
        Expanded(
            child: Text(contentText,
                style: contentTextStyle ?? const TextStyle())),
        InkWell(
          splashColor: Colors.white,
          onTap: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            isExecute = !isExecute;
            return;
          },
          child: Container(
            color: Colors.grey[850],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (buttonPrefixWidget != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: buttonPrefixWidget,
                  ),
                Text(
                  buttonLabel,
                  style: TextStyle(color: Colors.blue[100]),
                  textScaleFactor: 1.1,
                ),
              ],
            ),
          ),
        ),
      ],
    ),
    backgroundColor: backgroundColor ?? Colors.grey[850],
    duration: Duration(seconds: second),
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.all(6.0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4.0),
    ),
  );

  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(snackbar);

  Timer(Duration(seconds: second), () {
    if (isExecute) afterTimeExecute();
  });
}
