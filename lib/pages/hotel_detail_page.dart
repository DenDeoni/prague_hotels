import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prague_hotels/bloc/hotel_detail/hotel_detail_bloc.dart';
import 'package:prague_hotels/bloc/hotel_detail/hotel_detail_event.dart';
import 'package:prague_hotels/bloc/hotel_detail/hotel_detail_state.dart';
import 'package:prague_hotels/models/property_model.dart';
import 'package:prague_hotels/utils/constants.dart';
import 'package:prague_hotels/widgets/hotel_detail_widget.dart';

class HotelDetailPage extends StatelessWidget {
  const HotelDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final HotelDetailBloc hotelDetailBloc = context.read<HotelDetailBloc>();
    return BlocProvider(
      create: (context) => HotelDetailBloc(),
      child: BlocBuilder<HotelDetailBloc, HotelDetailState>(
        builder: (context, state) {
          hotelDetailBloc.add(HotelDetailLoadEvent());
          return HotelDetailWidget(state: state);
        },
      ),
    );
  }
}
