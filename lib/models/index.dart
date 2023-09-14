export 'check_date_model.dart';
export 'currency_info_model.dart';
export 'currency_model.dart';
export 'destination_model.dart';
export 'display_message_model.dart';
export 'hotel_detail_model.dart';
export 'hotel_list_item_model.dart';
export 'image_hotel_model.dart';
export 'line_item_model.dart';
export 'neighborhood_model.dart';
export 'price_hotel_model.dart';
export 'price_model.dart';
export 'price_query_model.dart';
export 'property_image_model.dart';
export 'property_list_model.dart';
export 'property_model.dart';
export 'query_params_model.dart';
export 'rooms_model.dart';
import 'package:quiver/core.dart';

T? checkOptional<T>(Optional<T?>? optional, T? Function()? def) {
  // No value given, just take default value
  if (optional == null) return def?.call();

  // We have an input value
  if (optional.isPresent) return optional.value;

  // We have a null inside the optional
  return null;
}
