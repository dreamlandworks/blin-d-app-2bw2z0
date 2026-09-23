import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'change_mobile_widget.dart' show ChangeMobileWidget;
import 'package:flutter/material.dart';

class ChangeMobileModel extends FlutterFlowModel<ChangeMobileWidget> {
  ///  Local state fields for this page.

  String resendTxt = 'Resend in';

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Custom Action - sendPhoneVerificationCode] action in Button widget.
  String? verificationId;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
