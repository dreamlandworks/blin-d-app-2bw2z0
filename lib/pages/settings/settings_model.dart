import '/components/menu_item2_widget.dart';
import '/components/nav_item_widget.dart';
import '/components/profile_stat_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'settings_widget.dart' show SettingsWidget;
import 'package:flutter/material.dart';

class SettingsModel extends FlutterFlowModel<SettingsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for ProfileStat component.
  late ProfileStatModel profileStatModel1;
  // Model for ProfileStat component.
  late ProfileStatModel profileStatModel2;
  // Model for ProfileStat component.
  late ProfileStatModel profileStatModel3;
  // Model for MenuItem2 component.
  late MenuItem2Model menuItem2Model1;
  // Model for MenuItem2 component.
  late MenuItem2Model menuItem2Model2;
  // Model for MenuItem2 component.
  late MenuItem2Model menuItem2Model3;
  // Model for MenuItem2 component.
  late MenuItem2Model menuItem2Model4;
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
    profileStatModel1 = createModel(context, () => ProfileStatModel());
    profileStatModel2 = createModel(context, () => ProfileStatModel());
    profileStatModel3 = createModel(context, () => ProfileStatModel());
    menuItem2Model1 = createModel(context, () => MenuItem2Model());
    menuItem2Model2 = createModel(context, () => MenuItem2Model());
    menuItem2Model3 = createModel(context, () => MenuItem2Model());
    menuItem2Model4 = createModel(context, () => MenuItem2Model());
    navItemModel1 = createModel(context, () => NavItemModel());
    navItemModel2 = createModel(context, () => NavItemModel());
    navItemModel3 = createModel(context, () => NavItemModel());
    navItemModel4 = createModel(context, () => NavItemModel());
  }

  @override
  void dispose() {
    profileStatModel1.dispose();
    profileStatModel2.dispose();
    profileStatModel3.dispose();
    menuItem2Model1.dispose();
    menuItem2Model2.dispose();
    menuItem2Model3.dispose();
    menuItem2Model4.dispose();
    navItemModel1.dispose();
    navItemModel2.dispose();
    navItemModel3.dispose();
    navItemModel4.dispose();
  }
}
