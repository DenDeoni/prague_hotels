import 'dart:convert';
import 'dart:developer';

import 'package:intl/intl.dart';
import 'package:json_to_model/utils/extensions.dart';
import 'package:prague_hotels/bloc/hotel_list/hotel_list_event.dart';
import 'package:prague_hotels/bloc/hotel_list/hotel_list_state.dart';
import 'package:prague_hotels/models/index.dart';
import 'package:prague_hotels/models/property_list.dart';
import 'package:prague_hotels/network/api_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prague_hotels/utils/constants.dart';

class HotelListBloc extends Bloc<HotelListEvent, HotelListState> {
  int guests = 1;
  late String checkInDate = _getCurrentDate();
  String checkOutDate = '';
  String sort = priceLowToHigh;
  int maxPrice = 0;
  int minPrice = 0;

  String _getCurrentDate() {
    DateTime now = DateTime.now();
    var formatter = DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(now);
    return formattedDate;
  }

  Future<List<PropertyModel>> _getHotelList() async {
    Map<String, dynamic> response = await ApiProvider().request(
      queryParams: QueryParamsModel(
        regionId: "2872",
        checkInDate: checkInDate,
        checkOutDate: checkOutDate,
        guests: guests,
        resultsStartingIndex: 0,
        sort: sort,
        price: PriceModel(max: maxPrice, min: minPrice),
      ),
    );
    List<PropertyModel> listProp = PropertyListModel.fromJson(response['data']['propertySearch']).properties;
    return listProp;
  }

  HotelListBloc() : super(HotelListInitState()) {
    on<HotelListLoadEvent>(_onLoaded);
  }

  void _onLoaded(event, emit) async {
    emit(HotelListLoadingState());
    List<PropertyModel> data = await _getHotelList();
    emit(HotelListLoadedState(hotelList: data));
  }
}
