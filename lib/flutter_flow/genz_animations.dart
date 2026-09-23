import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Shared motion used by pages and components. Wrappers never rename
/// existing fields — they only decorate the already-built widget tree.

Widget genzPage(Widget child) => _GenZEnter(
      slideY: 0.03,
      scaleBegin: 0.988,
      duration: const Duration(milliseconds: 320),
      child: child,
    );

Widget genzFade(Widget child) => _GenZEnter(
      slideY: 0.03,
      scaleBegin: 0.97,
      duration: const Duration(milliseconds: 340),
      child: child,
    );

Widget genzSheet(Widget child) => _GenZEnter(
      slideY: 0.08,
      scaleBegin: 1.0,
      duration: const Duration(milliseconds: 360),
      curve: Curves.easeOutCubic,
      child: child,
    );

Widget genzTap(Widget child) => GenZPressScale(
      child: _GenZEnter(
        slideY: 0.05,
        scaleBegin: 0.95,
        duration: const Duration(milliseconds: 360),
        curve: Curves.easeOutBack,
        child: child,
      ),
    );

Widget genzButton(Widget child) => GenZPressScale(
      minScale: 0.94,
      haptic: true,
      child: child,
    );

Widget genzPageTransitionsBuilder(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  final enter = CurvedAnimation(
    parent: animation,
    curve: Curves.easeOutCubic,
    reverseCurve: Curves.easeInCubic,
  );
  final exit = CurvedAnimation(
    parent: secondaryAnimation,
    curve: Curves.easeInCubic,
  );
  return FadeTransition(
    opacity: Tween<double>(begin: 0.0, end: 1.0).animate(enter),
    child: SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0.04, 0.06),
        end: Offset.zero,
      ).animate(enter),
      child: ScaleTransition(
        scale: Tween<double>(begin: 0.97, end: 1.0).animate(enter),
        child: FadeTransition(
          opacity: Tween<double>(begin: 1.0, end: 0.88).animate(exit),
          child: ScaleTransition(
            scale: Tween<double>(begin: 1.0, end: 0.98).animate(exit),
            child: child,
          ),
        ),
      ),
    ),
  );
}

class GenZPressScale extends StatefulWidget {
  const GenZPressScale({
    super.key,
    required this.child,
    this.minScale = 0.96,
    this.haptic = false,
  });

  final Widget child;
  final double minScale;
  final bool haptic;

  @override
  State<GenZPressScale> createState() => _GenZPressScaleState();
}

class _GenZPressScaleState extends State<GenZPressScale> {
  double _scale = 1.0;
  Offset? _downPosition;

  void _setScale(double value) {
    if (_scale == value) return;
    setState(() => _scale = value);
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      behavior: HitTestBehavior.deferToChild,
      onPointerDown: (event) {
        _downPosition = event.position;
        _setScale(widget.minScale);
        if (widget.haptic) {
          HapticFeedback.selectionClick();
        }
      },
      onPointerMove: (event) {
        if (_downPosition != null &&
            (event.position - _downPosition!).distance > 12) {
          _setScale(1.0);
        }
      },
      onPointerUp: (_) {
        _downPosition = null;
        _setScale(1.0);
      },
      onPointerCancel: (_) {
        _downPosition = null;
        _setScale(1.0);
      },
      child: AnimatedScale(
        scale: _scale,
        duration: Duration(milliseconds: _scale < 1 ? 90 : 180),
        curve: _scale < 1 ? Curves.easeOut : Curves.easeOutBack,
        child: widget.child,
      ),
    );
  }
}

class _GenZEnter extends StatefulWidget {
  const _GenZEnter({
    required this.child,
    this.slideY = 0.04,
    this.scaleBegin = 0.98,
    this.duration = const Duration(milliseconds: 400),
    this.curve = Curves.easeOutCubic,
  });

  final Widget child;
  final double slideY;
  final double scaleBegin;
  final Duration duration;
  final Curve curve;

  @override
  State<_GenZEnter> createState() => _GenZEnterState();
}

class _GenZEnterState extends State<_GenZEnter>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _t;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _t = CurvedAnimation(parent: _controller, curve: widget.curve);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _t,
      builder: (context, child) {
        final value = _t.value;
        return Opacity(
          opacity: value.clamp(0.0, 1.0),
          child: Transform.translate(
            offset: Offset(0, (1 - value) * widget.slideY * 140),
            child: Transform.scale(
              scale: widget.scaleBegin +
                  ((1 - widget.scaleBegin) * value),
              child: child,
            ),
          ),
        );
      },
      child: widget.child,
    );
  }
}
