import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'timer_badge_model.dart';
export 'timer_badge_model.dart';

class TimerBadgeWidget extends StatefulWidget {
  const TimerBadgeWidget({
    super.key,
    this.time_left,
  });

  final String? time_left;

  @override
  State<TimerBadgeWidget> createState() => _TimerBadgeWidgetState();
}

class _TimerBadgeWidgetState extends State<TimerBadgeWidget> {
  late TimerBadgeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TimerBadgeModel());
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
          sigmaX: 8.0,
          sigmaY: 8.0,
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
          child: Container(
            width: 80.0,
            height: 30.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primary,
              borderRadius: BorderRadius.circular(9999.0),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.timer_rounded,
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  size: 16.0,
                ),
                Text(
                  valueOrDefault<String>(
                    widget.time_left,
                    '02:45',
                  ),
                  style: FlutterFlowTheme.of(context).labelMedium.override(
                        font: GoogleFonts.urbanist(
                          fontWeight: FontWeight.w500,
                          fontStyle: FlutterFlowTheme.of(context)
                              .labelMedium
                              .fontStyle,
                        ),
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                        fontStyle:
                            FlutterFlowTheme.of(context).labelMedium.fontStyle,
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
