import 'package:flutter/material.dart';
import 'package:prague_hotels/models/hotel_detail_model.dart';
import 'package:prague_hotels/models/index.dart';
import 'package:prague_hotels/pages/hotel_detail_page.dart';

class Routing {
  static final Routing _instance = Routing._internal();

  factory Routing() {
    return _instance;
  }

  Routing._internal();

  void navigateToHotelDetail(BuildContext context, PropertyModel content) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => HotelDetailPage(
            content: content,
          )),
    );
  }
}