import 'package:prague_hotels/models/property_model.dart';

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
