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
import 'dart:math' as math;

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '/custom_code/actions/expire_cooldown_if_due.dart';
import '/custom_code/actions/rtdb_now_ms.dart' as rtdb_clock;

String _formatTimerHms(int milliseconds, {bool showSeconds = true}) {
  // Always HH:MM:SS. showSeconds is kept so FlutterFlow bindings still compile.
  final ms = milliseconds < 0 ? 0 : milliseconds;
  final totalSec = ms ~/ 1000;
  final hours = (totalSec ~/ 3600).toString().padLeft(2, '0');
  final minutes = ((totalSec % 3600) ~/ 60).toString().padLeft(2, '0');
  final seconds = (totalSec % 60).toString().padLeft(2, '0');
  return '$hours:$minutes:$seconds';
}

class LiveEpochTimer extends StatefulWidget {
  const LiveEpochTimer({
    super.key,
    this.width,
    this.height,
    this.endTime,
    this.activeSlotIndex,
    this.showSeconds = true,
  });

  final double? width;
  final double? height;

  /// Epoch ms (slot start / cooldownUntil) or leftover remaining ms.
  final int? endTime;

  /// Dashboard slot index. Negative / null means use [endTime] or cooldown.
  final int? activeSlotIndex;

  /// Kept for FlutterFlow bindings. Display is always HH:MM:SS.
  final bool showSeconds;

  @override
  State<LiveEpochTimer> createState() => _LiveEpochTimerState();
}

class _LiveEpochTimerState extends State<LiveEpochTimer> {
  Timer? _tick;
  bool _expireRequested = false;

  int _endAt() {
    final ready = FFAppState().onReady;
    final idx = widget.activeSlotIndex;
    if (ready.readyStatus == 'active' && idx != null && idx >= 0) {
      final slotEnd = ready.slotStartTimer.elementAtOrNull(idx) ?? 0;
      if (slotEnd > 1000000000000) {
        return slotEnd;
      }
    }
    final bound = widget.endTime ?? 0;
    if (bound > 0) {
      return bound;
    }
    return ready.cooldownUntil;
  }

  int _remaining() {
    final endAt = _endAt();
    if (endAt > 1000000000000) {
      final left = endAt - rtdb_clock.rtdbNowMs();
      return left > 0 ? left : 0;
    }
    return endAt > 0 ? endAt : 0;
  }

  int _totalMs() {
    final ready = FFAppState().onReady;
    if (ready.readyStatus == 'active') {
      return const Duration(hours: 24).inMilliseconds;
    }
    return FFAppState().isPremium
        ? const Duration(hours: 3).inMilliseconds
        : const Duration(hours: 20).inMilliseconds;
  }

  void _maybeExpireCooldown(int remaining) {
    if (_expireRequested) {
      return;
    }
    if (FFAppState().onReady.readyStatus != 'cooldown') {
      return;
    }
    if (remaining > 0) {
      return;
    }
    _expireRequested = true;
    unawaited(expireCooldownIfDue().then((did) {
      if (!did && mounted) {
        _expireRequested = false;
      }
    }));
  }

  @override
  void initState() {
    super.initState();
    rtdb_clock.rtdbNowMsAction();
    _maybeExpireCooldown(_remaining());
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
    _maybeExpireCooldown(remaining);
    final total = _totalMs();
    final progress =
        total <= 0 ? 0.0 : (remaining / total).clamp(0.0, 1.0);
    final dim = math.min(
      widget.width ?? 220.0,
      widget.height ?? 220.0,
    );

    return SizedBox(
      width: widget.width ?? dim,
      height: widget.height ?? dim,
      child: CustomPaint(
        painter: _CooldownRingPainter(
          progress: progress,
          track: const Color(0xFFE9D5E8),
          start: theme.secondary,
          end: theme.primary,
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.hourglass_bottom_rounded,
                  color: theme.primary,
                  size: 34.0,
                ),
                const SizedBox(height: 8.0),
                Text(
                  _formatTimerHms(remaining, showSeconds: true),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  style: theme.headlineLarge.override(
                    font: GoogleFonts.robotoFlex(
                      fontWeight: FontWeight.w700,
                      fontStyle: theme.headlineLarge.fontStyle,
                    ),
                    color: theme.primaryText,
                    fontSize: 28.0,
                    letterSpacing: 1.2,
                    fontWeight: FontWeight.w700,
                    fontStyle: theme.headlineLarge.fontStyle,
                    lineHeight: 1.1,
                  ),
                ),
                const SizedBox(height: 6.0),
                Text(
                  'HOURS  |  MINS  |  SECS',
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  style: theme.labelSmall.override(
                    font: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontStyle: theme.labelSmall.fontStyle,
                    ),
                    color: theme.secondaryText,
                    fontSize: 9.0,
                    letterSpacing: 1.1,
                    fontWeight: FontWeight.w600,
                    fontStyle: theme.labelSmall.fontStyle,
                    lineHeight: 1.2,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CooldownRingPainter extends CustomPainter {
  _CooldownRingPainter({
    required this.progress,
    required this.track,
    required this.start,
    required this.end,
  });

  final double progress;
  final Color track;
  final Color start;
  final Color end;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width, size.height) / 2 - 9.0;
    final rect = Rect.fromCircle(center: center, radius: radius);

    canvas.drawCircle(
      center,
      radius,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 10.0
        ..color = track,
    );

    if (progress <= 0) {
      return;
    }

    final sweep = 2 * math.pi * progress;
    canvas.drawArc(
      rect,
      -math.pi / 2,
      sweep,
      false,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 10.0
        ..strokeCap = StrokeCap.round
        ..shader = SweepGradient(
          startAngle: 0,
          endAngle: 2 * math.pi,
          colors: [start, end, start],
          transform: const GradientRotation(-math.pi / 2),
        ).createShader(rect),
    );
  }

  @override
  bool shouldRepaint(covariant _CooldownRingPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.track != track ||
        oldDelegate.start != start ||
        oldDelegate.end != end;
  }
}
