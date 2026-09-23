
import '/flutter_flow/lat_lng.dart';
import '/backend/backend.dart';

String convertToString(LatLng latLong) {
  // Access the latitude and longitude properties directly
  final String lat = latLong.latitude.toString();
  final String lng = latLong.longitude.toString();

  return "$lat,$lng";
}
