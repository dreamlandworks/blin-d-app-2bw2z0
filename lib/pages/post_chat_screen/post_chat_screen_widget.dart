import '/auth/firebase_auth/auth_util.dart';
import '/components/feedback_tag_widget.dart';
import '/components/metric_stat_widget.dart';
import '/components/rating_chip_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'post_chat_screen_model.dart';
export 'post_chat_screen_model.dart';

class PostChatScreenWidget extends StatefulWidget {
  const PostChatScreenWidget({
    super.key,
    this.survey,
    String? chatID,
  }) : chatID = chatID ?? 'chatID';

  final bool? survey;
  final String chatID;

  static String routeName = 'postChatScreen';
  static String routePath = '/postChatScreen';

  @override
  State<PostChatScreenWidget> createState() => _PostChatScreenWidgetState();
}

class _PostChatScreenWidgetState extends State<PostChatScreenWidget> {
  late PostChatScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PostChatScreenModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return genzPage(Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        top: true,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            primary: false,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 110.0, 0.0),
                          child: Container(
                            width: 80.0,
                            height: 80.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(9999.0),
                              border: Border.all(
                                color: const Color(0x5EEC4899),
                                width: 3.0,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(9999.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(9999.0),
                                  ),
                                  child: Stack(
                                    children: [
                                      AuthUserStreamWidget(
                                        builder: (context) =>
                                            CachedNetworkImage(
                                          fadeInDuration:
                                              const Duration(milliseconds: 0),
                                          fadeOutDuration:
                                              const Duration(milliseconds: 0),
                                          imageUrl: valueOrDefault<String>(
                                            currentUserPhoto,
                                            'https://dimg.dreamflow.cloud/v1/image/beautiful young woman smiling portrait aesthetic',
                                          ),
                                          width: 80.0,
                                          height: 80.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              110.0, 0.0, 0.0, 0.0),
                          child: Container(
                            width: 80.0,
                            height: 80.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(9999.0),
                              border: Border.all(
                                color: const Color(0x5DEC4899),
                                width: 3.0,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(9999.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(9999.0),
                                  ),
                                  child: Stack(
                                    children: [
                                      ClipRect(
                                        child: ImageFiltered(
                                          imageFilter: ImageFilter.blur(
                                            sigmaX: valueOrDefault<double>(
                                              FFAppState().chatStats.isRevealed
                                                  ? 0.0
                                                  : 10.0,
                                              0.0,
                                            ),
                                            sigmaY: valueOrDefault<double>(
                                              FFAppState().chatStats.isRevealed
                                                  ? 0.0
                                                  : 10.0,
                                              0.0,
                                            ),
                                          ),
                                          child: CachedNetworkImage(
                                            fadeInDuration:
                                                const Duration(milliseconds: 0),
                                            fadeOutDuration:
                                                const Duration(milliseconds: 0),
                                            imageUrl: valueOrDefault<String>(
                                              FFAppState().partnerData.pPhoto,
                                              'https://dimg.dreamflow.cloud/v1/image/beautiful young woman smiling portrait aesthetic',
                                            ),
                                            width: 80.0,
                                            height: 80.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Material(
                          color: Colors.transparent,
                          elevation: 2.0,
                          shape: const CircleBorder(),
                          child: Container(
                            width: 45.0,
                            height: 45.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 10.0,
                                  color: FlutterFlowTheme.of(context).primary,
                                  offset: const Offset(
                                    0.0,
                                    2.0,
                                  ),
                                )
                              ],
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.flash_on_sharp,
                              color: FlutterFlowTheme.of(context).accent1,
                              size: 30.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'How was your chat?',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .override(
                                font: GoogleFonts.plusJakartaSans(
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .fontStyle,
                                ),
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 28.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .fontStyle,
                                lineHeight: 1.2,
                              ),
                        ),
                        Text(
                          'Your feedback helps us keep the vibes immaculate',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                font: GoogleFonts.spaceGrotesk(
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                fontSize: 15.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.normal,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                                lineHeight: 1.5,
                              ),
                        ),
                      ].divide(const SizedBox(height: 4.0)),
                    ),
                  ].divide(const SizedBox(height: 16.0)),
                ),
                Material(
                  color: Colors.transparent,
                  elevation: 2.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 5.0,
                          color: Color(0x2AEC4899),
                          offset: Offset(
                            0.0,
                            5.0,
                          ),
                        )
                      ],
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 16.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Match Score',
                                style: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .override(
                                      font: GoogleFonts.urbanist(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .fontStyle,
                                    ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 10.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    RichText(
                                      textScaler:
                                          MediaQuery.of(context).textScaler,
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: valueOrDefault<String>(
                                              FFAppState()
                                                  .chatStats
                                                  .matchScore
                                                  .toString(),
                                              '74%',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .headlineMedium
                                                .override(
                                                  font: GoogleFonts.urbanist(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .headlineMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .headlineMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                          const TextSpan(
                                            text: ' ',
                                            style: TextStyle(),
                                          ),
                                          const TextSpan(
                                            text: '💖',
                                            style: TextStyle(
                                              fontSize: 18.0,
                                            ),
                                          )
                                        ],
                                        style: FlutterFlowTheme.of(context)
                                            .headlineMedium
                                            .override(
                                              font: GoogleFonts.urbanist(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineMedium
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ].divide(const SizedBox(height: 10.0)),
                          ),
                        ),
                        SizedBox(
                          width: 300.0,
                          child: Divider(
                            thickness: 2.0,
                            color: FlutterFlowTheme.of(context).alternate,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 10.0, 8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              wrapWithModel(
                                model: _model.metricStatModel1,
                                updateCallback: () => safeSetState(() {}),
                                child: MetricStatWidget(
                                  color: FlutterFlowTheme.of(context).primary,
                                  trend: '',
                                  value: valueOrDefault<double>(
                                    FFAppState()
                                        .chatStats
                                        .msgCountMe
                                        .toDouble(),
                                    25.0,
                                  ),
                                  label: 'Sent',
                                ),
                              ),
                              SizedBox(
                                height: 50.0,
                                child: VerticalDivider(
                                  thickness: 2.0,
                                  color: FlutterFlowTheme.of(context).alternate,
                                ),
                              ),
                              wrapWithModel(
                                model: _model.metricStatModel2,
                                updateCallback: () => safeSetState(() {}),
                                child: MetricStatWidget(
                                  color: FlutterFlowTheme.of(context).secondary,
                                  value: valueOrDefault<double>(
                                    FFAppState()
                                        .chatStats
                                        .msgCountPartner
                                        .toDouble(),
                                    25.0,
                                  ),
                                  label: 'Recevied',
                                  labeltop: 'Messages',
                                ),
                              ),
                              SizedBox(
                                height: 50.0,
                                child: VerticalDivider(
                                  thickness: 2.0,
                                  color: FlutterFlowTheme.of(context).alternate,
                                ),
                              ),
                              wrapWithModel(
                                model: _model.metricStatModel3,
                                updateCallback: () => safeSetState(() {}),
                                child: MetricStatWidget(
                                  color: FlutterFlowTheme.of(context).accent1,
                                  value: valueOrDefault<double>(
                                    FFAppState()
                                        .chatStats
                                        .msgCountAll
                                        .toDouble(),
                                    25.0,
                                  ),
                                  label: 'Messages',
                                  labeltop: 'Total',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Rate the vibe',
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
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        _model.selectedVibe = 'fire';
                        safeSetState(() {});
                      },
                      child: wrapWithModel(
                        model: _model.ratingChipModel1,
                        updateCallback: () => safeSetState(() {}),
                        child: RatingChipWidget(
                          selected: _model.selectedVibe == 'fire',
                          emoji: '🔥',
                          label: 'Pure Fire',
                        ),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        _model.selectedVibe = 'energy';
                        safeSetState(() {});
                      },
                      child: wrapWithModel(
                        model: _model.ratingChipModel2,
                        updateCallback: () => safeSetState(() {}),
                        child: RatingChipWidget(
                          selected: _model.selectedVibe == 'energy',
                          emoji: '✨',
                          label: 'Good Energy',
                        ),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        _model.selectedVibe = 'cold';
                        safeSetState(() {});
                      },
                      child: wrapWithModel(
                        model: _model.ratingChipModel3,
                        updateCallback: () => safeSetState(() {}),
                        child: RatingChipWidget(
                          selected: _model.selectedVibe == 'cold',
                          emoji: '🧊',
                          label: 'A Bit Cold',
                        ),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        _model.selectedVibe = 'flag';
                        safeSetState(() {});
                      },
                      child: wrapWithModel(
                        model: _model.ratingChipModel4,
                        updateCallback: () => safeSetState(() {}),
                        child: RatingChipWidget(
                          selected: _model.selectedVibe == 'flag',
                          emoji: '🚩',
                          label: 'Red Flags',
                        ),
                      ),
                    ),
                  ].divide(const SizedBox(height: 16.0)),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'What stood out?',
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
                    Wrap(
                      spacing: 8.0,
                      runSpacing: 8.0,
                      alignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.start,
                      direction: Axis.horizontal,
                      runAlignment: WrapAlignment.start,
                      verticalDirection: VerticalDirection.down,
                      clipBehavior: Clip.none,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            if (_model.stoodOut.contains('great listener') ==
                                true) {
                              _model.removeFromStoodOut('great listener');
                              safeSetState(() {});
                            } else {
                              _model.addToStoodOut('great listener');
                              safeSetState(() {});
                            }
                          },
                          child: wrapWithModel(
                            model: _model.feedbackTagModel1,
                            updateCallback: () => safeSetState(() {}),
                            child: FeedbackTagWidget(
                              active:
                                  _model.stoodOut.contains('great listener') ==
                                      true,
                              label: 'Great Listener',
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            if (_model.stoodOut.contains('funny af') == true) {
                              _model.removeFromStoodOut('funny af');
                              safeSetState(() {});
                            } else {
                              _model.addToStoodOut('funny af');
                              safeSetState(() {});
                            }
                          },
                          child: wrapWithModel(
                            model: _model.feedbackTagModel2,
                            updateCallback: () => safeSetState(() {}),
                            child: FeedbackTagWidget(
                              active:
                                  _model.stoodOut.contains('funny af') == true,
                              label: 'Funny af',
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            if (_model.stoodOut.contains('respectful') ==
                                true) {
                              _model.removeFromStoodOut('respectful');
                              safeSetState(() {});
                            } else {
                              _model.addToStoodOut('respectful');
                              safeSetState(() {});
                            }
                          },
                          child: wrapWithModel(
                            model: _model.feedbackTagModel3,
                            updateCallback: () => safeSetState(() {}),
                            child: FeedbackTagWidget(
                              active: _model.stoodOut.contains('respectful') ==
                                  true,
                              label: 'Respectful',
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            if (_model.stoodOut.contains('fast replies') ==
                                true) {
                              _model.removeFromStoodOut('fast replies');
                              safeSetState(() {});
                            } else {
                              _model.addToStoodOut('fast replies');
                              safeSetState(() {});
                            }
                          },
                          child: wrapWithModel(
                            model: _model.feedbackTagModel4,
                            updateCallback: () => safeSetState(() {}),
                            child: FeedbackTagWidget(
                              active:
                                  _model.stoodOut.contains('fast replies') ==
                                      true,
                              label: 'Fast Replies',
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            if (_model.stoodOut.contains('deep talk') == true) {
                              _model.removeFromStoodOut('deep talk');
                              safeSetState(() {});
                            } else {
                              _model.addToStoodOut('deep talk');
                              safeSetState(() {});
                            }
                          },
                          child: wrapWithModel(
                            model: _model.feedbackTagModel5,
                            updateCallback: () => safeSetState(() {}),
                            child: FeedbackTagWidget(
                              active:
                                  _model.stoodOut.contains('deep talk') == true,
                              label: 'Deep Talk',
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            if (_model.stoodOut.contains('common interests') ==
                                true) {
                              _model.removeFromStoodOut('common interests');
                              safeSetState(() {});
                            } else {
                              _model.addToStoodOut('common interests');
                              safeSetState(() {});
                            }
                          },
                          child: wrapWithModel(
                            model: _model.feedbackTagModel6,
                            updateCallback: () => safeSetState(() {}),
                            child: FeedbackTagWidget(
                              active: _model.stoodOut
                                      .contains('common interests') ==
                                  true,
                              label: 'Common Interests',
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            if (_model.stoodOut.contains('witty') == true) {
                              _model.removeFromStoodOut('witty');
                              safeSetState(() {});
                            } else {
                              _model.addToStoodOut('witty');
                              safeSetState(() {});
                            }
                          },
                          child: wrapWithModel(
                            model: _model.feedbackTagModel7,
                            updateCallback: () => safeSetState(() {}),
                            child: FeedbackTagWidget(
                              active: _model.stoodOut.contains('witty') == true,
                              label: 'Witty',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ].divide(const SizedBox(height: 16.0)),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Anything else? (Optional)',
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
                    TextFormField(
                      controller: _model.textController,
                      focusNode: _model.textFieldFocusNode,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: 'Spill the tea...',
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        filled: true,
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      style: const TextStyle(),
                      maxLines: 4,
                      validator:
                          _model.textControllerValidator.asValidator(context),
                    ),
                  ].divide(const SizedBox(height: 16.0)),
                ),
                if (widget.survey == true)
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 4.0,
                          color: Color(0x1A000000),
                          offset: Offset(
                            0.0,
                            2.0,
                          ),
                          spreadRadius: 0.0,
                        )
                      ],
                      gradient: LinearGradient(
                        colors: [
                          FlutterFlowTheme.of(context).secondary,
                          FlutterFlowTheme.of(context).primary
                        ],
                        stops: const [0.0, 1.0],
                        begin: const AlignmentDirectional(1.0, 0.0),
                        end: const AlignmentDirectional(-1.0, 0),
                      ),
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0x33FFFFFF),
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.savings_rounded,
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                size: 24.0,
                              ),
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
                                  'Earn 50 Coins',
                                  style: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .override(
                                        font: GoogleFonts.plusJakartaSans(
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelLarge
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
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
                                  'Complete this survey to boost your balance',
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
                                            .primaryBackground,
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
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                        ].divide(const SizedBox(width: 16.0)),
                      ),
                    ),
                  ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 32.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FFButtonWidget(
                        onPressed: () async {
                          _model.feedResp = await actions.postChatFeedback(
                            widget.chatID,
                            _model.selectedVibe,
                            _model.stoodOut.toList(),
                            _model.feedback,
                          );
                          if (!context.mounted) return;
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Your feedback successfully submitted..',
                                style: GoogleFonts.robotoFlex(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 14.0,
                                ),
                              ),
                              duration: const Duration(milliseconds: 4000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).secondary,
                            ),
                          );

                          context.goNamed(DashboardWidget.routeName);

                          safeSetState(() {});
                        },
                        text: 'Submit Feedback',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 56.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
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
                      FFButtonWidget(
                        onPressed: () async {
                          context.goNamed(DashboardWidget.routeName);
                        },
                        text: 'Skip for now',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 44.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: Colors.transparent,
                          textStyle: GoogleFonts.plusJakartaSans(
                            color: FlutterFlowTheme.of(context).secondaryText,
                            fontWeight: FontWeight.w600,
                            fontSize: 14.0,
                          ),
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ].divide(const SizedBox(height: 16.0)),
                  ),
                ),
              ].divide(const SizedBox(height: 32.0)),
            ),
          ),
        ),
      ),
    ));
  }
}
