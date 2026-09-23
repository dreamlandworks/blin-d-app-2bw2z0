import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'social_tag_model.dart';
export 'social_tag_model.dart';

class SocialTagWidget extends StatefulWidget {
  const SocialTagWidget({
    super.key,
    this.bg,
    this.color,
    required this.icon,
    required this.lable,
  });

  final Color? bg;
  final Color? color;
  final Widget? icon;
  final String? lable;

  @override
  State<SocialTagWidget> createState() => _SocialTagWidgetState();
}

class _SocialTagWidgetState extends State<SocialTagWidget> {
  late SocialTagModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SocialTagModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return genzFade(Container(
      decoration: BoxDecoration(
        color: valueOrDefault<Color>(
          widget.bg,
          const Color(0x00000000),
        ),
        borderRadius: BorderRadius.circular(9999.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).divider,
          width: 1.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(24.0, 8.0, 24.0, 8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            widget.icon!,
            Text(
              valueOrDefault<String>(
                widget.lable,
                '@Alex',
              ),
              style: FlutterFlowTheme.of(context).labelMedium.override(
                    font: GoogleFonts.urbanist(
                      fontWeight: FontWeight.bold,
                      fontStyle:
                          FlutterFlowTheme.of(context).labelMedium.fontStyle,
                    ),
                    color: valueOrDefault<Color>(
                      widget.color,
                      const Color(0x00000000),
                    ),
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.bold,
                    fontStyle:
                        FlutterFlowTheme.of(context).labelMedium.fontStyle,
                  ),
            ),
          ].divide(const SizedBox(width: 8.0)),
        ),
      ),
    ));
  }
}
