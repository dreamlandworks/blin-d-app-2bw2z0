import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'chat_bubble_me_model.dart';
export 'chat_bubble_me_model.dart';

class ChatBubbleMeWidget extends StatefulWidget {
  const ChatBubbleMeWidget({
    super.key,
    this.message,
    this.time,
  });

  final String? message;
  final String? time;

  @override
  State<ChatBubbleMeWidget> createState() => _ChatBubbleMeWidgetState();
}

class _ChatBubbleMeWidgetState extends State<ChatBubbleMeWidget> {
  late ChatBubbleMeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatBubbleMeModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              constraints: const BoxConstraints(
                maxWidth: 280.0,
              ),
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primary,
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 2.0,
                    color: Color(0x1A000000),
                    offset: Offset(
                      0.0,
                      1.0,
                    ),
                    spreadRadius: 0.0,
                  )
                ],
                borderRadius: BorderRadius.circular(24.0),
                border: Border.all(
                  color: const Color(0x00F3F4F6),
                  width: 1.0,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  valueOrDefault<String>(
                    widget.message,
                    'Hey there! I saw we matched. Your bio is so cryptic lol',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.spaceGrotesk(
                          fontWeight: FontWeight.normal,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        fontSize: 15.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.normal,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        lineHeight: 1.5,
                      ),
                ),
              ),
            ),
            Text(
              valueOrDefault<String>(
                widget.time,
                '10:02 PM',
              ),
              style: FlutterFlowTheme.of(context).labelSmall.override(
                    font: GoogleFonts.plusJakartaSans(
                      fontWeight: FontWeight.bold,
                      fontStyle:
                          FlutterFlowTheme.of(context).labelSmall.fontStyle,
                    ),
                    color: FlutterFlowTheme.of(context).secondaryText,
                    fontSize: 11.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.bold,
                    fontStyle:
                        FlutterFlowTheme.of(context).labelSmall.fontStyle,
                    lineHeight: 1.2,
                  ),
            ),
          ].divide(const SizedBox(height: 4.0)),
        ),
      ].divide(const SizedBox(width: 16.0)),
    );
  }
}
