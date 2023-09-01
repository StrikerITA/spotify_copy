// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';

class CustomAlertDialog extends StatefulWidget {
  String title;
  String? content;
  List<Widget> actions;

  CustomAlertDialog({
    required this.title,
    this.content = '',
    required this.actions,
    Key? key,
  }) : super(key: key);

  _CustomAlertDialogState createState() => _CustomAlertDialogState();
}

class _CustomAlertDialogState extends State<CustomAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(widget.title),
      content: Text(widget.content ?? ""),
      //azioni del bottone
      actions: widget.actions,
    );
  }
}
