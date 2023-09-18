import 'package:flutter/material.dart';

class TextMessageWidget extends StatelessWidget {
  final String textMessage;

  const TextMessageWidget({super.key, required this.textMessage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Text(textMessage),
    );
  }
}
