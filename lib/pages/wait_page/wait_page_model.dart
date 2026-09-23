import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'wait_page_widget.dart' show WaitPageWidget;
import 'package:flutter/material.dart';

class WaitPageModel extends FlutterFlowModel<WaitPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - waitForUserAndProfile] action in waitPage widget.
  String? result;
  // Stores action output result for [Custom Action - checkForMissedChatSync] action in waitPage widget.
  bool? responseChatSync;
  // State field(s) for LottieAnimation widget.
  late bool lottieAnimationStatus;

  @override
  void initState(BuildContext context) {
    lottieAnimationStatus = true;
  }

  @override
  void dispose() {}
}
