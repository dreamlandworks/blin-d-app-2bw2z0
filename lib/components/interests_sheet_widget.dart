import '/components/interested_chip_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'interests_sheet_model.dart';
export 'interests_sheet_model.dart';

class InterestsSheetWidget extends StatefulWidget {
  const InterestsSheetWidget({super.key});

  @override
  State<InterestsSheetWidget> createState() => _InterestsSheetWidgetState();
}

class _InterestsSheetWidgetState extends State<InterestsSheetWidget> {
  late InterestsSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InterestsSheetModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      safeSetState(() {});
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return genzSheet(Container(
      width: double.infinity,
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
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(24.0, 32.0, 24.0, 32.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
              child: Text(
                'More Interests?',
                style: FlutterFlowTheme.of(context).headlineSmall.override(
                      font: GoogleFonts.urbanist(
                        fontWeight: FlutterFlowTheme.of(context)
                            .headlineSmall
                            .fontWeight,
                        fontStyle: FlutterFlowTheme.of(context)
                            .headlineSmall
                            .fontStyle,
                      ),
                      color: FlutterFlowTheme.of(context).primary,
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).headlineSmall.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 30.0),
              child: Builder(
                builder: (context) {
                  final interestedChips =
                      FFAppState().Interests.map((e) => e).toList();

                  return Wrap(
                    spacing: 10.0,
                    runSpacing: 10.0,
                    alignment: WrapAlignment.start,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    direction: Axis.horizontal,
                    runAlignment: WrapAlignment.start,
                    verticalDirection: VerticalDirection.down,
                    clipBehavior: Clip.none,
                    children: List.generate(interestedChips.length,
                        (interestedChipsIndex) {
                      final interestedChipsItem =
                          interestedChips[interestedChipsIndex];
                      return InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          if (FFAppState()
                                  .onboard
                                  .interests
                                  .contains(interestedChipsItem.label) ==
                              true) {
                            FFAppState().updateOnboardStruct(
                              (e) => e
                                ..updateInterests(
                                  (e) => e.remove(interestedChipsItem.label),
                                ),
                            );
                            safeSetState(() {});
                          } else {
                            FFAppState().updateOnboardStruct(
                              (e) => e
                                ..updateInterests(
                                  (e) => e.add(interestedChipsItem.label),
                                ),
                            );
                            safeSetState(() {});
                          }
                        },
                        child: wrapWithModel(
                          model: _model.interestedChipModels.getModel(
                            interestedChipsIndex.toString(),
                            interestedChipsIndex,
                          ),
                          updateCallback: () => safeSetState(() {}),
                          child: InterestedChipWidget(
                            key: Key(
                              'Keybz5_${interestedChipsIndex.toString()}',
                            ),
                            label:
                                '${interestedChipsItem.icon} ${interestedChipsItem.label}',
                            selected: FFAppState()
                                    .onboard
                                    .interests
                                    .contains(interestedChipsItem.label) ==
                                true,
                          ),
                        ),
                      );
                    }),
                  );
                },
              ),
            ),
            FFButtonWidget(
              onPressed: () async {
                Navigator.pop(context);
              },
              text: 'Close',
              icon: const Icon(
                Icons.task_alt,
                size: 18.0,
              ),
              options: FFButtonOptions(
                width: double.infinity,
                height: 40.0,
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).primary,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      font: GoogleFonts.poppins(
                        fontWeight:
                            FlutterFlowTheme.of(context).titleSmall.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleSmall.fontStyle,
                      ),
                      color: Colors.white,
                      fontSize: 16.0,
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).titleSmall.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).titleSmall.fontStyle,
                    ),
                elevation: 0.0,
                borderRadius: BorderRadius.circular(24.0),
              ),
            ),
          ].divide(const SizedBox(height: 12.0)),
        ),
      ),
    ));
  }
}
