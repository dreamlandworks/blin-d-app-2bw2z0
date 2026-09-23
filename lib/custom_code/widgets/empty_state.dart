// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
// Imports other custom widgets
// Imports custom actions
// Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:google_fonts/google_fonts.dart';

class EmptyState extends StatefulWidget {
  const EmptyState({
    super.key,
    this.width,
    this.height,
    this.title,
    this.subtitle,
    this.buttonText,
    this.icon,
    this.iconColor,
    this.onButtonTap,
  });

  final double? width;
  final double? height;
  final String? title;
  final String? subtitle;
  final String? buttonText;
  final Widget? icon;
  final Color? iconColor;
  final Future Function()? onButtonTap;

  @override
  State<EmptyState> createState() => _EmptyStateState();
}

class _EmptyStateState extends State<EmptyState> {
  @override
  Widget build(BuildContext context) {
    final buttonLabel = valueOrDefault<String>(widget.buttonText, '');

    return Container(
      width: widget.width,
      height: widget.height,
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 88.0,
              height: 88.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primary10,
                shape: BoxShape.circle,
                border: Border.all(
                  color: FlutterFlowTheme.of(context).primary30,
                  width: 1.0,
                ),
              ),
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: widget.icon ??
                  Icon(
                    Icons.inbox_rounded,
                    color: valueOrDefault<Color>(
                      widget.iconColor,
                      FlutterFlowTheme.of(context).primary,
                    ),
                    size: 36.0,
                  ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  valueOrDefault<String>(
                    widget.title,
                    'Nothing here yet',
                  ),
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).titleMedium.override(
                        font: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontStyle: FlutterFlowTheme.of(context)
                              .titleMedium
                              .fontStyle,
                        ),
                        color: FlutterFlowTheme.of(context).primaryText,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleMedium.fontStyle,
                      ),
                ),
                Text(
                  valueOrDefault<String>(
                    widget.subtitle,
                    'When there is something to show, it will appear here.',
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.poppins(
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontStyle,
                        ),
                        color: FlutterFlowTheme.of(context).secondaryText,
                        letterSpacing: 0.0,
                        fontWeight: FlutterFlowTheme.of(context)
                            .bodyMedium
                            .fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                ),
              ].divide(const SizedBox(height: 8.0)),
            ),
            if (buttonLabel.isNotEmpty)
              FFButtonWidget(
                onPressed: () async {
                  await widget.onButtonTap?.call();
                },
                text: buttonLabel,
                options: FFButtonOptions(
                  width: 200.0,
                  height: 44.0,
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: GoogleFonts.poppins(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    fontWeight: FontWeight.w600,
                    fontSize: 14.0,
                  ),
                  elevation: 0.0,
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ),
          ].divide(const SizedBox(height: 16.0)),
        ),
      ),
    );
  }
}
