import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'map_page_widget.dart' show MapPageWidget;
import 'package:flutter/material.dart';

class MapPageModel extends FlutterFlowModel<MapPageWidget> {
  ///  Local state fields for this page.

  List<String> userLocation = [];
  void addToUserLocation(String item) => userLocation.add(item);
  void removeFromUserLocation(String item) => userLocation.remove(item);
  void removeAtIndexFromUserLocation(int index) => userLocation.removeAt(index);
  void insertAtIndexInUserLocation(int index, String item) =>
      userLocation.insert(index, item);
  void updateUserLocationAtIndex(int index, Function(String) updateFn) =>
      userLocation[index] = updateFn(userLocation[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (LocationAPI)] action in mapPage widget.
  ApiCallResponse? apiResultq1j;
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // Stores action output result for [Backend Call - API (LocationAPI)] action in Button widget.
  ApiCallResponse? apiResultjdo;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
