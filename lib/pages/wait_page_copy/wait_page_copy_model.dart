import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'wait_page_copy_widget.dart' show WaitPageCopyWidget;
import 'package:flutter/material.dart';

class WaitPageCopyModel extends FlutterFlowModel<WaitPageCopyWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - checkForMissedChatSync] action in waitPageCopy widget.
  bool? responseChatSync;
  // Stores action output result for [Backend Call - API (LocationAPI)] action in waitPageCopy widget.
  ApiCallResponse? apiResulthly;
  // State field(s) for LottieAnimation widget.
  late bool lottieAnimationStatus;

  @override
  void initState(BuildContext context) {
    lottieAnimationStatus = true;
  }

  @override
  void dispose() {}
}
