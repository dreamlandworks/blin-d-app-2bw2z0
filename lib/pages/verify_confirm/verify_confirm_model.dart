import '/components/button_widget.dart';
import '/components/top_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'verify_confirm_widget.dart' show VerifyConfirmWidget;
import 'package:flutter/material.dart';

class VerifyConfirmModel extends FlutterFlowModel<VerifyConfirmWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for TopBar.
  late TopBarModel topBarModel;
  // Model for Button.
  late ButtonModel buttonModel;
  // Stores action output result for [Custom Action - initiateDigiLockerAction] action in Button widget.
  dynamic digi;

  @override
  void initState(BuildContext context) {
    topBarModel = createModel(context, () => TopBarModel());
    buttonModel = createModel(context, () => ButtonModel());
  }

  @override
  void dispose() {
    topBarModel.dispose();
    buttonModel.dispose();
  }
}
