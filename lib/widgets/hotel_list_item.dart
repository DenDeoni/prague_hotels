import 'package:flutter/material.dart';
import 'package:prague_hotels/@core/routing.dart';

class HotelListItem extends StatelessWidget {
  final content;
  const HotelListItem({this.content, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Routing().navigateToHotelDetail(context, content);
      },
      child: Container(
        child: ListTile(
          title: Text(content.name),
        ),
      ),
    );
  }
}
