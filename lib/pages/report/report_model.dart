import '/components/chat_preview_widget.dart';
import '/components/reason_chip_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'report_widget.dart' show ReportWidget;
import 'package:flutter/material.dart';

class ReportModel extends FlutterFlowModel<ReportWidget> {
  ///  Local state fields for this page.

  String category = 'harassment';

  String addMessage = 'nothing to say';

  ///  State fields for stateful widgets in this page.

  // Model for ChatPreview component.
  late ChatPreviewModel chatPreviewModel;
  // Model for ReasonChip component.
  late ReasonChipModel reasonChipModel1;
  // Model for ReasonChip component.
  late ReasonChipModel reasonChipModel2;
  // Model for ReasonChip component.
  late ReasonChipModel reasonChipModel3;
  // Model for ReasonChip component.
  late ReasonChipModel reasonChipModel4;
  // Model for ReasonChip component.
  late ReasonChipModel reasonChipModel5;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Custom Action - submitReport] action in Container widget.
  dynamic reportStatus;

  @override
  void initState(BuildContext context) {
    chatPreviewModel = createModel(context, () => ChatPreviewModel());
    reasonChipModel1 = createModel(context, () => ReasonChipModel());
    reasonChipModel2 = createModel(context, () => ReasonChipModel());
    reasonChipModel3 = createModel(context, () => ReasonChipModel());
    reasonChipModel4 = createModel(context, () => ReasonChipModel());
    reasonChipModel5 = createModel(context, () => ReasonChipModel());
  }

  @override
  void dispose() {
    chatPreviewModel.dispose();
    reasonChipModel1.dispose();
    reasonChipModel2.dispose();
    reasonChipModel3.dispose();
    reasonChipModel4.dispose();
    reasonChipModel5.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
