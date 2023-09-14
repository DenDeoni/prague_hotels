import 'package:prague_hotels/widgets/hotel_list_item.dart';
import 'package:prague_hotels/widgets/text_message_widget.dart';
import 'package:flutter/material.dart';
import 'package:prague_hotels/bloc/hotel_list/hotel_list_state.dart';

class ResultWidget extends StatelessWidget {
  final HotelListState state;

  const ResultWidget({super.key, required this.state});

  Widget _resultWidget(HotelListState state) {
    final Widget widget = switch (state) {
      HotelListInitState() => const SliverToBoxAdapter(child: SizedBox.shrink()),
      HotelListLoadingState() => const SliverToBoxAdapter(child: LinearProgressIndicator()),
      HotelListLoadedState() => SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return HotelListItem(
                content: state.hotelList[index],
              );
            },
            childCount: state.hotelList.length,
          ),
        ),
      HotelListErrorState() => SliverToBoxAdapter(child: TextMessageWidget(textMessage: state.errorMessage)),
    };
    return widget;
  }

  @override
  Widget build(BuildContext context) {
    return _resultWidget(state);
  }
}
