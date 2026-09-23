import '/components/interest_tag_widget.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import '/index.dart';
import 'handshake_page_widget.dart' show HandshakePageWidget;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';

class HandshakePageModel extends FlutterFlowModel<HandshakePageWidget> {
  ///  Local state fields for this page.

  String? status;

  String? chatID;

  ///  State fields for stateful widgets in this page.

  InstantTimer? instantTimer;
  // Stores action output result for [Custom Action - callHandshakeAction] action in HandshakePage widget.
  dynamic noResponse;
  // State field(s) for Timer widget.
  final timerInitialTimeMs = 180000;
  int timerMilliseconds = 180000;
  String timerValue = StopWatchTimer.getDisplayTime(
    180000,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  // Models for InterestTag dynamic component.
  late FlutterFlowDynamicModels<InterestTagModel> interestTagModels;
  // Stores action output result for [Custom Action - callHandshakeAction] action in Button widget.
  dynamic acceptResponse;
  // Stores action output result for [Custom Action - callHandshakeAction] action in Button widget.
  dynamic responseReject;

  @override
  void initState(BuildContext context) {
    interestTagModels = FlutterFlowDynamicModels(() => InterestTagModel());
  }

  @override
  void dispose() {
    instantTimer?.cancel();
    timerController.dispose();
    interestTagModels.dispose();
  }
}
