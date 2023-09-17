import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prague_hotels/bloc/hotel_detail/hotel_detail_bloc.dart';
import 'package:prague_hotels/bloc/hotel_detail/hotel_detail_state.dart';
import 'package:prague_hotels/widgets/hotel_detail_widget.dart';

class HotelDetailPage extends StatelessWidget {
  const HotelDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HotelDetailBloc(),
      child: BlocBuilder<HotelDetailBloc, HotelDetailState>(
        builder: (context, state) {
          return HotelDetailWidget(state: state);
        },
      ),
    );
  }
}
