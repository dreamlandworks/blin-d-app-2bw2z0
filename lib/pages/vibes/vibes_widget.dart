import '/components/active_chat_block_widget.dart';
import '/components/active_reveal_widget.dart';
import '/components/nav_item_widget.dart';
import '/components/permanent_chat_widget.dart';
import '/components/reveal_card_widget.dart';
import '/components/tab_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'vibes_model.dart';
export 'vibes_model.dart';

class VibesWidget extends StatefulWidget {
  const VibesWidget({super.key});

  static String routeName = 'Vibes';
  static String routePath = '/vibes';

  @override
  State<VibesWidget> createState() => _VibesWidgetState();
}

class _VibesWidgetState extends State<VibesWidget> {
  late VibesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VibesModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.revealsList = await actions.getMyRevealedUsersList();
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

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        top: true,
        child: Stack(
          children: [
            Padding(
              padding:
                  const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 100.0),
              child: SingleChildScrollView(
                primary: false,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          24.0, 24.0, 24.0, 16.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 30.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.safePop();
                              },
                              child: Icon(
                                Icons.keyboard_arrow_left,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 30.0,
                              ),
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Vibe Check',
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
                                          .primaryText,
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
                                'Your digital orbit',
                                style: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      font: GoogleFonts.spaceGrotesk(
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      fontSize: 13.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .fontStyle,
                                      lineHeight: 1.4,
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          24.0, 0.0, 24.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                _model.isVibe = true;
                                safeSetState(() {});
                              },
                              child: wrapWithModel(
                                model: _model.tabItemModel1,
                                updateCallback: () => safeSetState(() {}),
                                child: TabItemWidget(
                                  selected: _model.isVibe,
                                  label: 'Vibes',
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                _model.isVibe = false;
                                safeSetState(() {});
                              },
                              child: wrapWithModel(
                                model: _model.tabItemModel2,
                                updateCallback: () => safeSetState(() {}),
                                child: TabItemWidget(
                                  selected: !_model.isVibe,
                                  label: 'Reveals',
                                ),
                              ),
                            ),
                          ),
                        ].divide(const SizedBox(width: 16.0)),
                      ),
                    ),
                    Visibility(
                      visible: _model.isVibe,
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: SingleChildScrollView(
                          primary: false,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 8.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.auto_awesome_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 18.0,
                                        ),
                                        Text(
                                          'MYSTERIOUS VIBES',
                                          style: FlutterFlowTheme.of(context)
                                              .labelLarge
                                              .override(
                                                font:
                                                    GoogleFonts.plusJakartaSans(
                                                  fontWeight: FontWeight.w800,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelLarge
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                fontSize: 15.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w800,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelLarge
                                                        .fontStyle,
                                                lineHeight: 1.3,
                                              ),
                                        ),
                                      ].divide(const SizedBox(width: 8.0)),
                                    ),
                                    if (FFAppState().onReady.readyStatus ==
                                        'active')
                                      Container(
                                        decoration: BoxDecoration(
                                          color: const Color(0x2200F5FF),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(8.0, 4.0, 8.0, 4.0),
                                          child: Text(
                                            FFAppState().onReady.readyStatus,
                                            style: FlutterFlowTheme.of(context)
                                                .labelSmall
                                                .override(
                                                  font: GoogleFonts
                                                      .plusJakartaSans(
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelSmall
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .accent1,
                                                  fontSize: 11.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelSmall
                                                          .fontStyle,
                                                  lineHeight: 1.2,
                                                ),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                              if (FFAppState().onReady.readyStatus ==
                                  'chatting')
                                wrapWithModel(
                                  model: _model.activeChatBlockModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: ActiveChatBlockWidget(
                                    displayName: FFAppState().partnerData.pName,
                                    timeLeft: (((FFAppState().chatEndTime -
                                                    getCurrentTimestamp
                                                        .millisecondsSinceEpoch) /
                                                1000) /
                                            60)
                                        .toString(),
                                    lastMessage: FFAppState().lastMessage,
                                  ),
                                ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 8.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'PERMANENT VIBES',
                                      style: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            font: GoogleFonts.plusJakartaSans(
                                              fontWeight: FontWeight.w800,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            fontSize: 15.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w800,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelLarge
                                                    .fontStyle,
                                            lineHeight: 1.3,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              if (getJsonField(
                                    _model.revealsList,
                                    r'''$.perm_connections''',
                                  ) !=
                                  null)
                                Builder(
                                  builder: (context) {
                                    final permConnection = getJsonField(
                                      _model.revealsList,
                                      r'''$.perm_connections''',
                                    ).toList();

                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: permConnection.length,
                                      itemBuilder:
                                          (context, permConnectionIndex) {
                                        final permConnectionItem =
                                            permConnection[permConnectionIndex];
                                        return wrapWithModel(
                                          model: _model.permanentChatModels
                                              .getModel(
                                            permConnectionItem.toString(),
                                            permConnectionIndex,
                                          ),
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: PermanentChatWidget(
                                            key: Key(
                                              'Keyze9_${permConnectionItem.toString()}',
                                            ),
                                            imgDesc:
                                                'cool gen z girl neon aesthetic',
                                            online: true,
                                            name: getJsonField(
                                              permConnectionItem,
                                              r'''$.full_name''',
                                            ).toString(),
                                            time: dateTimeFormat("relative",
                                                FFAppState().permMessage.ts),
                                            isSent: true,
                                            message:
                                                FFAppState().permMessage.text,
                                            unreadCount: 1.0,
                                            isRead: 'yes',
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                            ].divide(const SizedBox(height: 10.0)),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          20.0, 0.0, 20.0, 0.0),
                      child: Container(
                        width: 100.0,
                        decoration: const BoxDecoration(),
                        child: Visibility(
                          visible: !_model.isVibe,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 15.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.auto_awesome_outlined,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 24.0,
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              5.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'NEW REVEALS',
                                        style: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .override(
                                              font: GoogleFonts.plusJakartaSans(
                                                fontWeight: FontWeight.w800,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelLarge
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w800,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .fontStyle,
                                              lineHeight: 1.3,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              if (getJsonField(
                                    _model.revealsList,
                                    r'''$.reveals[0].full_name''',
                                  ) !=
                                  null)
                                wrapWithModel(
                                  model: _model.activeRevealModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: ActiveRevealWidget(
                                    name: getJsonField(
                                      _model.revealsList,
                                      r'''$.reveals[0].full_name''',
                                    ).toString(),
                                    age: getJsonField(
                                      _model.revealsList,
                                      r'''$.reveals[0].age''',
                                    ),
                                    description: getJsonField(
                                      _model.revealsList,
                                      r'''$.reveals[0].description''',
                                    ).toString(),
                                    photo: getJsonField(
                                      _model.revealsList,
                                      r'''$.reveals[0].photo''',
                                    ).toString(),
                                    partnerId: getJsonField(
                                      _model.revealsList,
                                      r'''$.reveals[0].partner_uid''',
                                    ).toString(),
                                  ),
                                ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 15.0, 0.0, 15.0),
                                child: Text(
                                  'PAST REVEALS',
                                  style: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .override(
                                        font: GoogleFonts.plusJakartaSans(
                                          fontWeight: FontWeight.w800,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelLarge
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 15.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w800,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .fontStyle,
                                        lineHeight: 1.3,
                                      ),
                                ),
                              ),
                              if (getJsonField(
                                    _model.revealsList,
                                    r'''$.reveals[0].full_name''',
                                  ) !=
                                  null)
                                Builder(
                                  builder: (context) {
                                    final getMyReveals = getJsonField(
                                      _model.revealsList,
                                      r'''$.reveals''',
                                    ).toList();

                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: getMyReveals.length,
                                      itemBuilder:
                                          (context, getMyRevealsIndex) {
                                        final getMyRevealsItem =
                                            getMyReveals[getMyRevealsIndex];
                                        return wrapWithModel(
                                          model:
                                              _model.revealCardModels.getModel(
                                            getMyRevealsIndex.toString(),
                                            getMyRevealsIndex,
                                          ),
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: RevealCardWidget(
                                            key: Key(
                                              'Keydxt_${getMyRevealsIndex.toString()}',
                                            ),
                                            revealed: true,
                                            imgDesc: getJsonField(
                                              getMyRevealsItem,
                                              r'''$.photo''',
                                            ).toString(),
                                            name: getJsonField(
                                              getMyRevealsItem,
                                              r'''$.full_name''',
                                            ).toString(),
                                            isNew: getMyRevealsIndex <= 3,
                                            status: getJsonField(
                                              getMyRevealsItem,
                                              r'''$.description''',
                                            ).toString(),
                                            date: getJsonField(
                                              getMyRevealsItem,
                                              r'''$.revealed_at''',
                                            ).toString(),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                            ].divide(const SizedBox(height: 8.0)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(0.0, 1.0),
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(
                      20.0, 0.0, 20.0, 15.0),
                  child: Material(
                    color: Colors.transparent,
                    elevation: 2.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9999.0),
                    ),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5E3FF),
                        borderRadius: BorderRadius.circular(9999.0),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).divider,
                          width: 1.0,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed(DashboardWidget.routeName);
                              },
                              child: wrapWithModel(
                                model: _model.navItemModel1,
                                updateCallback: () => safeSetState(() {}),
                                child: NavItemWidget(
                                  active: false,
                                  icon: Icon(
                                    Icons.home,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24.0,
                                  ),
                                  label: 'Home',
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed(VibesWidget.routeName);
                              },
                              child: wrapWithModel(
                                model: _model.navItemModel2,
                                updateCallback: () => safeSetState(() {}),
                                child: NavItemWidget(
                                  active: true,
                                  icon: Icon(
                                    Icons.chat_bubble_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    size: 16.0,
                                  ),
                                  label: 'Chats',
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed(UserPersonaWidget.routeName);
                              },
                              child: wrapWithModel(
                                model: _model.navItemModel3,
                                updateCallback: () => safeSetState(() {}),
                                child: const NavItemWidget(
                                  active: false,
                                  icon: Icon(
                                    Icons.face_retouching_natural_rounded,
                                    size: 18.0,
                                  ),
                                  label: 'Persona',
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed(SettingsWidget.routeName);
                              },
                              child: wrapWithModel(
                                model: _model.navItemModel4,
                                updateCallback: () => safeSetState(() {}),
                                child: const NavItemWidget(
                                  active: false,
                                  icon: FaIcon(
                                    FontAwesomeIcons.futbol,
                                    size: 18.0,
                                  ),
                                  label: 'Settings',
                                ),
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
          ],
        ),
      ),
    );
  }
}
