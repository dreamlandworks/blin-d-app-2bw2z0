import '/components/glowing_orb_widget.dart';
import '/components/manifest_text_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'splash_widget.dart' show SplashWidget;
import 'package:flutter/material.dart';

class SplashModel extends FlutterFlowModel<SplashWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for GlowingOrb component.
  late GlowingOrbModel glowingOrbModel1;
  // Model for GlowingOrb component.
  late GlowingOrbModel glowingOrbModel2;
  // Model for GlowingOrb component.
  late GlowingOrbModel glowingOrbModel3;
  // Model for ManifestText component.
  late ManifestTextModel manifestTextModel;

  @override
  void initState(BuildContext context) {
    glowingOrbModel1 = createModel(context, () => GlowingOrbModel());
    glowingOrbModel2 = createModel(context, () => GlowingOrbModel());
    glowingOrbModel3 = createModel(context, () => GlowingOrbModel());
    manifestTextModel = createModel(context, () => ManifestTextModel());
  }

  @override
  void dispose() {
    glowingOrbModel1.dispose();
    glowingOrbModel2.dispose();
    glowingOrbModel3.dispose();
    manifestTextModel.dispose();
  }
}
