import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'quick_action2_model.dart';
export 'quick_action2_model.dart';

class QuickAction2Widget extends StatefulWidget {
  const QuickAction2Widget({
    super.key,
    this.bg,
    this.icon,
    this.color,
    this.label,
  });

  final Color? bg;
  final String? icon;
  final Color? color;
  final String? label;

  @override
  State<QuickAction2Widget> createState() => _QuickAction2WidgetState();
}

class _QuickAction2WidgetState extends State<QuickAction2Widget> {
  late QuickAction2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuickAction2Model());
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
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(24.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).divider,
          width: 1.0,
        ),
      ),
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 48.0,
              height: 48.0,
              decoration: BoxDecoration(
                color: valueOrDefault<Color>(
                  widget.bg,
                  const Color(0x00000000),
                ),
                borderRadius: BorderRadius.circular(9999.0),
              ),
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: Icon(
                Icons.favorite_rounded,
                color: valueOrDefault<Color>(
                  widget.color,
                  const Color(0x00000000),
                ),
                size: 24.0,
              ),
            ),
            Text(
              valueOrDefault<String>(
                widget.label,
                'Likes',
              ),
              style: FlutterFlowTheme.of(context).labelSmall.override(
                    font: GoogleFonts.plusJakartaSans(
                      fontWeight: FontWeight.bold,
                      fontStyle:
                          FlutterFlowTheme.of(context).labelSmall.fontStyle,
                    ),
                    color: FlutterFlowTheme.of(context).primaryText,
                    fontSize: 11.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.bold,
                    fontStyle:
                        FlutterFlowTheme.of(context).labelSmall.fontStyle,
                    lineHeight: 1.2,
                  ),
            ),
          ].divide(const SizedBox(height: 8.0)),
        ),
      ),
    ));
  }
}
