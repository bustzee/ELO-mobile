import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrintValue extends StatelessWidget {
  final String? printtext;

  PrintValue({required this.printtext});
  @override
  Widget build(BuildContext context) {
    return (Text(
      printtext!,
      style: GoogleFonts.getFont(
        'Open Sans',
        fontWeight: FontWeight.w400,
        fontSize: 14,
        letterSpacing: -0.4,
        color: Colors.white,
      ),
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    ));
  }
}
