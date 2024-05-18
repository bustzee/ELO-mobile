import 'package:flutter/material.dart';

class CreateStreamPage extends StatefulWidget {
  const CreateStreamPage({super.key});
  static String id = '/CreateStreamPage';

  @override
  State<CreateStreamPage> createState() => CreateStreamPageState();
}

class CreateStreamPageState extends State<CreateStreamPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff160E42),
        body: Text('AMIT'),
    );
  }
}