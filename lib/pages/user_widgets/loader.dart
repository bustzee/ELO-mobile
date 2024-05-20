import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: LoadingAnimationWidget.flickr(
        leftDotColor: const Color(0xFF322B59),
        rightDotColor: const Color.fromARGB(255, 101, 84, 255),
        size: 80,
      ),
    );
  }
}
