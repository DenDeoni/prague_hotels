import 'package:prague_hotels/bloc/hotel_list/hotel_list_event.dart';
import 'package:prague_hotels/bloc/hotel_list/hotel_list_state.dart';
import 'package:prague_hotels/models/index.dart';
import 'package:prague_hotels/network/api_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prague_hotels/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HotelListBloc extends Bloc<HotelListEvent, HotelListState> {
  late int guests = 1;
  late int maxPrice = 300;
  late int minPrice = 100;
  final String _sort = priceLowToHigh; // ToDo replace it from UI radio button choicer
  late final CheckDateModel _checkInDate = // ToDo replace it from UI date picker
      CheckDateModel(day: DateTime.now().day, month: DateTime.now().month, year: DateTime.now().year);
  late final CheckDateModel _checkOutDate = // ToDo replace it from UI date picker
      CheckDateModel(day: DateTime.now().day + 3, month: DateTime.now().month, year: DateTime.now().year);

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  var params = (guests: 1, minPrice: 100, maxPrice: 300);

  Future<ParamsModel> setParamsFromPrefs() async {
    // ToDo add other parameters
    final SharedPreferences prefs = await _prefs;
    guests = prefs.getInt(guestsCountPrefs) ?? 2;
    maxPrice = prefs.getInt(maxPricePrefs) ?? 300;
    minPrice = prefs.getInt(minPricePrefs) ?? 100;
    return ParamsModel(guests: guests.toString(), maxPrice: maxPrice.toString(), minPrice: minPrice.toString());
  }

  void _saveParamsToPrefs() async {
    // ToDo add other parameters
    final SharedPreferences prefs = await _prefs;
    prefs.setInt(guestsCountPrefs, guests);
    prefs.setInt(maxPricePrefs, maxPrice);
    prefs.setInt(minPricePrefs, minPrice);
  }

  HotelListBloc() : super(HotelListInitState()) {
    on<HotelListLoadEvent>(_onLoaded);
  }

  void _onLoaded(event, emit) async {
    _saveParamsToPrefs();
    emit(HotelListLoadingState());
    List<PropertyModel> data = await _getHotelList();
    emit(HotelListLoadedState(hotelList: data));
  }

  Future<List<PropertyModel>> _getHotelList() async {
    Map<String, dynamic> response = await ApiProvider().request(
      queryParams: QueryParamsModel(
        destination: const DestinationModel(regionId: '2872'),
        checkInDate: _checkInDate,
        checkOutDate: _checkOutDate,
        rooms: [RoomsModel(adults: guests)],
        sort: _sort,
        filters: PriceQueryModel(price: PriceModel(max: maxPrice, min: minPrice)),
      ).toJson(),
      endPoint: listEndPoint,
    );
    List<PropertyModel> listProp = PropertyListModel.fromJson(response['data']['propertySearch']).properties;
    return listProp;
  }
}
