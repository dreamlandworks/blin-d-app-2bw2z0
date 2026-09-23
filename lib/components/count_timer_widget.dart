import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'count_timer_model.dart';
export 'count_timer_model.dart';

class CountTimerWidget extends StatefulWidget {
  const CountTimerWidget({
    super.key,
    this.isTomorrow,
    this.initialTime,
  });

  final bool? isTomorrow;
  final int? initialTime;

  @override
  State<CountTimerWidget> createState() => _CountTimerWidgetState();
}

class _CountTimerWidgetState extends State<CountTimerWidget> {
  late CountTimerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CountTimerModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.timerController.onStartTimer();
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return genzFade(Visibility(
      visible: widget.isTomorrow == false,
      child: FlutterFlowTimer(
        initialTime: widget.initialTime!,
        getDisplayTime: (value) =>
            StopWatchTimer.getDisplayTime(value, milliSecond: false),
        controller: _model.timerController,
        updateStateInterval: const Duration(milliseconds: 1000),
        onChanged: (value, displayTime, shouldUpdate) {
          _model.timerMilliseconds = value;
          _model.timerValue = displayTime;
          if (shouldUpdate) safeSetState(() {});
        },
        textAlign: TextAlign.start,
        style: FlutterFlowTheme.of(context).headlineSmall.override(
              font: GoogleFonts.urbanist(
                fontWeight:
                    FlutterFlowTheme.of(context).headlineSmall.fontWeight,
                fontStyle: FlutterFlowTheme.of(context).headlineSmall.fontStyle,
              ),
              color: FlutterFlowTheme.of(context).primary,
              fontSize: 14.0,
              letterSpacing: 0.0,
              fontWeight: FlutterFlowTheme.of(context).headlineSmall.fontWeight,
              fontStyle: FlutterFlowTheme.of(context).headlineSmall.fontStyle,
            ),
      ),
    ));
  }
}
