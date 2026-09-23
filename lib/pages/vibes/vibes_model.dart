import '/components/active_chat_block_widget.dart';
import '/components/active_reveal_widget.dart';
import '/components/nav_item_widget.dart';
import '/components/permanent_chat_widget.dart';
import '/components/reveal_card_widget.dart';
import '/components/tab_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'vibes_widget.dart' show VibesWidget;
import 'package:flutter/material.dart';

class VibesModel extends FlutterFlowModel<VibesWidget> {
  ///  Local state fields for this page.

  bool isVibe = true;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getMyRevealedUsersList] action in Vibes widget.
  dynamic revealsList;
  // Model for TabItem component.
  late TabItemModel tabItemModel1;
  // Model for TabItem component.
  late TabItemModel tabItemModel2;
  // Model for ActiveChatBlock component.
  late ActiveChatBlockModel activeChatBlockModel;
  // Models for PermanentChat dynamic component.
  late FlutterFlowDynamicModels<PermanentChatModel> permanentChatModels;
  // Model for Active_reveal component.
  late ActiveRevealModel activeRevealModel;
  // Models for RevealCard dynamic component.
  late FlutterFlowDynamicModels<RevealCardModel> revealCardModels;
  // Model for NavItem component.
  late NavItemModel navItemModel1;
  // Model for NavItem component.
  late NavItemModel navItemModel2;
  // Model for NavItem component.
  late NavItemModel navItemModel3;
  // Model for NavItem component.
  late NavItemModel navItemModel4;

  @override
  void initState(BuildContext context) {
    tabItemModel1 = createModel(context, () => TabItemModel());
    tabItemModel2 = createModel(context, () => TabItemModel());
    activeChatBlockModel = createModel(context, () => ActiveChatBlockModel());
    permanentChatModels = FlutterFlowDynamicModels(() => PermanentChatModel());
    activeRevealModel = createModel(context, () => ActiveRevealModel());
    revealCardModels = FlutterFlowDynamicModels(() => RevealCardModel());
    navItemModel1 = createModel(context, () => NavItemModel());
    navItemModel2 = createModel(context, () => NavItemModel());
    navItemModel3 = createModel(context, () => NavItemModel());
    navItemModel4 = createModel(context, () => NavItemModel());
  }

  @override
  void dispose() {
    tabItemModel1.dispose();
    tabItemModel2.dispose();
    activeChatBlockModel.dispose();
    permanentChatModels.dispose();
    activeRevealModel.dispose();
    revealCardModels.dispose();
    navItemModel1.dispose();
    navItemModel2.dispose();
    navItemModel3.dispose();
    navItemModel4.dispose();
  }
}
