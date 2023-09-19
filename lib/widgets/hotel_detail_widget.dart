import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:prague_hotels/bloc/hotel_detail/hotel_detail_state.dart';
import 'package:prague_hotels/utils/constants.dart';
import 'package:prague_hotels/widgets/text_message_widget.dart';

class HotelDetailWidget extends StatelessWidget {
  final HotelDetailState state;

  const HotelDetailWidget({required this.state, Key? key}) : super(key: key);

  Widget _resultWidget(HotelDetailState state) {
    final Widget widget = switch (state) {
      HotelDetailLoadingState() => _indicator(),
      HotelDetailLoadedState() => _detailPageWidget(state),
      HotelDetailErrorState() => TextMessageWidget(textMessage: state.errorMessage),
    };
    return widget;
  }

  Widget _indicator() {
    return const Scaffold(
      body: LinearProgressIndicator(),
    );
  }

  Widget _detailPageWidget(HotelDetailLoadedState state) {
    String? title = state.hotelDetail.propertyContentSectionGroups?.aboutThisProperty.sections[0].bodySubSections?[0]
            .elements?[0].header?.text ??
        'No Name';
    return Scaffold(
      appBar: AppBar(
        leading: Platform.isIOS
            ? const Icon(
                Icons.arrow_back_ios_sharp,
                color: Colors.white,
              )
            : null,
        automaticallyImplyLeading: false,
        title: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),
      body: _hotelInfo(state),
    );
  }

  Widget _hotelInfo(HotelDetailLoadedState content) {
    String? imageURL = content.hotelDetail.propertyGallery?.images?[0].image?.url ?? '';
    String? description = content.hotelDetail.propertyContentSectionGroups?.aboutThisProperty.sections[0]
            .bodySubSections?[0].elements?[0].items?[0].content?.text ??
        noHotelDescription;
    return Scrollbar(
      child: SingleChildScrollView(
        child: Wrap(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  content.hotelDetail.propertyGallery?.images?[0].image != null
                      ? Image(
                          image: CachedNetworkImageProvider(imageURL),
                          fit: BoxFit.fitWidth,
                        )
                      : const Center(
                          child: Icon(
                            size: 50,
                            Icons.image_not_supported_outlined,
                          ),
                        ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      description,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _resultWidget(state);
  }
}
