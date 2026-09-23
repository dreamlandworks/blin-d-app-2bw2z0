import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'manifest_text_model.dart';
export 'manifest_text_model.dart';

class ManifestTextWidget extends StatefulWidget {
  const ManifestTextWidget({
    super.key,
    this.line1,
    this.line2,
    this.line3,
    this.line4,
  });

  final String? line1;
  final String? line2;
  final String? line3;
  final String? line4;

  @override
  State<ManifestTextWidget> createState() => _ManifestTextWidgetState();
}

class _ManifestTextWidgetState extends State<ManifestTextWidget> {
  late ManifestTextModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ManifestTextModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return genzFade(Align(
      alignment: const AlignmentDirectional(0.0, -1.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Opacity(
            opacity: 0.6,
            child: Text(
              valueOrDefault<String>(
                widget.line1,
                'No Fakes.',
              ),
              style: FlutterFlowTheme.of(context).headlineLarge.override(
                    font: GoogleFonts.spaceGrotesk(
                      fontWeight: FontWeight.w500,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineLarge.fontStyle,
                    ),
                    color: FlutterFlowTheme.of(context).primaryText,
                    fontSize: 30.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w500,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineLarge.fontStyle,
                    lineHeight: 1.1,
                  ),
            ),
          ),
          Opacity(
            opacity: 0.75,
            child: Text(
              valueOrDefault<String>(
                widget.line2,
                'No Faces.',
              ),
              style: FlutterFlowTheme.of(context).headlineLarge.override(
                    font: GoogleFonts.spaceGrotesk(
                      fontWeight: FontWeight.w500,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineLarge.fontStyle,
                    ),
                    color: FlutterFlowTheme.of(context).primaryText,
                    fontSize: 30.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w500,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineLarge.fontStyle,
                    lineHeight: 1.1,
                  ),
            ),
          ),
          Opacity(
            opacity: 0.9,
            child: Text(
              valueOrDefault<String>(
                widget.line3,
                'No Swipes.',
              ),
              style: FlutterFlowTheme.of(context).headlineLarge.override(
                    font: GoogleFonts.spaceGrotesk(
                      fontWeight: FontWeight.w500,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineLarge.fontStyle,
                    ),
                    color: FlutterFlowTheme.of(context).primaryText,
                    fontSize: 30.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w500,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineLarge.fontStyle,
                    lineHeight: 1.1,
                  ),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: GradientText(
              valueOrDefault<String>(
                widget.line4,
                'ONLY HEARTS',
              ),
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).headlineLarge.override(
                    font: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineLarge.fontStyle,
                    ),
                    color: FlutterFlowTheme.of(context).primaryText,
                    fontSize: 52.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w500,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineLarge.fontStyle,
                    lineHeight: 1.1,
                  ),
              colors: [
                FlutterFlowTheme.of(context).primary,
                FlutterFlowTheme.of(context).secondary
              ],
              gradientDirection: GradientDirection.ltr,
              gradientType: GradientType.linear,
            ),
          ),
        ].divide(const SizedBox(height: 14.0)),
      ),
    ));
  }
}
