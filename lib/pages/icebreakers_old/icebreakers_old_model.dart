import '/components/category_chip_widget.dart';
import '/components/ice_breaker_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'icebreakers_old_widget.dart' show IcebreakersOldWidget;
import 'package:flutter/material.dart';

class IcebreakersOldModel extends FlutterFlowModel<IcebreakersOldWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for CategoryChip component.
  late CategoryChipModel categoryChipModel1;
  // Model for CategoryChip component.
  late CategoryChipModel categoryChipModel2;
  // Model for CategoryChip component.
  late CategoryChipModel categoryChipModel3;
  // Model for CategoryChip component.
  late CategoryChipModel categoryChipModel4;
  // Model for CategoryChip component.
  late CategoryChipModel categoryChipModel5;
  // Model for IceBreakerCard component.
  late IceBreakerCardModel iceBreakerCardModel1;
  // Model for IceBreakerCard component.
  late IceBreakerCardModel iceBreakerCardModel2;
  // Model for IceBreakerCard component.
  late IceBreakerCardModel iceBreakerCardModel3;
  // Model for IceBreakerCard component.
  late IceBreakerCardModel iceBreakerCardModel4;
  // Model for IceBreakerCard component.
  late IceBreakerCardModel iceBreakerCardModel5;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {
    categoryChipModel1 = createModel(context, () => CategoryChipModel());
    categoryChipModel2 = createModel(context, () => CategoryChipModel());
    categoryChipModel3 = createModel(context, () => CategoryChipModel());
    categoryChipModel4 = createModel(context, () => CategoryChipModel());
    categoryChipModel5 = createModel(context, () => CategoryChipModel());
    iceBreakerCardModel1 = createModel(context, () => IceBreakerCardModel());
    iceBreakerCardModel2 = createModel(context, () => IceBreakerCardModel());
    iceBreakerCardModel3 = createModel(context, () => IceBreakerCardModel());
    iceBreakerCardModel4 = createModel(context, () => IceBreakerCardModel());
    iceBreakerCardModel5 = createModel(context, () => IceBreakerCardModel());
  }

  @override
  void dispose() {
    categoryChipModel1.dispose();
    categoryChipModel2.dispose();
    categoryChipModel3.dispose();
    categoryChipModel4.dispose();
    categoryChipModel5.dispose();
    iceBreakerCardModel1.dispose();
    iceBreakerCardModel2.dispose();
    iceBreakerCardModel3.dispose();
    iceBreakerCardModel4.dispose();
    iceBreakerCardModel5.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
