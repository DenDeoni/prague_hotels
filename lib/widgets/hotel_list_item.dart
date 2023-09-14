import 'package:flutter/material.dart';
import 'package:prague_hotels/@core/routing.dart';
import 'package:prague_hotels/models/property_model.dart';

class HotelListItem extends StatelessWidget {
  final PropertyModel content;

  const HotelListItem({required this.content, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Routing().navigateToHotelDetail(context, content);
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        margin: const EdgeInsets.only(top: 15, left: 10, right: 10),
        child: Wrap(
          children: [
            ListTile(
              title: Text(content.name ?? 'Name of Hotel'),
            ),
            Image(
              image: NetworkImage(content.propertyImage!.image!.url),
              fit: BoxFit.fitWidth,
            ),
          ],
        ),
      ),
    );
  }
}
