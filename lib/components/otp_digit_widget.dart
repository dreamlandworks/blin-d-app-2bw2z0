import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'otp_digit_model.dart';
export 'otp_digit_model.dart';

class OtpDigitWidget extends StatefulWidget {
  const OtpDigitWidget({
    super.key,
    this.active,
    this.digit,
  });

  final bool? active;
  final double? digit;

  @override
  State<OtpDigitWidget> createState() => _OtpDigitWidgetState();
}

class _OtpDigitWidgetState extends State<OtpDigitWidget> {
  late OtpDigitModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OtpDigitModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return genzFade(Container(
      width: 64.0,
      height: 72.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(24.0),
        border: Border.all(
          color: widget.active!
              ? FlutterFlowTheme.of(context).primary
              : FlutterFlowTheme.of(context).divider,
          width: 2.0,
        ),
      ),
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Text(
        valueOrDefault<String>(
          widget.digit?.toString(),
          '4',
        ),
        style: FlutterFlowTheme.of(context).headlineMedium.override(
              font: GoogleFonts.plusJakartaSans(
                fontWeight: FontWeight.bold,
                fontStyle:
                    FlutterFlowTheme.of(context).headlineMedium.fontStyle,
              ),
              color: widget.active!
                  ? FlutterFlowTheme.of(context).primaryText
                  : FlutterFlowTheme.of(context).hint,
              fontSize: 28.0,
              letterSpacing: 0.0,
              fontWeight: FontWeight.bold,
              fontStyle: FlutterFlowTheme.of(context).headlineMedium.fontStyle,
              lineHeight: 1.2,
            ),
      ),
    ));
  }
}
