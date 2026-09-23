import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'vibe_stat_pill_model.dart';
export 'vibe_stat_pill_model.dart';

class VibeStatPillWidget extends StatefulWidget {
  const VibeStatPillWidget({
    super.key,
    this.bg,
    this.border_color,
    this.label,
    this.text_color,
    this.value,
  });

  final Color? bg;
  final Color? border_color;
  final String? label;
  final Color? text_color;
  final String? value;

  @override
  State<VibeStatPillWidget> createState() => _VibeStatPillWidgetState();
}

class _VibeStatPillWidgetState extends State<VibeStatPillWidget> {
  late VibeStatPillModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VibeStatPillModel());
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
        color: valueOrDefault<Color>(
          widget.bg,
          const Color(0x00000000),
        ),
        borderRadius: BorderRadius.circular(24.0),
        border: Border.all(
          color: valueOrDefault<Color>(
            widget.border_color,
            const Color(0x00000000),
          ),
          width: 1.5,
        ),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Opacity(
              opacity: 0.8,
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                child: Text(
                  valueOrDefault<String>(
                    widget.label,
                    'COMPATIBILITY',
                  ),
                  style: FlutterFlowTheme.of(context).labelSmall.override(
                        font: GoogleFonts.urbanist(
                          fontWeight: FlutterFlowTheme.of(context)
                              .labelSmall
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).labelSmall.fontStyle,
                        ),
                        color: valueOrDefault<Color>(
                          widget.text_color,
                          const Color(0x00000000),
                        ),
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).labelSmall.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).labelSmall.fontStyle,
                      ),
                ),
              ),
            ),
            Text(
              valueOrDefault<String>(
                widget.value,
                '98%',
              ),
              style: FlutterFlowTheme.of(context).titleLarge.override(
                    font: GoogleFonts.poppins(
                      fontWeight: FontWeight.w900,
                      fontStyle:
                          FlutterFlowTheme.of(context).titleLarge.fontStyle,
                    ),
                    color: valueOrDefault<Color>(
                      widget.text_color,
                      const Color(0x00000000),
                    ),
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w900,
                    fontStyle:
                        FlutterFlowTheme.of(context).titleLarge.fontStyle,
                  ),
            ),
          ].divide(const SizedBox(height: 4.0)),
        ),
      ),
    ));
  }
}
