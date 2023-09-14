import 'package:flutter/material.dart';

class TextMessageWidget extends StatelessWidget {
  final String textMessage;

  const TextMessageWidget({super.key, required this.textMessage});

  @override
  Widget build(BuildContext context) {
    return Text(textMessage);
  }
}
