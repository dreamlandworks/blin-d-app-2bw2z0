import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/count_timer_widget.dart';
import '/components/nav_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'slot_selection_widget.dart' show SlotSelectionWidget;
import 'package:flutter/material.dart';

class SlotSelectionModel extends FlutterFlowModel<SlotSelectionWidget> {
  ///  Local state fields for this page.

  List<SlotDataStruct> slotDataPageState = [];
  void addToSlotDataPageState(SlotDataStruct item) =>
      slotDataPageState.add(item);
  void removeFromSlotDataPageState(SlotDataStruct item) =>
      slotDataPageState.remove(item);
  void removeAtIndexFromSlotDataPageState(int index) =>
      slotDataPageState.removeAt(index);
  void insertAtIndexInSlotDataPageState(int index, SlotDataStruct item) =>
      slotDataPageState.insert(index, item);
  void updateSlotDataPageStateAtIndex(
          int index, Function(SlotDataStruct) updateFn) =>
      slotDataPageState[index] = updateFn(slotDataPageState[index]);

  List<int> selectedSlot = [];
  void addToSelectedSlot(int item) => selectedSlot.add(item);
  void removeFromSelectedSlot(int item) => selectedSlot.remove(item);
  void removeAtIndexFromSelectedSlot(int index) => selectedSlot.removeAt(index);
  void insertAtIndexInSelectedSlot(int index, int item) =>
      selectedSlot.insert(index, item);
  void updateSelectedSlotAtIndex(int index, Function(int) updateFn) =>
      selectedSlot[index] = updateFn(selectedSlot[index]);

  List<SlotDataStruct> slotId = [];
  void addToSlotId(SlotDataStruct item) => slotId.add(item);
  void removeFromSlotId(SlotDataStruct item) => slotId.remove(item);
  void removeAtIndexFromSlotId(int index) => slotId.removeAt(index);
  void insertAtIndexInSlotId(int index, SlotDataStruct item) =>
      slotId.insert(index, item);
  void updateSlotIdAtIndex(int index, Function(SlotDataStruct) updateFn) =>
      slotId[index] = updateFn(slotId[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getFutureSlotTimestamps] action in SlotSelection widget.
  List<dynamic>? slotData;
  // Models for countTimer dynamic component.
  late FlutterFlowDynamicModels<CountTimerModel> countTimerModels;
  // Stores action output result for [Custom Action - processUserReadyStatus] action in Button widget.
  dynamic userStatus;
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
    countTimerModels = FlutterFlowDynamicModels(() => CountTimerModel());
    navItemModel1 = createModel(context, () => NavItemModel());
    navItemModel2 = createModel(context, () => NavItemModel());
    navItemModel3 = createModel(context, () => NavItemModel());
    navItemModel4 = createModel(context, () => NavItemModel());
  }

  @override
  void dispose() {
    countTimerModels.dispose();
    navItemModel1.dispose();
    navItemModel2.dispose();
    navItemModel3.dispose();
    navItemModel4.dispose();
  }
}
