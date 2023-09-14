import 'package:flutter/material.dart';
import 'package:prague_hotels/models/hotel_detail_model.dart';

class HotelDetailPage extends StatelessWidget {
  final HotelDetailModel content;
  const HotelDetailPage({required this.content, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(content.name);
  }
}
