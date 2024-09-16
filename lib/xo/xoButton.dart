import 'package:flutter/material.dart';

class XoButton extends StatelessWidget {
  String label;
  int index;
  Function onClick;
  XoButton(
      {required this.label,
      required this.index,
      required this.onClick,
      super.key});

  @override
  Widget build(BuildContext context) {
    bool isnotcliked = true;
    return Expanded(
        child: ElevatedButton(
      onPressed: () {
          onClick(index);
      }, 
      child: Text(
        label,
        style: TextStyle(
            fontSize: 60, color: Colors.white, fontWeight: FontWeight.w200),
      ),
      style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(Colors.red),
          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
              side: BorderSide(width: 2, color: Colors.white)))),
    ));
  }
}
