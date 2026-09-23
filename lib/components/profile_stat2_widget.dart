import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'profile_stat2_model.dart';
export 'profile_stat2_model.dart';

class ProfileStat2Widget extends StatefulWidget {
  const ProfileStat2Widget({
    super.key,
    this.value,
    this.label,
  });

  final double? value;
  final String? label;

  @override
  State<ProfileStat2Widget> createState() => _ProfileStat2WidgetState();
}

class _ProfileStat2WidgetState extends State<ProfileStat2Widget> {
  late ProfileStat2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileStat2Model());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return genzFade(Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          valueOrDefault<String>(
            widget.value?.toString(),
            '124',
          ),
          style: FlutterFlowTheme.of(context).titleLarge.override(
                font: GoogleFonts.plusJakartaSans(
                  fontWeight: FontWeight.w800,
                  fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                ),
                color: FlutterFlowTheme.of(context).primaryText,
                fontSize: 22.0,
                letterSpacing: 0.0,
                fontWeight: FontWeight.w800,
                fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                lineHeight: 1.3,
              ),
        ),
        Text(
          valueOrDefault<String>(
            widget.label,
            'MATCHES',
          ),
          style: FlutterFlowTheme.of(context).labelSmall.override(
                font: GoogleFonts.spaceGrotesk(
                  fontWeight: FontWeight.bold,
                  fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                ),
                color: FlutterFlowTheme.of(context).secondaryText,
                fontSize: 11.0,
                letterSpacing: 0.0,
                fontWeight: FontWeight.bold,
                fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                lineHeight: 1.2,
              ),
        ),
      ].divide(const SizedBox(height: 4.0)),
    ));
  }
}
