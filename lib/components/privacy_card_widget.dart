import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'privacy_card_model.dart';
export 'privacy_card_model.dart';

class PrivacyCardWidget extends StatefulWidget {
  const PrivacyCardWidget({
    super.key,
    this.type,
    this.icon,
    this.title,
    this.subtitle,
  });

  final String? type;
  final String? icon;
  final String? title;
  final String? subtitle;

  @override
  State<PrivacyCardWidget> createState() => _PrivacyCardWidgetState();
}

class _PrivacyCardWidgetState extends State<PrivacyCardWidget> {
  late PrivacyCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PrivacyCardModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return genzFade(Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(24.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).divider,
            width: 1.0,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 44.0,
                height: 44.0,
                decoration: BoxDecoration(
                  color: widget.type == 'danger'
                      ? const Color(0x1AEF4444)
                      : const Color(0x1A9333EA),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Icon(
                  Icons.block_rounded,
                  color: widget.type == 'danger'
                      ? FlutterFlowTheme.of(context).error
                      : FlutterFlowTheme.of(context).secondary,
                  size: 22.0,
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      valueOrDefault<String>(
                        widget.title,
                        'Blocked Contacts',
                      ),
                      style: FlutterFlowTheme.of(context).labelLarge.override(
                            font: GoogleFonts.plusJakartaSans(
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .labelLarge
                                  .fontStyle,
                            ),
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontSize: 15.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                            fontStyle: FlutterFlowTheme.of(context)
                                .labelLarge
                                .fontStyle,
                            lineHeight: 1.3,
                          ),
                    ),
                    Text(
                      valueOrDefault<String>(
                        widget.subtitle,
                        'Manage 12 users you\'ve restricted',
                      ),
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                            font: GoogleFonts.spaceGrotesk(
                              fontWeight: FontWeight.normal,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .fontStyle,
                            ),
                            color: FlutterFlowTheme.of(context).secondaryText,
                            fontSize: 13.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.normal,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodySmall
                                .fontStyle,
                            lineHeight: 1.4,
                          ),
                    ),
                  ].divide(const SizedBox(height: 4.0)),
                ),
              ),
              Icon(
                Icons.chevron_right_rounded,
                color: FlutterFlowTheme.of(context).hint,
                size: 20.0,
              ),
            ].divide(const SizedBox(width: 16.0)),
          ),
        ),
      ),
    ));
  }
}
