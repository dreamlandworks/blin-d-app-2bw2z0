import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'action_pill_model.dart';
export 'action_pill_model.dart';

class ActionPillWidget extends StatefulWidget {
  const ActionPillWidget({
    super.key,
    this.bg,
    this.border,
    this.icon,
    this.color,
    this.label,
  });

  final Color? bg;
  final String? border;
  final String? icon;
  final Color? color;
  final String? label;

  @override
  State<ActionPillWidget> createState() => _ActionPillWidgetState();
}

class _ActionPillWidgetState extends State<ActionPillWidget> {
  late ActionPillModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ActionPillModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return genzTap(Container(
      decoration: BoxDecoration(
        color: valueOrDefault<Color>(
          widget.bg,
          const Color(0x00000000),
        ),
        borderRadius: BorderRadius.circular(9999.0),
        border: Border.all(
          width: 1.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(24.0, 8.0, 24.0, 8.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.favorite_rounded,
              color: valueOrDefault<Color>(
                widget.color,
                const Color(0x00000000),
              ),
              size: 18.0,
            ),
            Text(
              valueOrDefault<String>(
                widget.label,
                'Boost',
              ),
              style: FlutterFlowTheme.of(context).labelMedium.override(
                    font: GoogleFonts.plusJakartaSans(
                      fontWeight: FontWeight.w600,
                      fontStyle:
                          FlutterFlowTheme.of(context).labelMedium.fontStyle,
                    ),
                    color: valueOrDefault<Color>(
                      widget.color,
                      const Color(0x00000000),
                    ),
                    fontSize: 13.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w600,
                    fontStyle:
                        FlutterFlowTheme.of(context).labelMedium.fontStyle,
                    lineHeight: 1.3,
                  ),
            ),
          ].divide(const SizedBox(width: 8.0)),
        ),
      ),
    ));
  }
}
