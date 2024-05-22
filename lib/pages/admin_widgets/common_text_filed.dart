import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonTextFiled extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;

  CommonTextFiled({this.controller, this.hintText = ''});

  @override
  Widget build(BuildContext context) {
    return (TextField(
      controller: controller!,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 12,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        fillColor: Color(0xff262657),
        filled: true,
        hintStyle: TextStyle(
          fontSize: 10,
        ),
      ),
    ));
  }
}
