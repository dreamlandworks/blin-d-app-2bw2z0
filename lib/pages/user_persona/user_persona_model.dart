import '/components/nav_item_widget.dart';
import '/components/persona_trait_widget.dart';
import '/components/stat_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'user_persona_widget.dart' show UserPersonaWidget;
import 'package:flutter/material.dart';

class UserPersonaModel extends FlutterFlowModel<UserPersonaWidget> {
  ///  Local state fields for this page.

  List<int> days = [1, 2, 3, 4, 5, 6, 7];
  void addToDays(int item) => days.add(item);
  void removeFromDays(int item) => days.remove(item);
  void removeAtIndexFromDays(int index) => days.removeAt(index);
  void insertAtIndexInDays(int index, int item) => days.insert(index, item);
  void updateDaysAtIndex(int index, Function(int) updateFn) =>
      days[index] = updateFn(days[index]);

  List<int> vibeData = [10, 25, 40, 50, 70, 80, 80];
  void addToVibeData(int item) => vibeData.add(item);
  void removeFromVibeData(int item) => vibeData.remove(item);
  void removeAtIndexFromVibeData(int index) => vibeData.removeAt(index);
  void insertAtIndexInVibeData(int index, int item) =>
      vibeData.insert(index, item);
  void updateVibeDataAtIndex(int index, Function(int) updateFn) =>
      vibeData[index] = updateFn(vibeData[index]);

  ///  State fields for stateful widgets in this page.

  // Model for StatCard component.
  late StatCardModel statCardModel1;
  // Model for StatCard component.
  late StatCardModel statCardModel2;
  // Model for StatCard component.
  late StatCardModel statCardModel3;
  // Model for PersonaTrait component.
  late PersonaTraitModel personaTraitModel1;
  // Model for PersonaTrait component.
  late PersonaTraitModel personaTraitModel2;
  // Model for PersonaTrait component.
  late PersonaTraitModel personaTraitModel3;
  // Model for PersonaTrait component.
  late PersonaTraitModel personaTraitModel4;
  // Model for PersonaTrait component.
  late PersonaTraitModel personaTraitModel5;
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
    statCardModel1 = createModel(context, () => StatCardModel());
    statCardModel2 = createModel(context, () => StatCardModel());
    statCardModel3 = createModel(context, () => StatCardModel());
    personaTraitModel1 = createModel(context, () => PersonaTraitModel());
    personaTraitModel2 = createModel(context, () => PersonaTraitModel());
    personaTraitModel3 = createModel(context, () => PersonaTraitModel());
    personaTraitModel4 = createModel(context, () => PersonaTraitModel());
    personaTraitModel5 = createModel(context, () => PersonaTraitModel());
    navItemModel1 = createModel(context, () => NavItemModel());
    navItemModel2 = createModel(context, () => NavItemModel());
    navItemModel3 = createModel(context, () => NavItemModel());
    navItemModel4 = createModel(context, () => NavItemModel());
  }

  @override
  void dispose() {
    statCardModel1.dispose();
    statCardModel2.dispose();
    statCardModel3.dispose();
    personaTraitModel1.dispose();
    personaTraitModel2.dispose();
    personaTraitModel3.dispose();
    personaTraitModel4.dispose();
    personaTraitModel5.dispose();
    navItemModel1.dispose();
    navItemModel2.dispose();
    navItemModel3.dispose();
    navItemModel4.dispose();
  }
}
