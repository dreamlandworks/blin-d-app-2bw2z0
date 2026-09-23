import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'stat_pill3_model.dart';
export 'stat_pill3_model.dart';

class StatPill3Widget extends StatefulWidget {
  const StatPill3Widget({
    super.key,
    this.icon,
    this.label,
  });

  final String? icon;
  final String? label;

  @override
  State<StatPill3Widget> createState() => _StatPill3WidgetState();
}

class _StatPill3WidgetState extends State<StatPill3Widget> {
  late StatPill3Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StatPill3Model());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return genzFade(Container(
      decoration: BoxDecoration(
        color: const Color(0x229333EA),
        borderRadius: BorderRadius.circular(9999.0),
        border: Border.all(
          color: const Color(0x449333EA),
          width: 1.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(12.0, 6.0, 12.0, 6.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.visibility_rounded,
              color: FlutterFlowTheme.of(context).secondary,
              size: 14.0,
            ),
            Text(
              valueOrDefault<String>(
                widget.label,
                '12 Revealed',
              ),
              style: FlutterFlowTheme.of(context).labelSmall.override(
                    font: GoogleFonts.urbanist(
                      fontWeight:
                          FlutterFlowTheme.of(context).labelSmall.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).labelSmall.fontStyle,
                    ),
                    color: FlutterFlowTheme.of(context).secondary,
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).labelSmall.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).labelSmall.fontStyle,
                  ),
            ),
          ].divide(const SizedBox(width: 4.0)),
        ),
      ),
    ));
  }
}
