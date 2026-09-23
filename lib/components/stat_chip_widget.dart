import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'stat_chip_model.dart';
export 'stat_chip_model.dart';

class StatChipWidget extends StatefulWidget {
  const StatChipWidget({
    super.key,
    this.icon,
    this.color,
    this.label,
  });

  final String? icon;
  final Color? color;
  final String? label;

  @override
  State<StatChipWidget> createState() => _StatChipWidgetState();
}

class _StatChipWidgetState extends State<StatChipWidget> {
  late StatChipModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StatChipModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return genzFade(ClipRRect(
      borderRadius: BorderRadius.circular(9999.0),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 10.0,
          sigmaY: 10.0,
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0x10FFFFFF),
              borderRadius: BorderRadius.circular(9999.0),
              border: Border.all(
                color: const Color(0x20FFFFFF),
                width: 1.0,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.local_fire_department_rounded,
                  color: valueOrDefault<Color>(
                    widget.color,
                    const Color(0x00000000),
                  ),
                  size: 16.0,
                ),
                Text(
                  valueOrDefault<String>(
                    widget.label,
                    'Hot Streak: 12',
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
              ].divide(const SizedBox(width: 4.0)),
            ),
          ),
        ),
      ),
    ));
  }
}
