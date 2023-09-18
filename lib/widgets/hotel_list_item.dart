import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:prague_hotels/@core/routing.dart';
import 'package:prague_hotels/models/property_model.dart';
import 'package:prague_hotels/utils/constants.dart';

class HotelListItem extends StatelessWidget {
  final PropertyModel? content;

  final box = GetStorage();

  HotelListItem({required this.content, Key? key}) : super(key: key);

  _saveIdToPrefs() {
    box.write(hotelId, content?.id!);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _saveIdToPrefs();
        Routing().navigateToHotelDetail(context);
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        margin: const EdgeInsets.only(top: 15, left: 10, right: 10),
        child: Wrap(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                        content?.name ?? 'Name of Hotel',
                        style: const TextStyle(fontSize: 22),
                      )),
                      Text(content?.price?.displayMessages?[1].lineItems?[0].value ?? ''),
                    ],
                  ),
                  Text(content?.neighborhood?.name ?? '')
                ],
              ),
            ),
            Image(
              image: content != null
                  ? CachedNetworkImageProvider(content!.propertyImage!.image!.url ?? '')
                  : const CachedNetworkImageProvider(
                      'https://static.vecteezy.com/system/resources/thumbnails/022/059/000/small/no-image-available-icon-vector.jpg'),
              fit: BoxFit.fitWidth,
            ),
          ],
        ),
      ),
    );
  }
}
