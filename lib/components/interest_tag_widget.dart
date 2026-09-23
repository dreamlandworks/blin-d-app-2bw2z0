import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'interest_tag_model.dart';
export 'interest_tag_model.dart';

class InterestTagWidget extends StatefulWidget {
  const InterestTagWidget({
    super.key,
    this.icon,
    this.label,
  });

  final Widget? icon;
  final String? label;

  @override
  State<InterestTagWidget> createState() => _InterestTagWidgetState();
}

class _InterestTagWidgetState extends State<InterestTagWidget> {
  late InterestTagModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InterestTagModel());
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
        color: const Color(0x15EC4899),
        borderRadius: BorderRadius.circular(9999.0),
        border: Border.all(
          color: const Color(0x33EC4899),
          width: 1.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            widget.icon!,
            Text(
              valueOrDefault<String>(
                widget.label,
                'Techno',
              ),
              style: FlutterFlowTheme.of(context).labelMedium.override(
                    font: GoogleFonts.plusJakartaSans(
                      fontWeight: FontWeight.w600,
                      fontStyle:
                          FlutterFlowTheme.of(context).labelMedium.fontStyle,
                    ),
                    color: FlutterFlowTheme.of(context).primary,
                    fontSize: 13.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w600,
                    fontStyle:
                        FlutterFlowTheme.of(context).labelMedium.fontStyle,
                    lineHeight: 1.3,
                  ),
            ),
          ].divide(const SizedBox(width: 4.0)),
        ),
      ),
    ));
  }
}
