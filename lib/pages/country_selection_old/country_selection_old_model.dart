import '/components/country_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'country_selection_old_widget.dart' show CountrySelectionOldWidget;
import 'package:flutter/material.dart';

class CountrySelectionOldModel
    extends FlutterFlowModel<CountrySelectionOldWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // Model for CountryItem component.
  late CountryItemModel countryItemModel1;
  // Model for CountryItem component.
  late CountryItemModel countryItemModel2;
  // Model for CountryItem component.
  late CountryItemModel countryItemModel3;
  // Model for CountryItem component.
  late CountryItemModel countryItemModel4;
  // Model for CountryItem component.
  late CountryItemModel countryItemModel5;
  // Model for CountryItem component.
  late CountryItemModel countryItemModel6;
  // Model for CountryItem component.
  late CountryItemModel countryItemModel7;
  // Model for CountryItem component.
  late CountryItemModel countryItemModel8;
  // Model for CountryItem component.
  late CountryItemModel countryItemModel9;
  // Model for CountryItem component.
  late CountryItemModel countryItemModel10;
  // Model for CountryItem component.
  late CountryItemModel countryItemModel11;

  @override
  void initState(BuildContext context) {
    countryItemModel1 = createModel(context, () => CountryItemModel());
    countryItemModel2 = createModel(context, () => CountryItemModel());
    countryItemModel3 = createModel(context, () => CountryItemModel());
    countryItemModel4 = createModel(context, () => CountryItemModel());
    countryItemModel5 = createModel(context, () => CountryItemModel());
    countryItemModel6 = createModel(context, () => CountryItemModel());
    countryItemModel7 = createModel(context, () => CountryItemModel());
    countryItemModel8 = createModel(context, () => CountryItemModel());
    countryItemModel9 = createModel(context, () => CountryItemModel());
    countryItemModel10 = createModel(context, () => CountryItemModel());
    countryItemModel11 = createModel(context, () => CountryItemModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    countryItemModel1.dispose();
    countryItemModel2.dispose();
    countryItemModel3.dispose();
    countryItemModel4.dispose();
    countryItemModel5.dispose();
    countryItemModel6.dispose();
    countryItemModel7.dispose();
    countryItemModel8.dispose();
    countryItemModel9.dispose();
    countryItemModel10.dispose();
    countryItemModel11.dispose();
  }
}
