import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

Future showCustomDialog({
  required String title,
  required List<Widget> children,
}) async {
  await showDialog<void>(
    context: globalContext,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              ...children,
            ],
          ),
        ),
        actions: <Widget>[
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueGrey,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Ok'),
          ),
        ],
      );
    },
  );
}

Future showCustomDialogWidget({
  required Widget child,
}) async {
  await showDialog<void>(
    context: globalContext,
    builder: (BuildContext context) {
      return Material(
        color: Colors.transparent,
        child: Stack(
          children: [
            InkWell(
              onTap: () => Get.back(),
              child: Container(
                padding: const EdgeInsets.all(40.0),
                color: Colors.black.withOpacity(0.2),
              ),
            ),
            Center(
              child: Container(
                child: child,
                constraints: BoxConstraints(
                  maxWidth: 860,
                  maxHeight: MediaQuery.of(context).size.height * 0.9,
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
