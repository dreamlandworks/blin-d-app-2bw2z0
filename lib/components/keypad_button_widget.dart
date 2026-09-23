import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'keypad_button_model.dart';
export 'keypad_button_model.dart';

class KeypadButtonWidget extends StatefulWidget {
  const KeypadButtonWidget({
    super.key,
    this.label,
  });

  final double? label;

  @override
  State<KeypadButtonWidget> createState() => _KeypadButtonWidgetState();
}

class _KeypadButtonWidgetState extends State<KeypadButtonWidget> {
  late KeypadButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => KeypadButtonModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return genzTap(Container(
      width: 80.0,
      height: 80.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9999.0),
      ),
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Text(
        valueOrDefault<String>(
          widget.label?.toString(),
          '1',
        ),
        style: FlutterFlowTheme.of(context).titleLarge.override(
              font: GoogleFonts.plusJakartaSans(
                fontWeight: FontWeight.bold,
                fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
              ),
              color: FlutterFlowTheme.of(context).primaryText,
              fontSize: 22.0,
              letterSpacing: 0.0,
              fontWeight: FontWeight.bold,
              fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
              lineHeight: 1.3,
            ),
      ),
    ));
  }
}
