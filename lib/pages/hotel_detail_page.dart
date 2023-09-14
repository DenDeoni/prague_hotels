import 'package:flutter/material.dart';
import 'package:prague_hotels/models/index.dart';

class HotelDetailPage extends StatelessWidget {
  final PropertyModel content;

  const HotelDetailPage({required this.content, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(content.name ?? 'Name of Hotel')),
    );
  }
}
