import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'quick_action3_model.dart';
export 'quick_action3_model.dart';

class QuickAction3Widget extends StatefulWidget {
  const QuickAction3Widget({
    super.key,
    this.icon,
    this.label,
  });

  final String? icon;
  final String? label;

  @override
  State<QuickAction3Widget> createState() => _QuickAction3WidgetState();
}

class _QuickAction3WidgetState extends State<QuickAction3Widget> {
  late QuickAction3Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuickAction3Model());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return genzTap(Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 64.0,
          height: 64.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            boxShadow: const [
              BoxShadow(
                blurRadius: 2.0,
                color: Color(0x1A000000),
                offset: Offset(
                  0.0,
                  1.0,
                ),
                spreadRadius: 0.0,
              )
            ],
            borderRadius: BorderRadius.circular(16.0),
            border: Border.all(
              color: FlutterFlowTheme.of(context).divider,
              width: 1.0,
            ),
          ),
          alignment: const AlignmentDirectional(0.0, 0.0),
          child: Icon(
            Icons.auto_awesome_rounded,
            color: FlutterFlowTheme.of(context).primary,
            size: 28.0,
          ),
        ),
        Text(
          valueOrDefault<String>(
            widget.label,
            'AI Remix',
          ),
          style: FlutterFlowTheme.of(context).labelMedium.override(
                font: GoogleFonts.urbanist(
                  fontWeight:
                      FlutterFlowTheme.of(context).labelMedium.fontWeight,
                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                ),
                color: FlutterFlowTheme.of(context).primaryText,
                letterSpacing: 0.0,
                fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
              ),
        ),
      ].divide(const SizedBox(height: 8.0)),
    ));
  }
}
