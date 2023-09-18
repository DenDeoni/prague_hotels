import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prague_hotels/bloc/hotel_list/hotel_list_bloc.dart';
import 'package:prague_hotels/bloc/hotel_list/hotel_list_event.dart';
import 'package:prague_hotels/bloc/hotel_list/hotel_list_state.dart';
import 'package:prague_hotels/utils/constants.dart';
import 'package:prague_hotels/widgets/divider_widget.dart';

class SearchFormWidget extends StatelessWidget {
  final HotelListBloc hotelListBloc;
  final dynamic state;

  const SearchFormWidget({required this.hotelListBloc, required this.state, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Form(
            key: formKey,
            child: Column(
              children: [
                // GUESTS FIELD
                TextFormField(
                  initialValue: state.preferences.guests,
                  decoration: InputDecoration(
                    labelText: guestsCounter,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return enterGuestsCount;
                    }
                    return null;
                  },
                  onSaved: (value) {
                    hotelListBloc.guests = int.parse(value ?? '1');
                  },
                ),

                divider(),
                // MIN PRICE FIELD
                TextFormField(
                  initialValue: state.preferences.minPrice,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    labelText: minPrice,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onSaved: (value) {
                    hotelListBloc.minPrice = int.parse(value ?? hotelListBloc.maxPrice.toString());
                  },
                ),
                divider(),
                // MAX PRICE FIELD
                TextFormField(
                  initialValue: state.preferences.maxPrice,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    labelText: maxPrice,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onSaved: (value) {
                    hotelListBloc.maxPrice = int.parse(value ?? hotelListBloc.minPrice.toString());
                  },
                ),
                divider(),
                // BUTTON SEARCH HOTELS
                ElevatedButton(
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      hotelListBloc.add(HotelListLoadEvent());
                    }
                  },
                  child: Text(
                    searchHotels.toUpperCase(),
                  ),
                ),
                divider(),
              ],
            ),
          );
  }
}
