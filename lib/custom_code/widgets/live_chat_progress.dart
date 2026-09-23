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

import 'package:provider/provider.dart';

import '/custom_code/actions/rtdb_now_ms.dart' as rtdb_clock;

class LiveChatProgress extends StatefulWidget {
  const LiveChatProgress({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<LiveChatProgress> createState() => _LiveChatProgressState();
}

class _LiveChatProgressState extends State<LiveChatProgress> {
  Timer? _tick;

  double _ratio() {
    final endAt = FFAppState().chatEndTime;
    final startAt = FFAppState().startTime;
    final allottedState = FFAppState().endTime;
    final now = rtdb_clock.rtdbNowMs();
    var remaining = 0;
    if (endAt > 1000000000000) {
      remaining = endAt - now;
    }
    var allotted = 1200000;
    if (startAt > 1000000000000 && endAt > startAt) {
      allotted = endAt - startAt;
    } else if (allottedState > 1000 && allottedState <= 7200000) {
      allotted = allottedState;
    }
    if (remaining > allotted) {
      allotted = remaining;
    }
    if (allotted <= 0) {
      return 0.0;
    }
    final ratio = remaining / allotted;
    if (!ratio.isFinite) {
      return 0.0;
    }
    return ratio.clamp(0.0, 1.0);
  }

  int _remaining() {
    final endAt = FFAppState().chatEndTime;
    if (endAt <= 1000000000000) {
      return 0;
    }
    final left = endAt - rtdb_clock.rtdbNowMs();
    return left > 0 ? left : 0;
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
    context.watch<FFAppState>();
    final theme = FlutterFlowTheme.of(context);
    final remaining = _remaining();
    final color = remaining <= 120000
        ? theme.error
        : remaining <= 300000
            ? theme.accent1
            : theme.primary;
    final bg = remaining <= 300000 ? theme.warning : theme.primaryBackground;
    return SizedBox(
      width: widget.width ?? 260,
      height: widget.height ?? 10,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: LinearProgressIndicator(
          value: _ratio(),
          minHeight: widget.height ?? 10,
          color: color,
          backgroundColor: bg,
        ),
      ),
    );
  }
}
