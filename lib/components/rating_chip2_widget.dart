import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'rating_chip2_model.dart';
export 'rating_chip2_model.dart';

class RatingChip2Widget extends StatefulWidget {
  const RatingChip2Widget({
    super.key,
    this.selected,
    this.emoji,
    this.label,
  });

  final bool? selected;
  final String? emoji;
  final String? label;

  @override
  State<RatingChip2Widget> createState() => _RatingChip2WidgetState();
}

class _RatingChip2WidgetState extends State<RatingChip2Widget> {
  late RatingChip2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RatingChip2Model());
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
        color: widget.selected!
            ? FlutterFlowTheme.of(context).primary
            : FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(
          color: widget.selected!
              ? FlutterFlowTheme.of(context).primary
              : FlutterFlowTheme.of(context).divider,
          width: 1.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(24.0, 16.0, 24.0, 16.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              valueOrDefault<String>(
                widget.emoji,
                '🔥',
              ),
              style: const TextStyle(
                fontSize: 22.0,
              ),
            ),
            Text(
              valueOrDefault<String>(
                widget.label,
                'Pure Fire',
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
                    color: widget.selected!
                        ? FlutterFlowTheme.of(context).primaryBackground
                        : FlutterFlowTheme.of(context).primaryText,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w600,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
            ),
          ].divide(const SizedBox(width: 16.0)),
        ),
      ),
    ));
  }
}
