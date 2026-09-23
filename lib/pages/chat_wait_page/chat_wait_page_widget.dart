import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'chat_wait_page_model.dart';
export 'chat_wait_page_model.dart';

class ChatWaitPageWidget extends StatefulWidget {
  const ChatWaitPageWidget({
    super.key,
    this.handShakeID,
    this.slotFolder,
  });

  final String? handShakeID;
  final String? slotFolder;

  static String routeName = 'ChatWaitPage';
  static String routePath = '/chatWaitPage';

  @override
  State<ChatWaitPageWidget> createState() => _ChatWaitPageWidgetState();
}

class _ChatWaitPageWidgetState extends State<ChatWaitPageWidget> {
  late ChatWaitPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatWaitPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      final handshakeID = (widget.handShakeID?.trim().isNotEmpty ?? false)
          ? widget.handShakeID!.trim()
          : FFAppState().fcmHandShake.trim();
      final slotFolder = (widget.slotFolder?.trim().isNotEmpty ?? false)
          ? widget.slotFolder!.trim()
          : FFAppState().fcmSlotID.trim();
      if (handshakeID.isEmpty || slotFolder.isEmpty) {
        if (FFAppState().chatId.isNotEmpty) {
          if (!mounted) return;
          context.goNamed(
            'ActiveChatPage',
            queryParameters: {'chatID': FFAppState().chatId},
          );
        }
        return;
      }
      await actions.watchHandshakeStatus(
        context,
        handshakeID,
        slotFolder,
      );
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return genzPage(GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Lottie.asset(
                  'assets/jsons/Loading_Bloob.json',
                  width: 200.0,
                  height: 200.0,
                  fit: BoxFit.contain,
                  animate: true,
                ),
              ),
              Text(
                'Waiting for your Partner..',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).titleLarge.override(
                      font: GoogleFonts.poppins(
                        fontWeight:
                            FlutterFlowTheme.of(context).titleLarge.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleLarge.fontStyle,
                      ),
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).titleLarge.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).titleLarge.fontStyle,
                    ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
