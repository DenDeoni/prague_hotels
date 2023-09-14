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
  late CheckDateModel checkInDate =
      CheckDateModel(day: DateTime.now().day, month: DateTime.now().month, year: DateTime.now().year);
  late CheckDateModel checkOutDate =
      CheckDateModel(day: DateTime.now().day + 3, month: DateTime.now().month, year: DateTime.now().year);
  String sort = priceLowToHigh;
  late int maxPrice = 300;
  late int minPrice = 100;

  String _getCurrentDate() {
    DateTime now = DateTime.now();
    var formatter = DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(now);
    return formattedDate;
  }

  Future<List<PropertyModel>> _getHotelList() async {
    Map<String, dynamic> response = await ApiProvider().request(
      queryParams: QueryParamsModel(
        destination: const DestinationModel(regionId: '2872'),
        checkInDate: checkInDate,
        checkOutDate: checkOutDate,
        rooms: [RoomsModel(adults: guests)],
        sort: sort,
        filters: PriceQueryModel(price: PriceModel(max: maxPrice, min: minPrice)),
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
