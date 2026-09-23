import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/active_chat_block_widget.dart';
import '/components/dna_stat_widget.dart';
import '/components/nav_item_widget.dart';
import '/components/stat_card2_widget.dart';
import '/components/stat_card3_widget.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'dashboard_widget.dart' show DashboardWidget;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';

class DashboardModel extends FlutterFlowModel<DashboardWidget> {
  ///  Local state fields for this page.

  StatusBlockStruct? statusBlock;
  void updateStatusBlockStruct(Function(StatusBlockStruct) updateFn) {
    updateFn(statusBlock ??= StatusBlockStruct());
  }

  int? activeSlotIndex;

  EnergyBlockStruct? energyBlock;
  void updateEnergyBlockStruct(Function(EnergyBlockStruct) updateFn) {
    updateFn(energyBlock ??= EnergyBlockStruct());
  }

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getActiveSlotIndex] action in dashboard widget.
  int? activeSlot;
  // Stores action output result for [Custom Action - getProfileAndTraitData] action in dashboard widget.
  dynamic energyBlockData;
  // Stores action output result for [Custom Action - getProfileAndTraitData] action in dashboard widget.
  dynamic energyBlockData1;
  // State field(s) for Timer widget.
  final timerInitialTimeMs = 0;
  int timerMilliseconds = 0;
  String timerValue = StopWatchTimer.getDisplayTime(0, milliSecond: false);
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  // Model for ActiveChatBlock component.
  late ActiveChatBlockModel activeChatBlockModel;
  // Model for StatCard2 component.
  late StatCard2Model statCard2Model;
  // Model for StatCard3 component.
  late StatCard3Model statCard3Model;
  // Model for DnaStat component.
  late DnaStatModel dnaStatModel1;
  // Model for DnaStat component.
  late DnaStatModel dnaStatModel2;
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
    activeChatBlockModel = createModel(context, () => ActiveChatBlockModel());
    statCard2Model = createModel(context, () => StatCard2Model());
    statCard3Model = createModel(context, () => StatCard3Model());
    dnaStatModel1 = createModel(context, () => DnaStatModel());
    dnaStatModel2 = createModel(context, () => DnaStatModel());
    navItemModel1 = createModel(context, () => NavItemModel());
    navItemModel2 = createModel(context, () => NavItemModel());
    navItemModel3 = createModel(context, () => NavItemModel());
    navItemModel4 = createModel(context, () => NavItemModel());
  }

  @override
  void dispose() {
    timerController.dispose();
    activeChatBlockModel.dispose();
    statCard2Model.dispose();
    statCard3Model.dispose();
    dnaStatModel1.dispose();
    dnaStatModel2.dispose();
    navItemModel1.dispose();
    navItemModel2.dispose();
    navItemModel3.dispose();
    navItemModel4.dispose();
  }
}
