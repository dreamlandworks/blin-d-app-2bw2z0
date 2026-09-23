import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'feedback_tag2_model.dart';
export 'feedback_tag2_model.dart';

class FeedbackTag2Widget extends StatefulWidget {
  const FeedbackTag2Widget({
    super.key,
    this.active,
    this.label,
  });

  final bool? active;
  final String? label;

  @override
  State<FeedbackTag2Widget> createState() => _FeedbackTag2WidgetState();
}

class _FeedbackTag2WidgetState extends State<FeedbackTag2Widget> {
  late FeedbackTag2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FeedbackTag2Model());
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
        color: widget.active! ? const Color(0x22EC4899) : Colors.transparent,
        borderRadius: BorderRadius.circular(9999.0),
        border: Border.all(
          color: widget.active!
              ? FlutterFlowTheme.of(context).primary
              : FlutterFlowTheme.of(context).divider,
          width: 1.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
        child: Text(
          valueOrDefault<String>(
            widget.label,
            'Great Listener',
          ),
          style: FlutterFlowTheme.of(context).labelMedium.override(
                font: GoogleFonts.urbanist(
                  fontWeight:
                      FlutterFlowTheme.of(context).labelMedium.fontWeight,
                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                ),
                color: widget.active!
                    ? FlutterFlowTheme.of(context).primary
                    : FlutterFlowTheme.of(context).secondaryText,
                letterSpacing: 0.0,
                fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
              ),
        ),
      ),
    ));
  }
}
