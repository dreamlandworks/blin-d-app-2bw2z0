import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'otp_digit2_model.dart';
export 'otp_digit2_model.dart';

class OtpDigit2Widget extends StatefulWidget {
  const OtpDigit2Widget({
    super.key,
    this.active,
    this.value,
  });

  final bool? active;
  final double? value;

  @override
  State<OtpDigit2Widget> createState() => _OtpDigit2WidgetState();
}

class _OtpDigit2WidgetState extends State<OtpDigit2Widget> {
  late OtpDigit2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OtpDigit2Model());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return genzFade(Container(
      width: 54.0,
      height: 64.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(16.0),
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
          widget.value?.toString(),
          '4',
        ),
        style: FlutterFlowTheme.of(context).headlineMedium.override(
              font: GoogleFonts.plusJakartaSans(
                fontWeight: FontWeight.bold,
                fontStyle:
                    FlutterFlowTheme.of(context).headlineMedium.fontStyle,
              ),
              color: FlutterFlowTheme.of(context).primaryText,
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
