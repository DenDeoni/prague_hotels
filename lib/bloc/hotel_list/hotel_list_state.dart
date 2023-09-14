import 'package:prague_hotels/models/hotel_list_item_model.dart';
import 'package:prague_hotels/models/index.dart';

sealed class HotelListState {}

final class HotelListInitState extends HotelListState {}

final class HotelListLoadingState extends HotelListState {}

final class HotelListLoadedState extends HotelListState {
  final List<PropertyModel> hotelList;

  HotelListLoadedState({required this.hotelList});
}

final class HotelListErrorState extends HotelListState {
  final String errorMessage;

  HotelListErrorState({required this.errorMessage});
}
