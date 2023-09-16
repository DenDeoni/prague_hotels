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
    print('INIT STATE');
    on<HotelDetailLoadEvent>(_onLoaded);
  }

  void _onLoaded(event, emit) async {
    emit(HotelDetailLoadingState());
    print('LOADING DETAILS');
    DetailDataModel data = await _getDetail();
    print('INFO: ${data.propertyContentSectionGroups.aboutThisProperty.sections[0].bodySubSections?[0]
        .elements?[0].header?.text}');
    emit(HotelDetailLoadedState(hotelDetail: data));
  }

  Future<DetailDataModel> _getDetail() async {
    print('GET DETAILS');
    final SharedPreferences prefs = await _prefs;
    Map<String, dynamic> response = await ApiProvider().request(
      queryParams: {"propertyId": prefs.getString(hotelId)},
      endPoint: detailEndPoint,
    );
    //log('DETAIL: ${response['data']['propertyInfo']}');
    final detail = DetailDataModel.fromJson(response['data']['propertyInfo']);
    return detail;
  }
}
