import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prague_hotels/bloc/hotel_list/hotel_list_bloc.dart';
import 'package:prague_hotels/bloc/hotel_list/hotel_list_event.dart';
import 'package:prague_hotels/bloc/hotel_list/hotel_list_state.dart';
import 'package:prague_hotels/utils/constants.dart';
import 'package:prague_hotels/widgets/divider_widget.dart';
import 'package:prague_hotels/widgets/result_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HotelListPage extends StatelessWidget {
  HotelListPage({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => HotelListBloc(),
        child: BlocBuilder<HotelListBloc, HotelListState>(
          builder: (context, state) {
            final HotelListBloc hotelListBloc = context.read<HotelListBloc>();
            return Scrollbar(
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverAppBar(
                    floating: true,
                    collapsedHeight: 370,
                    expandedHeight: 200,
                   // stretch: true,
                    backgroundColor: Colors.yellow[50],
                    flexibleSpace: Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 30, right: 20),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            // GUESTS FIELD
                            TextFormField(
                              initialValue: '1',
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
                                initialValue: '100',
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
                                  hotelListBloc.minPrice = int.parse(value ?? '100');
                                },
                              );
                            }),
                            divider(),
                            // MAX PRICE FIELD
                            StatefulBuilder(builder: (context, setState) {
                              return TextFormField(
                                initialValue: '300',
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
                                  hotelListBloc.maxPrice = int.parse(value ?? '300');
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
                      ),
                    ),
                  ),
                  // RESULT WIDGET
                  ResultWidget(state: state,),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
