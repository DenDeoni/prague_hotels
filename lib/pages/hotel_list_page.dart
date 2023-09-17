import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prague_hotels/bloc/hotel_list/hotel_list_bloc.dart';
import 'package:prague_hotels/bloc/hotel_list/hotel_list_event.dart';
import 'package:prague_hotels/bloc/hotel_list/hotel_list_state.dart';
import 'package:prague_hotels/models/index.dart';
import 'package:prague_hotels/utils/constants.dart';
import 'package:prague_hotels/widgets/divider_widget.dart';
import 'package:prague_hotels/widgets/hotel_list_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HotelListPage extends StatelessWidget {
  HotelListPage({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => HotelListBloc(),
        child: BlocBuilder<HotelListBloc, HotelListState>(
          builder: (context, state) {
            final HotelListBloc hotelListBloc = BlocProvider.of<HotelListBloc>(context);
            return Scrollbar(
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverAppBar(
                    floating: true,
                    collapsedHeight: 370,
                    expandedHeight: 200,
                    backgroundColor: Colors.yellow[50],
                    flexibleSpace: Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 30, right: 20),
                      child: FutureBuilder(
                        future: hotelListBloc.setParamsFromPrefs(),
                        builder: (context, AsyncSnapshot<ParamsModel> snapshot) {
                          if (snapshot.connectionState == ConnectionState.done) {
                            return Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  // GUESTS FIELD
                                  TextFormField(
                                    initialValue: snapshot.data?.guests,
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
                                  StatefulBuilder(builder: (context, setState) {
                                    return TextFormField(
                                      initialValue: snapshot.data?.minPrice.toString(),
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
                                    );
                                  }),
                                  divider(),
                                  // MAX PRICE FIELD
                                  StatefulBuilder(builder: (context, setState) {
                                    return TextFormField(
                                      initialValue: snapshot.data?.maxPrice.toString(),
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
                                    );
                                  }),
                                  divider(),
                                  // BUTTON SEARCH HOTELS
                                  ElevatedButton(
                                    onPressed: () {
                                      FocusScope.of(context).unfocus();
                                      if (_formKey.currentState!.validate()) {
                                        _formKey.currentState!.save();
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
                          } else if (snapshot.connectionState == ConnectionState.none) {
                            return const Text(noData);
                          }
                          return const CircularProgressIndicator();
                        },
                      ),
                    ),
                  ),
                  // RESULT WIDGET
                  HotelListWidget(
                    state: state,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
