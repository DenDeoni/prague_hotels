
import 'package:prague_hotels/models/detail_data_model.dart';

sealed class HotelDetailState {}

final class HotelDetailLoadingState extends HotelDetailState {}

final class HotelDetailLoadedState extends HotelDetailState {
  final DetailDataModel hotelDetail;
  HotelDetailLoadedState({required this.hotelDetail});
}

final class HotelDetailErrorState extends HotelDetailState {
  final String errorMessage;

  HotelDetailErrorState({required this.errorMessage});
}
