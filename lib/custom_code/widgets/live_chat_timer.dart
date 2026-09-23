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
import 'package:provider/provider.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

import '/custom_code/actions/rtdb_now_ms.dart' as rtdb_clock;
import '/custom_code/actions/expire_active_chat.dart';

class LiveChatTimer extends StatefulWidget {
  const LiveChatTimer({
    super.key,
    this.width,
    this.height,
    this.endTime,
  });

  final double? width;
  final double? height;
  final int? endTime;

  @override
  State<LiveChatTimer> createState() => _LiveChatTimerState();
}

class _LiveChatTimerState extends State<LiveChatTimer> {
  Timer? _tick;
  bool _expiryStarted = false;

  int _remaining() {
    final now = rtdb_clock.rtdbNowMs();
    final rawEnd = FFAppState().chatEndTime > 1000000000000
        ? FFAppState().chatEndTime
        : (widget.endTime ?? 0);
    final endAt = rawEnd.toInt();
    if (endAt > 1000000000000) {
      final left = endAt - now;
      return left > 0 ? left : 0;
    }
    final leftover = FFAppState().endTime.toInt();
    return leftover > 0 ? leftover : 0;
  }

  @override
  void initState() {
    super.initState();
    rtdb_clock.rtdbNowMsAction();
    _tick = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!mounted) {
        return;
      }
      setState(() {});
      final left = _remaining();
      if (left <= 0 &&
          !_expiryStarted &&
          FFAppState().chatEndTime > 1000000000000) {
        _expiryStarted = true;
        expireActiveChat();
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
    context.watch<FFAppState>();
    final theme = FlutterFlowTheme.of(context);
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Align(
        alignment: Alignment.center,
        child: Text(
          StopWatchTimer.getDisplayTime(
            _remaining(),
            hours: false,
            milliSecond: false,
          ),
          textAlign: TextAlign.center,
          maxLines: 1,
          style: theme.headlineSmall.override(
            font: GoogleFonts.urbanist(
              fontWeight: theme.headlineSmall.fontWeight,
              fontStyle: theme.headlineSmall.fontStyle,
            ),
            color: theme.primary,
            fontSize: 14.0,
            letterSpacing: 0.0,
            fontWeight: theme.headlineSmall.fontWeight,
            fontStyle: theme.headlineSmall.fontStyle,
          ),
        ),
      ),
    );
  }
}
