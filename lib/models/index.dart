export 'about_property_model.dart';
export 'body_subsections_model.dart';
export 'check_date_model.dart';
export 'currency_info_model.dart';
export 'currency_model.dart';
export 'destination_model.dart';
export 'detail_content_model.dart';
export 'detail_data_model.dart';
export 'detail_elements_model.dart';
export 'detail_header_model.dart';
export 'detail_images_model.dart';
export 'detail_image_model.dart';
export 'detail_items_model.dart';
export 'detail_sections_model.dart';
export 'display_message_model.dart';
export 'image_hotel_model.dart';
export 'line_item_model.dart';
export 'neighborhood_model.dart';
export 'params_model.dart';
export 'price_hotel_model.dart';
export 'price_model.dart';
export 'price_query_model.dart';
export 'property_content_section_groups_model.dart';
export 'property_gallery_model.dart';
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
