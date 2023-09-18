import 'package:flutter/material.dart';
import 'package:prague_hotels/bloc/hotel_list/hotel_list_bloc.dart';
import 'package:prague_hotels/bloc/hotel_list/hotel_list_state.dart';
import 'package:prague_hotels/widgets/hotel_list_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prague_hotels/widgets/search_form_widget.dart';

class HotelListPage extends StatelessWidget {
  const HotelListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => HotelListBloc(),
        child: BlocBuilder<HotelListBloc, HotelListState>(
          builder: (context, state) {
            final HotelListBloc hotelListBloc = BlocProvider.of<HotelListBloc>(context);
            return Scrollbar(
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverAppBar(
                    floating: true,
                    collapsedHeight: 400,
                    expandedHeight: 230,
                    backgroundColor: Colors.yellow[50],
                    flexibleSpace: Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 30, right: 20),
                      // SEARCH WIDGET
                      child: SearchFormWidget(hotelListBloc: hotelListBloc, state: state),
                    ),
                  ),
                  // RESULT WIDGET
                  HotelListWidget(
                    state: state,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
