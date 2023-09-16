import 'package:prague_hotels/bloc/hotel_list/hotel_list_event.dart';
import 'package:prague_hotels/bloc/hotel_list/hotel_list_state.dart';
import 'package:prague_hotels/models/index.dart';
import 'package:prague_hotels/network/api_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prague_hotels/utils/constants.dart';

class HotelListBloc extends Bloc<HotelListEvent, HotelListState> {
  late int guests = 1;
  late int maxPrice;
  late int minPrice;
  final String _sort = priceLowToHigh; // ToDo replace it from UI radio button choicer
  late final CheckDateModel _checkInDate = // ToDo replace it from UI date picker
      CheckDateModel(day: DateTime.now().day, month: DateTime.now().month, year: DateTime.now().year);
  late final CheckDateModel _checkOutDate = // ToDo replace it from UI date picker
      CheckDateModel(day: DateTime.now().day + 3, month: DateTime.now().month, year: DateTime.now().year);

  HotelListBloc() : super(HotelListInitState()) {
    on<HotelListLoadEvent>(_onLoaded);
  }

  void _onLoaded(event, emit) async {
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
