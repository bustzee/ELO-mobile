import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleText extends StatelessWidget {
  final String? printtext;

  TitleText({required this.printtext});
  @override
  Widget build(BuildContext context) {
    return (Text(
      printtext!,
      style: GoogleFonts.getFont(
        'Open Sans',
        fontWeight: FontWeight.w600,
        fontSize: 12,
        letterSpacing: -0.4,
        color: const Color.fromARGB(148, 255, 255, 255),
      ),
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    ));
  }
}
