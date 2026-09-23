import '/components/reveal_item2_widget.dart';
import '/components/reveal_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'reveal_option_widget.dart' show RevealOptionWidget;
import 'package:flutter/material.dart';

class RevealOptionModel extends FlutterFlowModel<RevealOptionWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - callRevealAction] action in RevealOption widget.
  dynamic revealResponse;
  // Model for RevealItem component.
  late RevealItemModel revealItemModel1;
  // Model for RevealItem component.
  late RevealItemModel revealItemModel2;
  // Model for RevealItem component.
  late RevealItemModel revealItemModel3;
  // Model for RevealItem component.
  late RevealItemModel revealItemModel4;
  // Model for RevealItem2 component.
  late RevealItem2Model revealItem2Model;
  // Stores action output result for [Custom Action - callRevealAction] action in Button widget.
  dynamic revealAcceptResponse;

  @override
  void initState(BuildContext context) {
    revealItemModel1 = createModel(context, () => RevealItemModel());
    revealItemModel2 = createModel(context, () => RevealItemModel());
    revealItemModel3 = createModel(context, () => RevealItemModel());
    revealItemModel4 = createModel(context, () => RevealItemModel());
    revealItem2Model = createModel(context, () => RevealItem2Model());
  }

  @override
  void dispose() {
    revealItemModel1.dispose();
    revealItemModel2.dispose();
    revealItemModel3.dispose();
    revealItemModel4.dispose();
    revealItem2Model.dispose();
  }
}
