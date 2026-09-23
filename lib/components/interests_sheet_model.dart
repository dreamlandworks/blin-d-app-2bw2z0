import '/components/interested_chip_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'interests_sheet_widget.dart' show InterestsSheetWidget;
import 'package:flutter/material.dart';

class InterestsSheetModel extends FlutterFlowModel<InterestsSheetWidget> {
  ///  State fields for stateful widgets in this component.

  // Models for interested_chip dynamic component.
  late FlutterFlowDynamicModels<InterestedChipModel> interestedChipModels;

  @override
  void initState(BuildContext context) {
    interestedChipModels =
        FlutterFlowDynamicModels(() => InterestedChipModel());
  }

  @override
  void dispose() {
    interestedChipModels.dispose();
  }
}
