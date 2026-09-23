import '/components/intel_card_widget.dart';
import '/components/perm_pending_sheet_widget.dart';
import '/components/social_tag_widget.dart';
import '/components/vibe_stat_pill_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'public_persona_model.dart';
export 'public_persona_model.dart';

class PublicPersonaWidget extends StatefulWidget {
  const PublicPersonaWidget({
    super.key,
    this.partnerId,
    this.fields,
  });

  final String? partnerId;
  final List<String>? fields;

  static String routeName = 'PublicPersona';
  static String routePath = '/publicPersona';

  @override
  State<PublicPersonaWidget> createState() => _PublicPersonaWidgetState();
}

class _PublicPersonaWidgetState extends State<PublicPersonaWidget> {
  late PublicPersonaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PublicPersonaModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.fetchProfile = await actions.fetchRevealedProfile(
        widget.partnerId!,
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
    return genzPage(Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          primary: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    child: SizedBox(
                      height: 480.0,
                      child: CachedNetworkImage(
                        fadeInDuration: const Duration(milliseconds: 0),
                        fadeOutDuration: const Duration(milliseconds: 0),
                        imageUrl: valueOrDefault<String>(
                          getJsonField(
                            _model.fetchProfile,
                            r'''$.data.photo''',
                          )?.toString(),
                          'https://images.unsplash.com/photo-1494790108377-be9c29b29330?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwzfHxnaXJsfGVufDB8fHx8MTc4MzkyNTg5NHww&ixlib=rb-4.1.0&q=80&w=1080',
                        ),
                        width: double.infinity,
                        height: 480.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xCC000000),
                          Color(0x44000000),
                          Colors.transparent
                        ],
                        stops: [0.0, 0.4, 1.0],
                        begin: AlignmentDirectional(0.0, -1.0),
                        end: AlignmentDirectional(0, 1.0),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, -1.0),
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          FlutterFlowIconButton(
                            borderRadius: 9999.0,
                            buttonSize: 40.0,
                            icon: Icon(
                              Icons.arrow_back_ios_new_rounded,
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              size: 24.0,
                            ),
                            onPressed: () async {
                              context.safePop();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 4.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFF00A0FF),
                              borderRadius: BorderRadius.circular(9999.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 4.0, 16.0, 4.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.verified_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    size: 14.0,
                                  ),
                                  RichText(
                                    textScaler:
                                        MediaQuery.of(context).textScaler,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: valueOrDefault<String>(
                                            getJsonField(
                                              _model.fetchProfile,
                                              r'''$.data.verification_status''',
                                            )?.toString(),
                                            'Verified',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .labelSmall
                                              .override(
                                                font: GoogleFonts.roboto(
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelSmall
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelSmall
                                                        .fontStyle,
                                              ),
                                        ),
                                        const TextSpan(
                                          text: ' Vibe',
                                          style: TextStyle(),
                                        )
                                      ],
                                      style: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .override(
                                            font: GoogleFonts.roboto(
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmall
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelSmall
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                ].divide(const SizedBox(width: 4.0)),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          valueOrDefault<String>(
                            getJsonField(
                              _model.fetchProfile,
                              r'''$.data.full_name''',
                            )?.toString(),
                            'Asish Patnala',
                          ),
                          textAlign: TextAlign.start,
                          style: FlutterFlowTheme.of(context)
                              .headlineLarge
                              .override(
                                font: GoogleFonts.urbanist(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .fontStyle,
                                ),
                                color: FlutterFlowTheme.of(context).primary,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .headlineLarge
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .headlineLarge
                                    .fontStyle,
                              ),
                        ),
                        Text(
                          '${valueOrDefault<String>(
                            getJsonField(
                              _model.fetchProfile,
                              r'''$.data.age''',
                            )?.toString(),
                            '22',
                          )}, ${valueOrDefault<String>(
                            getJsonField(
                              _model.fetchProfile,
                              r'''$.data.gender''',
                            )?.toString(),
                            'Male',
                          )}',
                          textAlign: TextAlign.start,
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
                                color: FlutterFlowTheme.of(context).info,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .fontStyle,
                              ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.location_on_rounded,
                              color: FlutterFlowTheme.of(context).accent1,
                              size: 18.0,
                            ),
                            Opacity(
                              opacity: 0.9,
                              child: Text(
                                valueOrDefault<String>(
                                  getJsonField(
                                    _model.fetchProfile,
                                    r'''$.data.location_city''',
                                  )?.toString(),
                                  'Vijayawada, AP',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.poppins(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                          ].divide(const SizedBox(width: 8.0)),
                        ),
                      ].divide(const SizedBox(height: 8.0)),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(
                    20.0, 10.0, 20.0, 10.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    wrapWithModel(
                      model: _model.vibeStatPillModel1,
                      updateCallback: () => safeSetState(() {}),
                      child: VibeStatPillWidget(
                        bg: FlutterFlowTheme.of(context).primary,
                        border_color: FlutterFlowTheme.of(context).primary,
                        label: 'COMPATIBILITY',
                        text_color:
                            FlutterFlowTheme.of(context).primaryBackground,
                        value: valueOrDefault<String>(
                          getJsonField(
                            _model.fetchProfile,
                            r'''$.data.match_score''',
                          )?.toString(),
                          '98%',
                        ),
                      ),
                    ),
                    wrapWithModel(
                      model: _model.vibeStatPillModel2,
                      updateCallback: () => safeSetState(() {}),
                      child: VibeStatPillWidget(
                        bg: FlutterFlowTheme.of(context).secondaryBackground,
                        border_color: FlutterFlowTheme.of(context).divider,
                        label: 'VIBE CHECK',
                        text_color: FlutterFlowTheme.of(context).primaryText,
                        value: valueOrDefault<String>(
                          functions.generateRandomVibe(),
                          'Chill',
                        ),
                      ),
                    ),
                    wrapWithModel(
                      model: _model.vibeStatPillModel3,
                      updateCallback: () => safeSetState(() {}),
                      child: VibeStatPillWidget(
                        bg: FlutterFlowTheme.of(context).secondary,
                        border_color: FlutterFlowTheme.of(context).secondary,
                        label: 'CHATS',
                        text_color:
                            FlutterFlowTheme.of(context).primaryBackground,
                        value: valueOrDefault<String>(
                          getJsonField(
                            _model.fetchProfile,
                            r'''$.data.chats_count''',
                          )?.toString(),
                          '24',
                        ),
                      ),
                    ),
                  ].divide(const SizedBox(width: 8.0)),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(-1.0, 0.0),
                      child: Text(
                        'AI Persona',
                        style: FlutterFlowTheme.of(context).titleLarge.override(
                              font: GoogleFonts.poppins(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .fontStyle,
                            ),
                      ),
                    ),
                    Text(
                      valueOrDefault<String>(
                        getJsonField(
                          _model.fetchProfile,
                          r'''$.data.summary_bio''',
                        )?.toString(),
                        'Summary of Bio',
                      ),
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
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                  ].divide(const SizedBox(height: 16.0)),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Personal Intel',
                          style: FlutterFlowTheme.of(context)
                              .titleMedium
                              .override(
                                font: GoogleFonts.poppins(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontStyle,
                                ),
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .fontStyle,
                              ),
                        ),
                        Icon(
                          Icons.fingerprint_rounded,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 22.0,
                        ),
                      ],
                    ),
                    wrapWithModel(
                      model: _model.intelCardModel1,
                      updateCallback: () => safeSetState(() {}),
                      child: IntelCardWidget(
                        icon_bg: 'background',
                        icon: 'alternate_email_rounded',
                        icon_color: FlutterFlowTheme.of(context).primary,
                        label: 'Email',
                        value: valueOrDefault<String>(
                          getJsonField(
                            _model.fetchProfile,
                            r'''$.data.email''',
                          )?.toString(),
                          'xxx@xxx.com',
                        ),
                        is_locked: true,
                      ),
                    ),
                    wrapWithModel(
                      model: _model.intelCardModel2,
                      updateCallback: () => safeSetState(() {}),
                      child: IntelCardWidget(
                        icon_bg: 'background',
                        icon: 'phone_iphone_rounded',
                        icon_color: FlutterFlowTheme.of(context).secondary,
                        label: 'Mobile',
                        value: valueOrDefault<String>(
                          getJsonField(
                            _model.fetchProfile,
                            r'''$.data.phone''',
                          )?.toString(),
                          '+100(1102002)-11',
                        ),
                        is_locked: true,
                      ),
                    ),
                    wrapWithModel(
                      model: _model.intelCardModel3,
                      updateCallback: () => safeSetState(() {}),
                      child: IntelCardWidget(
                        icon_bg: 'background',
                        icon: 'language_rounded',
                        icon_color: FlutterFlowTheme.of(context).accent1,
                        label: 'Website',
                        value: valueOrDefault<String>(
                          getJsonField(
                            _model.fetchProfile,
                            r'''$.data.social.website''',
                          )?.toString(),
                          'https://asish.com',
                        ),
                        is_locked: false,
                      ),
                    ),
                  ].divide(const SizedBox(height: 16.0)),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Text(
                        'Social Presence',
                        style: FlutterFlowTheme.of(context)
                            .titleMedium
                            .override(
                              font: GoogleFonts.poppins(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .fontStyle,
                            ),
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
                        wrapWithModel(
                          model: _model.socialTagModel1,
                          updateCallback: () => safeSetState(() {}),
                          child: SocialTagWidget(
                            bg: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            color: FlutterFlowTheme.of(context).primary,
                            icon: FaIcon(
                              FontAwesomeIcons.squareInstagram,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 12.0,
                            ),
                            lable: valueOrDefault<String>(
                              '@${getJsonField(
                                _model.fetchProfile,
                                r'''$.data.social.insta_id''',
                              ).toString()}',
                              'Asish_patnala',
                            ),
                          ),
                        ),
                        wrapWithModel(
                          model: _model.socialTagModel2,
                          updateCallback: () => safeSetState(() {}),
                          child: SocialTagWidget(
                            bg: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            color: const Color(0xFF0051FF),
                            icon: const Icon(
                              Icons.facebook,
                              color: Color(0xFF0051FF),
                              size: 12.0,
                            ),
                            lable: valueOrDefault<String>(
                              '@${getJsonField(
                                _model.fetchProfile,
                                r'''$.data.social.fb_id''',
                              ).toString()}',
                              'Asish_patnala',
                            ),
                          ),
                        ),
                        wrapWithModel(
                          model: _model.socialTagModel3,
                          updateCallback: () => safeSetState(() {}),
                          child: SocialTagWidget(
                            bg: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            color: FlutterFlowTheme.of(context).primaryText,
                            icon: const Icon(
                              Icons.tiktok_outlined,
                              size: 14.0,
                            ),
                            lable: valueOrDefault<String>(
                              '@${getJsonField(
                                _model.fetchProfile,
                                r'''$.data.social.tiktok_id''',
                              ).toString()}',
                              'Asish_patnala',
                            ),
                          ),
                        ),
                        wrapWithModel(
                          model: _model.socialTagModel4,
                          updateCallback: () => safeSetState(() {}),
                          child: SocialTagWidget(
                            bg: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            color: FlutterFlowTheme.of(context).accent1,
                            icon: FaIcon(
                              FontAwesomeIcons.twitter,
                              color: FlutterFlowTheme.of(context).accent1,
                              size: 14.0,
                            ),
                            lable: valueOrDefault<String>(
                              '@${getJsonField(
                                _model.fetchProfile,
                                r'''$.data.social.x_handle''',
                              ).toString()}',
                              'Asish_patnala',
                            ),
                          ),
                        ),
                        wrapWithModel(
                          model: _model.socialTagModel5,
                          updateCallback: () => safeSetState(() {}),
                          child: SocialTagWidget(
                            bg: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            color: FlutterFlowTheme.of(context).success,
                            icon: FaIcon(
                              FontAwesomeIcons.spotify,
                              color: FlutterFlowTheme.of(context).success,
                              size: 14.0,
                            ),
                            lable: valueOrDefault<String>(
                              '@${getJsonField(
                                _model.fetchProfile,
                                r'''$.data.social.spotify_url''',
                              ).toString()}',
                              'Asish_patnala',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ].divide(const SizedBox(height: 16.0)),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(20.0, 5.0, 20.0, 10.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    _model.reqres = await actions.callManagePermRequest(
                      widget.partnerId!,
                      '',
                      false,
                      'request',
                    );
                    if (!context.mounted) return;
                    await showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      enableDrag: false,
                      context: context,
                      builder: (context) {
                        return Padding(
                          padding: MediaQuery.viewInsetsOf(context),
                          child: const PermPendingSheetWidget(),
                        );
                      },
                    ).then((value) => safeSetState(() {}));

                    safeSetState(() {});
                  },
                  text: 'Permanent Connection',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 50.0,
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        16.0, 0.0, 16.0, 0.0),
                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                        0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          font: GoogleFonts.poppins(
                            fontWeight: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontStyle,
                          ),
                          color: Colors.white,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleSmall
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        ),
                    elevation: 0.0,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
              ),
              Container(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        0.0, 0.0, 0.0, 32.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.auto_awesome_rounded,
                              color: FlutterFlowTheme.of(context).accent1,
                              size: 16.0,
                            ),
                            Text(
                              'Identity secured by VibeCheck AI',
                              style: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .override(
                                    font: GoogleFonts.urbanist(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context).hint,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .fontStyle,
                                  ),
                            ),
                          ].divide(const SizedBox(width: 8.0)),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 0.0),
                          child: Container(
                            width: 40.0,
                            height: 4.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).divider,
                              borderRadius: BorderRadius.circular(9999.0),
                            ),
                          ),
                        ),
                      ].divide(const SizedBox(height: 4.0)),
                    ),
                  ),
                ),
              ),
            ].divide(const SizedBox(height: 0.0)),
          ),
        ),
      ),
    ));
  }
}
