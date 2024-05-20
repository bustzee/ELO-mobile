import 'package:flutter/material.dart';

class CommonBtn extends StatelessWidget {
  final String? btnName;
  final Color? backgroundColor;
  final VoidCallback? callback;

  CommonBtn(
      {required this.btnName,
      this.backgroundColor = Colors.green,
      this.callback});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(backgroundColor!),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          minimumSize: MaterialStateProperty.all(Size.fromHeight(50)),
          padding: MaterialStateProperty.all(EdgeInsets.all(0)),
          elevation: MaterialStateProperty.all(20),
          overlayColor: MaterialStateProperty.all(Colors.blue.shade900),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ))),
      onPressed: () {
        callback!();
      },
      child: Text(
        btnName!,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
