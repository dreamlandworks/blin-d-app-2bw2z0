import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'interested_chip_model.dart';
export 'interested_chip_model.dart';

class InterestedChipWidget extends StatefulWidget {
  const InterestedChipWidget({
    super.key,
    this.icon,
    this.label,
    this.selected,
  });

  final Widget? icon;
  final String? label;
  final bool? selected;

  @override
  State<InterestedChipWidget> createState() => _InterestedChipWidgetState();
}

class _InterestedChipWidgetState extends State<InterestedChipWidget> {
  late InterestedChipModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InterestedChipModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return genzTap(Container(
      constraints: const BoxConstraints(
        minWidth: 100.0,
      ),
      decoration: BoxDecoration(
        color: const Color(0x3DEC4899),
        borderRadius: BorderRadius.circular(9999.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).primaryBackground,
          width: 1.5,
        ),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(8.0, 10.0, 10.0, 10.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              valueOrDefault<String>(
                widget.label,
                'Music',
              ),
              style: FlutterFlowTheme.of(context).labelLarge.override(
                    font: GoogleFonts.urbanist(
                      fontWeight:
                          FlutterFlowTheme.of(context).labelLarge.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).labelLarge.fontStyle,
                    ),
                    color: FlutterFlowTheme.of(context).primary,
                    fontSize: 14.0,
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).labelLarge.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).labelLarge.fontStyle,
                  ),
            ),
          ].divide(const SizedBox(width: 5.0)),
        ),
      ),
    ));
  }
}
