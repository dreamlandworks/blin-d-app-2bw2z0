import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pop_up_navigate_model.dart';
export 'pop_up_navigate_model.dart';

class PopUpNavigateWidget extends StatefulWidget {
  const PopUpNavigateWidget({
    super.key,
    this.imagePath,
    String? headLine,
    String? message,
    String? confirmTxt,
    this.pageName,
  })  : headLine = headLine ?? 'Reveal Request',
        message = message ??
            'Alex is curious! They\'ve requested to reveal your hidden profile details.',
        confirmTxt = confirmTxt ?? 'Accept & Reveal';

  final String? imagePath;
  final String headLine;
  final String message;
  final String confirmTxt;
  final String? pageName;

  @override
  State<PopUpNavigateWidget> createState() => _PopUpNavigateWidgetState();
}

class _PopUpNavigateWidgetState extends State<PopUpNavigateWidget> {
  late PopUpNavigateModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PopUpNavigateModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return genzSheet(Container(
      width: 320.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        boxShadow: const [
          BoxShadow(
            blurRadius: 16.0,
            color: Color(0x1A000000),
            offset: Offset(
              0.0,
              8.0,
            ),
            spreadRadius: 0.0,
          )
        ],
        borderRadius: BorderRadius.circular(24.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).divider,
          width: 1.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (widget.imagePath != null && widget.imagePath != '')
              ClipRRect(
                borderRadius: BorderRadius.circular(9999.0),
                child: Container(
                  width: 80.0,
                  height: 80.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9999.0),
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).primary,
                      width: 3.0,
                    ),
                  ),
                  child: CachedNetworkImage(
                    fadeInDuration: const Duration(milliseconds: 0),
                    fadeOutDuration: const Duration(milliseconds: 0),
                    imageUrl:
                        widget.imagePath != null && widget.imagePath != ''
                            ? widget.imagePath!
                            : '',
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  widget.headLine,
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).titleLarge.override(
                        font: GoogleFonts.plusJakartaSans(
                          fontWeight: FontWeight.bold,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleLarge.fontStyle,
                        ),
                        color: FlutterFlowTheme.of(context).primaryText,
                        fontSize: 22.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleLarge.fontStyle,
                        lineHeight: 1.3,
                      ),
                ),
                Text(
                  widget.message,
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.spaceGrotesk(
                          fontWeight: FontWeight.normal,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        color: FlutterFlowTheme.of(context).secondaryText,
                        fontSize: 15.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.normal,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        lineHeight: 1.5,
                      ),
                ),
              ].divide(const SizedBox(height: 8.0)),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                FFButtonWidget(
                  onPressed: () async {
                    if (widget.pageName == ' coins') {
                      context.pushNamed(CoinShopWidget.routeName);
                    } else {
                      context.pushNamed(WaitPageWidget.routeName);
                    }

                    Navigator.pop(context);
                  },
                  text: widget.confirmTxt,
                  options: FFButtonOptions(
                    height: 44.0,
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: GoogleFonts.plusJakartaSans(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      fontWeight: FontWeight.w600,
                      fontSize: 14.0,
                    ),
                    elevation: 0.0,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
              ].divide(const SizedBox(height: 8.0)),
            ),
          ].divide(const SizedBox(height: 24.0)),
        ),
      ),
    ));
  }
}
