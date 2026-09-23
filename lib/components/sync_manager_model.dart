import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'sync_manager_widget.dart' show SyncManagerWidget;
import 'package:flutter/material.dart';

class SyncManagerModel extends FlutterFlowModel<SyncManagerWidget> {
  ///  State fields for stateful widgets in this component.

  InstantTimer? instantTimer;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    instantTimer?.cancel();
  }
}
