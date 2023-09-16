import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:prague_hotels/bloc/hotel_detail/hotel_detail_state.dart';
import 'package:prague_hotels/widgets/text_message_widget.dart';

class HotelDetailWidget extends StatelessWidget {
  final HotelDetailState state;

  const HotelDetailWidget({required this.state, Key? key}) : super(key: key);

  Widget _resultWidget(HotelDetailState state) {
    print('RESULT WIDGET');
    final Widget widget = switch (state) {
      HotelDetailLoadingState() => _indicator(),
      HotelDetailLoadedState() => _detailPageWidget(state),
      HotelDetailErrorState() => TextMessageWidget(textMessage: state.errorMessage),
    };
    return widget;
  }

  Widget _indicator() {
    print('INDICATOR');
    return const Scaffold(
      body: LinearProgressIndicator(),
    );
  }

  Widget _detailPageWidget(HotelDetailLoadedState state) {
    print('DETAILS');
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
          state.hotelDetail.propertyContentSectionGroups.aboutThisProperty.sections[0].bodySubSections?[0].elements?[0]
                  .header!.text ??
              'Empty Name',
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),
      body: HotelDetailWidget(state: state),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _resultWidget(state);
  }
}
