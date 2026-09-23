import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'glowing_orb_model.dart';
export 'glowing_orb_model.dart';

class GlowingOrbWidget extends StatefulWidget {
  const GlowingOrbWidget({
    super.key,
    this.size,
    this.color,
    this.blur,
  });

  final double? size;
  final Color? color;
  final double? blur;

  @override
  State<GlowingOrbWidget> createState() => _GlowingOrbWidgetState();
}

class _GlowingOrbWidgetState extends State<GlowingOrbWidget> {
  late GlowingOrbModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GlowingOrbModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.6,
      child: Container(
        width: widget.size,
        height: widget.size,
        decoration: BoxDecoration(
          color: widget.color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
