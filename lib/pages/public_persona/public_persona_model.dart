import '/components/intel_card_widget.dart';
import '/components/social_tag_widget.dart';
import '/components/vibe_stat_pill_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'public_persona_widget.dart' show PublicPersonaWidget;
import 'package:flutter/material.dart';

class PublicPersonaModel extends FlutterFlowModel<PublicPersonaWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - fetchRevealedProfile] action in PublicPersona widget.
  dynamic fetchProfile;
  // Model for VibeStatPill component.
  late VibeStatPillModel vibeStatPillModel1;
  // Model for VibeStatPill component.
  late VibeStatPillModel vibeStatPillModel2;
  // Model for VibeStatPill component.
  late VibeStatPillModel vibeStatPillModel3;
  // Model for IntelCard component.
  late IntelCardModel intelCardModel1;
  // Model for IntelCard component.
  late IntelCardModel intelCardModel2;
  // Model for IntelCard component.
  late IntelCardModel intelCardModel3;
  // Model for SocialTag component.
  late SocialTagModel socialTagModel1;
  // Model for SocialTag component.
  late SocialTagModel socialTagModel2;
  // Model for SocialTag component.
  late SocialTagModel socialTagModel3;
  // Model for SocialTag component.
  late SocialTagModel socialTagModel4;
  // Model for SocialTag component.
  late SocialTagModel socialTagModel5;
  // Stores action output result for [Custom Action - callManagePermRequest] action in Button widget.
  dynamic reqres;

  @override
  void initState(BuildContext context) {
    vibeStatPillModel1 = createModel(context, () => VibeStatPillModel());
    vibeStatPillModel2 = createModel(context, () => VibeStatPillModel());
    vibeStatPillModel3 = createModel(context, () => VibeStatPillModel());
    intelCardModel1 = createModel(context, () => IntelCardModel());
    intelCardModel2 = createModel(context, () => IntelCardModel());
    intelCardModel3 = createModel(context, () => IntelCardModel());
    socialTagModel1 = createModel(context, () => SocialTagModel());
    socialTagModel2 = createModel(context, () => SocialTagModel());
    socialTagModel3 = createModel(context, () => SocialTagModel());
    socialTagModel4 = createModel(context, () => SocialTagModel());
    socialTagModel5 = createModel(context, () => SocialTagModel());
  }

  @override
  void dispose() {
    vibeStatPillModel1.dispose();
    vibeStatPillModel2.dispose();
    vibeStatPillModel3.dispose();
    intelCardModel1.dispose();
    intelCardModel2.dispose();
    intelCardModel3.dispose();
    socialTagModel1.dispose();
    socialTagModel2.dispose();
    socialTagModel3.dispose();
    socialTagModel4.dispose();
    socialTagModel5.dispose();
  }
}
