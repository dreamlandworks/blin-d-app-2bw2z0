import '/auth/firebase_auth/auth_util.dart';
import '/components/accept_reveal_sheet_widget.dart';
import '/components/pop_up_confirm_widget.dart';
import '/components/reveal_item2_widget.dart';
import '/components/reveal_item_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'reveal_option_model.dart';
export 'reveal_option_model.dart';

class RevealOptionWidget extends StatefulWidget {
  const RevealOptionWidget({
    super.key,
    required this.chatID,
    required this.requestId,
    required this.incomingDocId,
    required this.senderUid,
  });

  final String? chatID;
  final String? requestId;
  final String? incomingDocId;
  final String? senderUid;

  static String routeName = 'RevealOption';
  static String routePath = '/revealOption';

  @override
  State<RevealOptionWidget> createState() => _RevealOptionWidgetState();
}

class _RevealOptionWidgetState extends State<RevealOptionWidget> {
  late RevealOptionModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RevealOptionModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await showDialog(
        context: context,
        builder: (dialogContext) {
          return Dialog(
            elevation: 0,
            insetPadding: EdgeInsets.zero,
            backgroundColor: Colors.transparent,
            alignment: const AlignmentDirectional(0.0, 0.0)
                .resolve(Directionality.of(context)),
            child: const PopUpConfirmWidget(
              headLine: 'You Received a Reveal Request',
              message:
                  'Are you ready to accept the request? You will also see the partner details once accept the request',
              confirmTxt: 'Proceed',
              cancel: 'Reject',
            ),
          );
        },
      );
      if (!mounted) return;
      if (FFAppState().confirm == true) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Select the fields you want to share..',
              style: GoogleFonts.robotoFlex(
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
            duration: const Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).secondary,
          ),
        );
      } else {
        _model.revealResponse = await actions.callRevealAction(
          widget.requestId!,
          widget.senderUid!,
          widget.chatID!,
          'reject',
          FFAppState().revealList.toList(),
        );
      }
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return genzPage(Builder(
      builder: (context) => Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            primary: false,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF9333EA), Color(0xFFEC4899)],
                        stops: [0.0, 1.0],
                        begin: AlignmentDirectional(1.0, 1.0),
                        end: AlignmentDirectional(-1.0, -1.0),
                      ),
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FlutterFlowIconButton(
                            buttonSize: 40.0,
                            icon: Icon(
                              Icons.arrow_back_ios_new_rounded,
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              size: 20.0,
                            ),
                            onPressed: () async {
                              context.pushNamed(
                                ActiveChatPageWidget.routeName,
                                queryParameters: {
                                  'chatID': serializeParam(
                                    widget.chatID,
                                    ParamType.String,
                                  ),
                                  'iceBreakers': serializeParam(
                                    '',
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                              );
                            },
                          ),
                          Container(
                            height: 4.0,
                          ),
                          Text(
                            'Reveal Secret',
                            style: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .override(
                                  font: GoogleFonts.plusJakartaSans(
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineMedium
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  fontSize: 28.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .fontStyle,
                                  lineHeight: 1.2,
                                ),
                          ),
                          Opacity(
                            opacity: 0.9,
                            child: Text(
                              'Select the information you want to share with your partner. Only checked items will be visible.',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.spaceGrotesk(
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    fontSize: 15.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                    lineHeight: 1.5,
                                  ),
                            ),
                          ),
                        ].divide(const SizedBox(height: 8.0)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(
                      24.0, 0.0, 24.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 0.0, 0.0, 10.0),
                        child: Text(
                          'Personal Info',
                          style:
                              FlutterFlowTheme.of(context).labelSmall.override(
                                    font: GoogleFonts.plusJakartaSans(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .fontStyle,
                                    lineHeight: 1.2,
                                  ),
                        ),
                      ),
                      if (currentUserDocument?.photoFilePaths.gcsUrl != null &&
                          currentUserDocument?.photoFilePaths.gcsUrl != '')
                        AuthUserStreamWidget(
                          builder: (context) => InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().revealList.contains('photo') ==
                                  true) {
                                FFAppState().addToRevealList('photo');
                                safeSetState(() {});
                              } else {
                                FFAppState().removeFromRevealList('photo');
                                safeSetState(() {});
                              }
                            },
                            child: wrapWithModel(
                              model: _model.revealItemModel1,
                              updateCallback: () => safeSetState(() {}),
                              child: RevealItemWidget(
                                selected:
                                    FFAppState().revealList.contains('photo') ==
                                        true,
                                icon: Icon(
                                  Icons.account_circle,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 40.0,
                                ),
                                title: 'Profile Photo',
                                value: 'Your high-quality main photo',
                              ),
                            ),
                          ),
                        ),
                      if (currentUserDocument?.realId.fullName != null &&
                          currentUserDocument?.realId.fullName != '')
                        AuthUserStreamWidget(
                          builder: (context) => InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState()
                                      .revealList
                                      .contains('full_name') ==
                                  true) {
                                FFAppState().addToRevealList('full_name');
                                safeSetState(() {});
                              } else {
                                FFAppState().removeFromRevealList('full_name');
                                safeSetState(() {});
                              }
                            },
                            child: wrapWithModel(
                              model: _model.revealItemModel2,
                              updateCallback: () => safeSetState(() {}),
                              child: RevealItemWidget(
                                selected: FFAppState()
                                        .revealList
                                        .contains('full_name') ==
                                    true,
                                icon: Icon(
                                  Icons.person,
                                  color: FlutterFlowTheme.of(context).secondary,
                                  size: 40.0,
                                ),
                                title: 'Full Name',
                                value: valueOrDefault<String>(
                                  currentUserDocument?.realId.fullName,
                                  'Alex Riverra',
                                ),
                              ),
                            ),
                          ),
                        ),
                      if (currentPhoneNumber != '')
                        AuthUserStreamWidget(
                          builder: (context) => InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().revealList.contains('phone') ==
                                  true) {
                                FFAppState().addToRevealList('phone');
                                safeSetState(() {});
                              } else {
                                FFAppState().removeFromRevealList('phone');
                                safeSetState(() {});
                              }
                            },
                            child: wrapWithModel(
                              model: _model.revealItemModel3,
                              updateCallback: () => safeSetState(() {}),
                              child: RevealItemWidget(
                                selected:
                                    FFAppState().revealList.contains('phone') ==
                                        true,
                                icon: Icon(
                                  Icons.phone,
                                  color: FlutterFlowTheme.of(context).success,
                                  size: 35.0,
                                ),
                                title: 'Phone Number',
                                value: valueOrDefault<String>(
                                  currentPhoneNumber,
                                  '+(100)34344',
                                ),
                              ),
                            ),
                          ),
                        ),
                      if (currentUserEmail != '')
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            if (FFAppState().revealList.contains('email') ==
                                true) {
                              FFAppState().addToRevealList('email');
                              safeSetState(() {});
                            } else {
                              FFAppState().removeFromRevealList('email');
                              safeSetState(() {});
                            }
                          },
                          child: wrapWithModel(
                            model: _model.revealItemModel4,
                            updateCallback: () => safeSetState(() {}),
                            child: RevealItemWidget(
                              selected:
                                  FFAppState().revealList.contains('email') ==
                                      true,
                              icon: Icon(
                                Icons.email_outlined,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 35.0,
                              ),
                              title: 'Email Address',
                              value: valueOrDefault<String>(
                                currentUserEmail,
                                'riverra@nomail.com',
                              ),
                            ),
                          ),
                        ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 0.0, 0.0, 10.0),
                        child: Text(
                          'Social Connections',
                          style: FlutterFlowTheme.of(context)
                              .labelSmall
                              .override(
                                font: GoogleFonts.plusJakartaSans(
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelSmall
                                      .fontStyle,
                                ),
                                color: FlutterFlowTheme.of(context).secondary,
                                fontSize: 18.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .labelSmall
                                    .fontStyle,
                                lineHeight: 1.2,
                              ),
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          if (FFAppState().revealList.contains('social') ==
                              true) {
                            FFAppState().addToRevealList('social');
                            safeSetState(() {});
                          } else {
                            FFAppState().removeFromRevealList('social');
                            safeSetState(() {});
                          }
                        },
                        child: wrapWithModel(
                          model: _model.revealItem2Model,
                          updateCallback: () => safeSetState(() {}),
                          child: const RevealItem2Widget(
                            selected: false,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 24.0, 0.0, 24.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0x1A9333EA),
                            borderRadius: BorderRadius.circular(16.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).secondary,
                              width: 1.0,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.security_rounded,
                                  color: FlutterFlowTheme.of(context).secondary,
                                  size: 20.0,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    'This reveal is one-time only. They cannot see updates to this info later.',
                                    style: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          font: GoogleFonts.spaceGrotesk(
                                            fontWeight: FontWeight.normal,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmall
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 13.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmall
                                                  .fontStyle,
                                          lineHeight: 1.4,
                                        ),
                                  ),
                                ),
                              ].divide(const SizedBox(width: 16.0)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                  ),
                  child: Builder(
                    builder: (context) => Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          21.0, 0.0, 21.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          _model.revealAcceptResponse =
                              await actions.callRevealAction(
                            widget.requestId!,
                            widget.senderUid!,
                            widget.chatID!,
                            'accept',
                            FFAppState().revealList.toList(),
                          );
                          if (!context.mounted) return;
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Request Confirmed Successfully',
                                style: GoogleFonts.poppins(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 16.0,
                                ),
                              ),
                              duration: const Duration(milliseconds: 4000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).secondary,
                            ),
                          );
                          await showDialog(
                            context: context,
                            builder: (dialogContext) {
                              return Dialog(
                                elevation: 0,
                                insetPadding: EdgeInsets.zero,
                                backgroundColor: Colors.transparent,
                                alignment: const AlignmentDirectional(0.0, 0.0)
                                    .resolve(Directionality.of(context)),
                                child: AcceptRevealSheetWidget(
                                  partnerUid: widget.senderUid!,
                                  fields: FFAppState().revealList,
                                  chatId: widget.chatID,
                                ),
                              );
                            },
                          );

                          safeSetState(() {});
                        },
                        text: 'Reveal Now',
                        icon: const Icon(
                          Icons.bolt_rounded,
                          size: 24.0,
                        ),
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 56.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconAlignment: IconAlignment.end,
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle: GoogleFonts.plusJakartaSans(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            fontWeight: FontWeight.w600,
                            fontSize: 16.0,
                          ),
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 24.0,
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
