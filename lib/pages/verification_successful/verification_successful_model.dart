import '/components/button_widget.dart';
import '/components/data_row_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'verification_successful_widget.dart' show VerificationSuccessfulWidget;
import 'package:flutter/material.dart';

class VerificationSuccessfulModel
    extends FlutterFlowModel<VerificationSuccessfulWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - verifyDigiLockerProfileAction] action in VerificationSuccessful widget.
  dynamic digiResponse;
  // Model for DataRow.
  late DataRowModel dataRowModel1;
  // Model for DataRow.
  late DataRowModel dataRowModel2;
  // Model for DataRow.
  late DataRowModel dataRowModel3;
  // Model for DataRow.
  late DataRowModel dataRowModel4;
  // Model for Button.
  late ButtonModel buttonModel;

  @override
  void initState(BuildContext context) {
    dataRowModel1 = createModel(context, () => DataRowModel());
    dataRowModel2 = createModel(context, () => DataRowModel());
    dataRowModel3 = createModel(context, () => DataRowModel());
    dataRowModel4 = createModel(context, () => DataRowModel());
    buttonModel = createModel(context, () => ButtonModel());
  }

  @override
  void dispose() {
    dataRowModel1.dispose();
    dataRowModel2.dispose();
    dataRowModel3.dispose();
    dataRowModel4.dispose();
    buttonModel.dispose();
  }
}
