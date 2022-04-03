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

Future<bool> confirm(title, body,
    {cancelButtonText = "CANCEL",
    okButtonText = "OK",
    required BuildContext context}) async {
  return (await showDialog<bool>(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              title: title == null ? null : Text(title),
              content: body != null
                  ? SingleChildScrollView(
                      child: Text(body),
                    )
                  : null,
              actions: <Widget>[
                FlatButton(
                  child: Text(cancelButtonText ?? "CANCEL"),
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                ),
                FlatButton(
                  child: Text(okButtonText ?? "OK"),
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                ),
              ],
            );
          })) ??
      false;
}
