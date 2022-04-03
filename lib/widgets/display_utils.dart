import 'package:flutter/material.dart';

Future<Null> alert(title, body,
    {onOk,
    okButtonText = "OK",
    barrierDismissible: true,
    contentPadding = const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 0.0),
    required BuildContext context}) async {
  return showDialog<Null>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) {
        return AlertDialog(
          title: title == null ? title : Text(title),
          content: body == null
              ? body
              : Container(
                  child: Text(body),
                ),
          contentPadding: contentPadding,
          actions: <Widget>[
            FlatButton(
              child: Text("${okButtonText ?? "OK"}"),
              onPressed: () {
                Navigator.of(context).pop();
                if (onOk != null) {
                  onOk();
                }
              },
            ),
          ],
        );
      });
}
