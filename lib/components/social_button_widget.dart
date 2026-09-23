import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'social_button_model.dart';
export 'social_button_model.dart';

class SocialButtonWidget extends StatefulWidget {
  const SocialButtonWidget({
    super.key,
    this.icon,
  });

  final String? icon;

  @override
  State<SocialButtonWidget> createState() => _SocialButtonWidgetState();
}

class _SocialButtonWidgetState extends State<SocialButtonWidget> {
  late SocialButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SocialButtonModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return genzTap(Container(
      width: 64.0,
      height: 64.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(24.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).divider,
          width: 1.5,
        ),
      ),
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Icon(
        Icons.question_mark,
        color: FlutterFlowTheme.of(context).primaryText,
        size: 24.0,
      ),
    ));
  }
}
