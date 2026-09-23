import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'mobile_entry_widget.dart' show MobileEntryWidget;
import 'package:flutter/material.dart';

class MobileEntryModel extends FlutterFlowModel<MobileEntryWidget> {
  ///  Local state fields for this page.

  String dialCode = '+91';

  String? mobileFinal = '';

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for terms_box widget.
  bool? termsBoxValue;
  // State field(s) for aivibes_box widget.
  bool? aivibesBoxValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
