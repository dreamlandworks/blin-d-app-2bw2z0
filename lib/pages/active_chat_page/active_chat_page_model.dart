import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import '/index.dart';
import 'active_chat_page_widget.dart' show ActiveChatPageWidget;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';

class ActiveChatPageModel extends FlutterFlowModel<ActiveChatPageWidget> {
  ///  Local state fields for this page.

  Color color1 = const Color(0xffec4899);

  Color color2 = const Color(0xff111827);

  Color colorbg = const Color(0xff9ca3af);

  double progressBar = 0.5;

  String progressText = 'Time is running';

  ///  State fields for stateful widgets in this page.

  InstantTimer? ChatTimer;
  // Stores action output result for [Custom Action - syncOriginalAndMetrics] action in ActiveChatPage widget.
  bool? metricsSync;
  // Stores action output result for [Custom Action - syncOriginalAndMetrics] action in ActiveChatPage widget.
  bool? finalSync;
  // Stores action output result for [Custom Action - getChatSummaryAndNotify] action in ActiveChatPage widget.
  dynamic chatOutput;
  // State field(s) for Timer widget.
  final timerInitialTimeMs = 0;
  int timerMilliseconds = 0;
  String timerValue = StopWatchTimer.getDisplayTime(
    0,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    ChatTimer?.cancel();
    timerController.dispose();
  }
}
