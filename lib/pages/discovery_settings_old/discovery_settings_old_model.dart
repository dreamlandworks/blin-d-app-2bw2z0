import '/components/info_field_widget.dart';
import '/components/interest_tag_widget.dart';
import '/components/pref_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'discovery_settings_old_widget.dart' show DiscoverySettingsOldWidget;
import 'package:flutter/material.dart';

class DiscoverySettingsOldModel
    extends FlutterFlowModel<DiscoverySettingsOldWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for InfoField component.
  late InfoFieldModel infoFieldModel1;
  // Model for InfoField component.
  late InfoFieldModel infoFieldModel2;
  // Model for InterestTag component.
  late InterestTagModel interestTagModel1;
  // Model for InterestTag component.
  late InterestTagModel interestTagModel2;
  // Model for InterestTag component.
  late InterestTagModel interestTagModel3;
  // Model for InterestTag component.
  late InterestTagModel interestTagModel4;
  // Model for InterestTag component.
  late InterestTagModel interestTagModel5;
  // Model for pref_card component.
  late PrefCardModel prefCardModel1;
  // Model for pref_card component.
  late PrefCardModel prefCardModel2;
  // Model for pref_card component.
  late PrefCardModel prefCardModel3;

  @override
  void initState(BuildContext context) {
    infoFieldModel1 = createModel(context, () => InfoFieldModel());
    infoFieldModel2 = createModel(context, () => InfoFieldModel());
    interestTagModel1 = createModel(context, () => InterestTagModel());
    interestTagModel2 = createModel(context, () => InterestTagModel());
    interestTagModel3 = createModel(context, () => InterestTagModel());
    interestTagModel4 = createModel(context, () => InterestTagModel());
    interestTagModel5 = createModel(context, () => InterestTagModel());
    prefCardModel1 = createModel(context, () => PrefCardModel());
    prefCardModel2 = createModel(context, () => PrefCardModel());
    prefCardModel3 = createModel(context, () => PrefCardModel());
  }

  @override
  void dispose() {
    infoFieldModel1.dispose();
    infoFieldModel2.dispose();
    interestTagModel1.dispose();
    interestTagModel2.dispose();
    interestTagModel3.dispose();
    interestTagModel4.dispose();
    interestTagModel5.dispose();
    prefCardModel1.dispose();
    prefCardModel2.dispose();
    prefCardModel3.dispose();
  }
}
