import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'ice_breaker_card_model.dart';
export 'ice_breaker_card_model.dart';

class IceBreakerCardWidget extends StatefulWidget {
  const IceBreakerCardWidget({
    super.key,
    this.icon,
    this.category,
    this.text,
    this.usage_count,
  });

  final String? icon;
  final String? category;
  final String? text;
  final String? usage_count;

  @override
  State<IceBreakerCardWidget> createState() => _IceBreakerCardWidgetState();
}

class _IceBreakerCardWidgetState extends State<IceBreakerCardWidget> {
  late IceBreakerCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IceBreakerCardModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return genzFade(Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
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
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).divider,
            width: 1.0,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.celebration_rounded,
                        color: FlutterFlowTheme.of(context).primary,
                        size: 20.0,
                      ),
                    ),
                  ),
                  FlutterFlowChoiceChips(
                    options: const [ChipData('Funny')],
                    onChanged: (val) => safeSetState(
                        () => _model.choiceChipsValue = val?.firstOrNull),
                    selectedChipStyle: ChipStyle(
                      backgroundColor:
                          FlutterFlowTheme.of(context).primaryBackground,
                      textStyle: TextStyle(
                        color: FlutterFlowTheme.of(context).secondaryText,
                      ),
                      iconColor: FlutterFlowTheme.of(context).secondaryText,
                      iconSize: 0.0,
                      labelPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      elevation: 0.0,
                      borderWidth: 0.0,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    unselectedChipStyle: ChipStyle(
                      backgroundColor: const Color(0x00000000),
                      textStyle: TextStyle(
                        color: FlutterFlowTheme.of(context).secondaryText,
                      ),
                      iconColor: FlutterFlowTheme.of(context).secondaryText,
                      iconSize: 0.0,
                      labelPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      elevation: 0.0,
                      borderWidth: 0.0,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    chipSpacing: 0.0,
                    multiselect: false,
                    initialized: _model.choiceChipsValue != null,
                    controller: _model.choiceChipsValueController ??=
                        FormFieldController<List<String>>(
                      ['Funny'],
                    ),
                    wrapped: false,
                  ),
                ],
              ),
              Text(
                valueOrDefault<String>(
                  widget.text,
                  'What\'s the most embarrassing thing that\'s happened to you on a first date?',
                ),
                maxLines: 3,
                style: FlutterFlowTheme.of(context).titleMedium.override(
                      font: GoogleFonts.poppins(
                        fontWeight:
                            FlutterFlowTheme.of(context).titleMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleMedium.fontStyle,
                      ),
                      color: FlutterFlowTheme.of(context).primaryText,
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).titleMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).titleMedium.fontStyle,
                    ),
                overflow: TextOverflow.ellipsis,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    valueOrDefault<String>(
                      widget.usage_count,
                      'Used 1.2k times',
                    ),
                    style: FlutterFlowTheme.of(context).labelSmall.override(
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
                          fontStyle:
                              FlutterFlowTheme.of(context).labelSmall.fontStyle,
                        ),
                  ),
                  FFButtonWidget(
                    onPressed: () {
                      debugPrint('Button pressed ...');
                    },
                    text: 'Select',
                    icon: const Icon(
                      Icons.send_rounded,
                      size: 15.0,
                    ),
                    options: FFButtonOptions(
                      width: 100.0,
                      height: 36.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconColor: FlutterFlowTheme.of(context).primaryBackground,
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle: TextStyle(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        fontWeight: FontWeight.w600,
                        fontSize: 14.0,
                      ),
                      elevation: 0.0,
                      borderRadius: BorderRadius.circular(9999.0),
                    ),
                  ),
                ],
              ),
            ].divide(const SizedBox(height: 8.0)),
          ),
        ),
      ),
    ));
  }
}
