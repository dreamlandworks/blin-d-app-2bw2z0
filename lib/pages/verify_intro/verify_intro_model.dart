import '/components/button_widget.dart';
import '/components/feature_row_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'verify_intro_widget.dart' show VerifyIntroWidget;
import 'package:flutter/material.dart';

class VerifyIntroModel extends FlutterFlowModel<VerifyIntroWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for FeatureRow.
  late FeatureRowModel featureRowModel1;
  // Model for FeatureRow.
  late FeatureRowModel featureRowModel2;
  // Model for FeatureRow.
  late FeatureRowModel featureRowModel3;
  // Model for Button.
  late ButtonModel buttonModel;

  @override
  void initState(BuildContext context) {
    featureRowModel1 = createModel(context, () => FeatureRowModel());
    featureRowModel2 = createModel(context, () => FeatureRowModel());
    featureRowModel3 = createModel(context, () => FeatureRowModel());
    buttonModel = createModel(context, () => ButtonModel());
  }

  @override
  void dispose() {
    featureRowModel1.dispose();
    featureRowModel2.dispose();
    featureRowModel3.dispose();
    buttonModel.dispose();
  }
}
