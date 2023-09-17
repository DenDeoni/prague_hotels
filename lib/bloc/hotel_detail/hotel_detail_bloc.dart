import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prague_hotels/bloc/hotel_detail/hotel_detail_event.dart';
import 'package:prague_hotels/models/detail_data_model.dart';
import 'package:prague_hotels/network/api_provider.dart';
import 'package:prague_hotels/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'hotel_detail_state.dart';

class HotelDetailBloc extends Bloc<HotelDetailEvent, HotelDetailState> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  HotelDetailBloc() : super(HotelDetailLoadingState()) {
    on<HotelDetailLoadEvent>(_onLoaded);
    add(HotelDetailLoadEvent());
  }

  void _onLoaded(event, emit) async {
    DetailDataModel data = await _getDetail();
    emit(HotelDetailLoadedState(hotelDetail: data));
  }

  Future<DetailDataModel> _getDetail() async {
    final SharedPreferences prefs = await _prefs;
    Map<String, dynamic> response = await ApiProvider().request(
      queryParams: {hotelId: prefs.getString(hotelId)},
      endPoint: detailEndPoint,
    );
    final detail = DetailDataModel.fromJson(response['data']['propertyInfo']);
    return detail;
  }
}