import 'package:prague_hotels/bloc/hotel_list/hotel_list_event.dart';
import 'package:prague_hotels/bloc/hotel_list/hotel_list_state.dart';
import 'package:prague_hotels/models/index.dart';
import 'package:prague_hotels/network/api_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prague_hotels/utils/constants.dart';
import 'package:get_storage/get_storage.dart';

class HotelListBloc extends Bloc<HotelListEvent, HotelListState> {
  final box = GetStorage();
  late int guests = box.read(guestsCountPrefs) ?? 1;
  late int maxPrice = box.read(maxPricePrefs) ?? 300;
  late int minPrice = box.read(minPricePrefs) ?? 100;
  final String _sort = priceLowToHigh; // ToDo replace it from UI radio button choicer
  late final CheckDateModel _checkInDate = // ToDo replace it from UI date picker
      CheckDateModel(day: DateTime.now().day, month: DateTime.now().month, year: DateTime.now().year);
  late final CheckDateModel _checkOutDate = // ToDo replace it from UI date picker
      CheckDateModel(day: DateTime.now().day + 3, month: DateTime.now().month, year: DateTime.now().year);
  var params = (guests: 1, minPrice: 100, maxPrice: 300);

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
        destination: const DestinationModel(regionId: regionId),
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

  void _saveParamsToPrefs() async {
    // ToDo add other parameters
    box.write(guestsCountPrefs, guests);
    box.write(maxPricePrefs, maxPrice);
    box.write(minPricePrefs, minPrice);
  }
}
