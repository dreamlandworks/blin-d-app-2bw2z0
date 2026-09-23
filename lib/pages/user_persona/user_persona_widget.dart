import '/auth/firebase_auth/auth_util.dart';
import '/components/nav_item_widget.dart';
import '/components/persona_trait_widget.dart';
import '/components/stat_card_widget.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'user_persona_model.dart';
export 'user_persona_model.dart';

class UserPersonaWidget extends StatefulWidget {
  const UserPersonaWidget({super.key});

  static String routeName = 'UserPersona';
  static String routePath = '/userPersona';

  @override
  State<UserPersonaWidget> createState() => _UserPersonaWidgetState();
}

class _UserPersonaWidgetState extends State<UserPersonaWidget> {
  late UserPersonaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserPersonaModel());
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
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
              child: SingleChildScrollView(
                primary: false,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 520.0,
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(0.0),
                            child: Container(
                              height: 500.0,
                              decoration: BoxDecoration(
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
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                              child: Stack(
                                children: [
                                  AuthUserStreamWidget(
                                    builder: (context) => CachedNetworkImage(
                                      fadeInDuration: const Duration(milliseconds: 0),
                                      fadeOutDuration:
                                          const Duration(milliseconds: 0),
                                      imageUrl: valueOrDefault<String>(
                                        currentUserPhoto,
                                        'https://dimg.dreamflow.cloud/v1/image/stunning gen z girl with purple neon hair, cinematic lighting, aesthetic portrait',
                                      ),
                                      height: 500.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        24.0, 8.0, 24.0, 8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(9999.0),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width: 30.0,
                                            height: 30.0,
                                            decoration: const BoxDecoration(
                                              color: Color(0x81EC4899),
                                              shape: BoxShape.circle,
                                            ),
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.safePop();
                                              },
                                              child: Icon(
                                                Icons.chevron_left_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 24.0,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 90.0,
                                            height: 25.0,
                                            decoration: BoxDecoration(
                                              color: const Color(0x95111827),
                                              borderRadius:
                                                  BorderRadius.circular(24.0),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                FaIcon(
                                                  FontAwesomeIcons.coins,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .warning,
                                                  size: 16.0,
                                                ),
                                                Text(
                                                  valueOrDefault<String>(
                                                    FFAppState()
                                                        .coins
                                                        .toString(),
                                                    '0',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelLarge
                                                      .override(
                                                        font: GoogleFonts
                                                            .plusJakartaSans(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelLarge
                                                                  .fontStyle,
                                                        ),
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge
                                                                .fontStyle,
                                                        lineHeight: 1.3,
                                                      ),
                                                ),
                                              ].divide(const SizedBox(width: 8.0)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: Image.network(
                                          '',
                                        ).image,
                                      ),
                                    ),
                                    alignment: const AlignmentDirectional(0.0, 1.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          boxShadow: const [
                                            BoxShadow(
                                              blurRadius: 8.0,
                                              color: Color(0x1A000000),
                                              offset: Offset(
                                                0.0,
                                                4.0,
                                              ),
                                              spreadRadius: 0.0,
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(24.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .divider,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  RichText(
                                                    textScaler:
                                                        MediaQuery.of(context)
                                                            .textScaler,
                                                    text: TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text: valueOrDefault<
                                                              String>(
                                                            currentUserDocument
                                                                ?.realId
                                                                .fullName,
                                                            'Alex',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .poppins(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                        TextSpan(
                                                          text: ', ',
                                                          style: GoogleFonts
                                                              .poppins(
                                                            fontSize: 20.0,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text: valueOrDefault<
                                                              String>(
                                                            functions
                                                                .calculateAge(
                                                                    currentUserDocument
                                                                        ?.realId
                                                                        .dob)
                                                                .toString(),
                                                            '22',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .poppins(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .fontStyle,
                                                              ),
                                                        )
                                                      ],
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineSmall
                                                              .override(
                                                                font: GoogleFonts
                                                                    .plusJakartaSans(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w800,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 20.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w800,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmall
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                    maxLines: 3,
                                                  ),
                                                  Container(
                                                    width: 12.0,
                                                    height: 12.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .success,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              9999.0),
                                                      border: Border.all(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        width: 2.0,
                                                      ),
                                                    ),
                                                  ),
                                                ].divide(const SizedBox(width: 8.0)),
                                              ),
                                              AuthUserStreamWidget(
                                                builder: (context) => Text(
                                                  valueOrDefault<String>(
                                                    currentUserDocument
                                                        ?.aiPersona
                                                        .threeWordDescription,
                                                    'Artist • Dreamer • Midnight Snacker',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .spaceGrotesk(
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                        lineHeight: 1.5,
                                                      ),
                                                ),
                                              ),
                                            ].divide(const SizedBox(height: 4.0)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: AuthUserStreamWidget(
                                    builder: (context) => wrapWithModel(
                                      model: _model.statCardModel1,
                                      updateCallback: () => safeSetState(() {}),
                                      child: StatCardWidget(
                                        value: valueOrDefault<double>(
                                          currentUserDocument
                                              ?.appStats.chatsCount
                                              .toDouble(),
                                          24.0,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        label: 'Matches',
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: AuthUserStreamWidget(
                                    builder: (context) => wrapWithModel(
                                      model: _model.statCardModel2,
                                      updateCallback: () => safeSetState(() {}),
                                      child: StatCardWidget(
                                        value: valueOrDefault<double>(
                                          currentUserDocument
                                              ?.appStats.avgRating,
                                          8.6,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        label: 'Avg Score',
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: AuthUserStreamWidget(
                                    builder: (context) => wrapWithModel(
                                      model: _model.statCardModel3,
                                      updateCallback: () => safeSetState(() {}),
                                      child: StatCardWidget(
                                        value: valueOrDefault<double>(
                                          currentUserDocument
                                              ?.appStats.vibeScore
                                              .toDouble(),
                                          23.0,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .accent1,
                                        label: 'Vibe Score',
                                      ),
                                    ),
                                  ),
                                ),
                              ].divide(const SizedBox(width: 16.0)),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
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
                                  color: FlutterFlowTheme.of(context).divider,
                                  width: 1.0,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(24.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                              .accent1,
                                          size: 20.0,
                                        ),
                                        Text(
                                          'AI PERSONALITY SUMMARY',
                                          style: FlutterFlowTheme.of(context)
                                              .labelSmall
                                              .override(
                                                font:
                                                    GoogleFonts.plusJakartaSans(
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelSmall
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .hint,
                                                fontSize: 11.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelSmall
                                                        .fontStyle,
                                                lineHeight: 1.2,
                                              ),
                                        ),
                                      ].divide(const SizedBox(width: 8.0)),
                                    ),
                                    AuthUserStreamWidget(
                                      builder: (context) => Text(
                                        valueOrDefault<String>(
                                          currentUserDocument
                                              ?.aiPersona.summaryBio,
                                          'Maya radiates a \'Creative Dreamer\' energy. Her profile suggests a high emotional intelligence with a penchant for deep midnight conversations and aesthetic exploration. Most likely to send you a curated playlist than a \'hey\'.',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.spaceGrotesk(
                                                fontWeight: FontWeight.normal,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                              lineHeight: 1.6,
                                            ),
                                      ),
                                    ),
                                  ].divide(const SizedBox(height: 16.0)),
                                ),
                              ),
                            ),
                            if ('1' == '1')
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'VIBE ENERGY',
                                    style: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          font: GoogleFonts.spaceGrotesk(
                                            fontWeight: FontWeight.w800,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 17.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w800,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleMedium
                                                  .fontStyle,
                                          lineHeight: 1.4,
                                        ),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    height: 200.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(24.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .divider,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: AuthUserStreamWidget(
                                      builder: (context) => SizedBox(
                                        width: double.infinity,
                                        height: 200.0,
                                        child: FlutterFlowLineChart(
                                          data: [
                                            FFLineChartData(
                                              xData: _model.days,
                                              yData: (currentUserDocument
                                                                  ?.appStats
                                                                  .vibeHistory !=
                                                              null &&
                                                          (currentUserDocument
                                                                  ?.appStats
                                                                  .vibeHistory)!
                                                              .isNotEmpty) ==
                                                      true
                                                  ? currentUserDocument!
                                                      .appStats.vibeHistory
                                                      .map((e) => e.score)
                                                      .toList()
                                                  : _model.vibeData,
                                              settings: LineChartBarData(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                barWidth: 2.0,
                                                isCurved: true,
                                                dotData: const FlDotData(show: false),
                                                belowBarData: BarAreaData(
                                                  show: true,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                ),
                                              ),
                                            )
                                          ],
                                          chartStylingInfo: ChartStylingInfo(
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            showBorder: false,
                                          ),
                                          axisBounds: const AxisBounds(
                                            minY: 0.0,
                                            maxY: 100.0,
                                          ),
                                          xAxisLabelInfo: AxisLabelInfo(
                                            title: 'Days',
                                            titleTextStyle:
                                                GoogleFonts.spaceGrotesk(
                                              fontSize: 14.0,
                                            ),
                                            reservedSize: 32.0,
                                          ),
                                          yAxisLabelInfo: AxisLabelInfo(
                                            title: 'Vibe',
                                            titleTextStyle:
                                                GoogleFonts.spaceGrotesk(
                                              fontSize: 14.0,
                                            ),
                                            reservedSize: 40.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ].divide(const SizedBox(height: 16.0)),
                              ),
                            if (currentUserDocument?.aiPersona.mainTraits !=
                                null)
                              AuthUserStreamWidget(
                                builder: (context) => Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      'PERSONA TRAITS',
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            font: GoogleFonts.spaceGrotesk(
                                              fontWeight: FontWeight.w800,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 17.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w800,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .fontStyle,
                                            lineHeight: 1.4,
                                          ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .divider,
                                          width: 1.0,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(24.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            wrapWithModel(
                                              model: _model.personaTraitModel1,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: PersonaTraitWidget(
                                                label: 'Romantic',
                                                score: ((valueOrDefault<double>(
                                                              currentUserDocument
                                                                  ?.aiPersona
                                                                  .mainTraits
                                                                  .romance,
                                                              85.0,
                                                            ) *
                                                            100.0)
                                                        .clamp(0.0, 100.0))
                                                    .round()
                                                    .toDouble(),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                              ),
                                            ),
                                            wrapWithModel(
                                              model: _model.personaTraitModel2,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: PersonaTraitWidget(
                                                label: 'Empathy',
                                                score: ((valueOrDefault<double>(
                                                              currentUserDocument
                                                                  ?.aiPersona
                                                                  .mainTraits
                                                                  .empathy,
                                                              85.0,
                                                            ) *
                                                            100.0)
                                                        .clamp(0.0, 100.0))
                                                    .round()
                                                    .toDouble(),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                              ),
                                            ),
                                            wrapWithModel(
                                              model: _model.personaTraitModel3,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: PersonaTraitWidget(
                                                label: 'Emotional',
                                                score: ((valueOrDefault<double>(
                                                              currentUserDocument
                                                                  ?.aiPersona
                                                                  .mainTraits
                                                                  .emotionalDepth,
                                                              85.0,
                                                            ) *
                                                            100.0)
                                                        .clamp(0.0, 100.0))
                                                    .round()
                                                    .toDouble(),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                              ),
                                            ),
                                            wrapWithModel(
                                              model: _model.personaTraitModel4,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: PersonaTraitWidget(
                                                label: 'Loyal',
                                                score: ((valueOrDefault<double>(
                                                              currentUserDocument
                                                                  ?.aiPersona
                                                                  .mainTraits
                                                                  .loyalty,
                                                              85.0,
                                                            ) *
                                                            100.0)
                                                        .clamp(0.0, 100.0))
                                                    .round()
                                                    .toDouble(),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .success,
                                              ),
                                            ),
                                            wrapWithModel(
                                              model: _model.personaTraitModel5,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: PersonaTraitWidget(
                                                label: 'Curious',
                                                score: ((valueOrDefault<double>(
                                                              currentUserDocument
                                                                  ?.aiPersona
                                                                  .mainTraits
                                                                  .curiosity,
                                                              85.0,
                                                            ) *
                                                            100.0)
                                                        .clamp(0.0, 100.0))
                                                    .round()
                                                    .toDouble(),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent1,
                                              ),
                                            ),
                                          ].divide(const SizedBox(height: 16.0)),
                                        ),
                                      ),
                                    ),
                                  ].divide(const SizedBox(height: 16.0)),
                                ),
                              ),
                            Container(),
                          ].divide(const SizedBox(height: 24.0)),
                        ),
                      ),
                    ),
                  ].divide(const SizedBox(height: 0.0)),
                ),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(0.0, 1.0),
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(),
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 15.0),
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
                                child: const NavItemWidget(
                                  active: false,
                                  icon: Icon(
                                    Icons.chat_bubble_rounded,
                                    size: 18.0,
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
                                child: NavItemWidget(
                                  active: true,
                                  icon: Icon(
                                    Icons.face_retouching_natural_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
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
    ));
  }
}
