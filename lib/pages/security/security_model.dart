import '/components/privacy_card_widget.dart';
import '/components/security_toggle_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'security_widget.dart' show SecurityWidget;
import 'package:flutter/material.dart';

class SecurityModel extends FlutterFlowModel<SecurityWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // Model for SecurityToggle component.
  late SecurityToggleModel securityToggleModel;
  // Model for PrivacyCard component.
  late PrivacyCardModel privacyCardModel1;
  // Stores action output result for [Custom Action - callDownloadUserData] action in PrivacyCard widget.
  bool? res1;
  // Model for PrivacyCard component.
  late PrivacyCardModel privacyCardModel2;
  // Stores action output result for [Custom Action - callDeleteUserAccount] action in PrivacyCard widget.
  bool? response;

  @override
  void initState(BuildContext context) {
    securityToggleModel = createModel(context, () => SecurityToggleModel());
    privacyCardModel1 = createModel(context, () => PrivacyCardModel());
    privacyCardModel2 = createModel(context, () => PrivacyCardModel());
  }

  @override
  void dispose() {
    securityToggleModel.dispose();
    privacyCardModel1.dispose();
    privacyCardModel2.dispose();
  }
}
