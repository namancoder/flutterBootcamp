import 'package:flutter/material.dart';
class CustomDailog extends StatelessWidget {
  final title;
  final content;
  final VoidCallback callback;
  final actionText;

  CustomDailog(this.title,this.content,this.callback,[this.actionText="reset"]);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        FlatButton(onPressed: callback, child: Text(actionText))
      ],
    );
  }
}