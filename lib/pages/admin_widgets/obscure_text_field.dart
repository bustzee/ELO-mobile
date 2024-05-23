import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ObscureTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;

  ObscureTextField({
    this.controller,
    this.hintText = '',
  });

  @override
  _ObscureTextFieldState createState() => _ObscureTextFieldState();
}

class _ObscureTextFieldState extends State<ObscureTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: _obscureText,
      controller: widget.controller,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 12,
      ),
      decoration: InputDecoration(
        hintText: widget.hintText,
        contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        fillColor: Color(0xff262657),
        filled: true,
        hintStyle: TextStyle(
          fontSize: 10,
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
          child: IconButton(
            icon: Icon(
              _obscureText ? Icons.visibility : Icons.visibility_off,
              color: Colors.grey.shade800,
            ),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
          ),
        ),
      ),
    );
  }
}
