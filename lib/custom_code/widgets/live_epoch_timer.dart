// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
// Imports other custom widgets
// Imports custom actions
// Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async';

import 'package:google_fonts/google_fonts.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

import '/custom_code/actions/rtdb_now_ms.dart' as rtdb_clock;

class LiveEpochTimer extends StatefulWidget {
  const LiveEpochTimer({
    super.key,
    this.width,
    this.height,
    this.endTime,
  });

  final double? width;
  final double? height;
  final int? endTime;

  @override
  State<LiveEpochTimer> createState() => _LiveEpochTimerState();
}

class _LiveEpochTimerState extends State<LiveEpochTimer> {
  Timer? _tick;

  int _remaining() {
    final endAt = widget.endTime ?? 0;
    if (endAt > 1000000000000) {
      final left = endAt - rtdb_clock.rtdbNowMs();
      return left > 0 ? left : 0;
    }
    return endAt > 0 ? endAt : 0;
  }

  @override
  void initState() {
    super.initState();
    rtdb_clock.rtdbNowMsAction();
    _tick = Timer.periodic(const Duration(seconds: 1), (_) {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _tick?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowTheme.of(context);
    final text = Text(
      StopWatchTimer.getDisplayTime(
        _remaining(),
        hours: false,
        milliSecond: false,
      ),
      textAlign: TextAlign.start,
      style: theme.headlineLarge.override(
        font: GoogleFonts.spaceGrotesk(
          fontWeight: theme.headlineLarge.fontWeight,
          fontStyle: theme.headlineLarge.fontStyle,
        ),
        color: theme.primary,
        letterSpacing: 0.0,
        fontWeight: theme.headlineLarge.fontWeight,
        fontStyle: theme.headlineLarge.fontStyle,
        lineHeight: 1.4,
      ),
    );
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Align(
        alignment: Alignment.centerLeft,
        child: text,
      ),
    );
  }
}
