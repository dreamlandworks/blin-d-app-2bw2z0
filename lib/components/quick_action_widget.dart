import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'quick_action_model.dart';
export 'quick_action_model.dart';

class QuickActionWidget extends StatefulWidget {
  const QuickActionWidget({
    super.key,
    this.bg,
    this.shadow,
    this.icon,
    this.icon_color,
    this.label,
  });

  final Color? bg;
  final String? shadow;
  final String? icon;
  final Color? icon_color;
  final String? label;

  @override
  State<QuickActionWidget> createState() => _QuickActionWidgetState();
}

class _QuickActionWidgetState extends State<QuickActionWidget> {
  late QuickActionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuickActionModel());
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
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 64.0,
          height: 64.0,
          decoration: BoxDecoration(
            color: valueOrDefault<Color>(
              widget.bg,
              const Color(0x00000000),
            ),
            borderRadius: BorderRadius.circular(24.0),
          ),
          alignment: const AlignmentDirectional(0.0, 0.0),
          child: Icon(
            Icons.favorite_border_rounded,
            color: valueOrDefault<Color>(
              widget.icon_color,
              const Color(0x00000000),
            ),
            size: 28.0,
          ),
        ),
        Text(
          valueOrDefault<String>(
            widget.label,
            'Matches',
          ),
          style: FlutterFlowTheme.of(context).labelMedium.override(
                font: GoogleFonts.plusJakartaSans(
                  fontWeight: FontWeight.w600,
                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                ),
                color: FlutterFlowTheme.of(context).secondaryText,
                fontSize: 13.0,
                letterSpacing: 0.0,
                fontWeight: FontWeight.w600,
                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                lineHeight: 1.3,
              ),
        ),
      ].divide(const SizedBox(height: 4.0)),
    ));
  }
}
