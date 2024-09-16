// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Calcbutton extends StatelessWidget {
  String label = "";
  Function onClick;
  Calcbutton({Key? key, required this.label, required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(
                label == "=" ? Colors.red : Colors.greenAccent),
            shape: WidgetStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
                side: BorderSide(width: 1, color: Colors.white)))),
        child: Text(
          label,
          style: TextStyle(fontSize: 30, color: Colors.black),
        ),
        onPressed: () {
          onClick(label);
        },
      ),
    );
  }
}
